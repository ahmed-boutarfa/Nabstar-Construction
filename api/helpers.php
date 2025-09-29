<?php
// helpers.php : fonctions utilitaires

// Headers CORS & JSON
function setHeaders() {
    header('Content-Type: application/json; charset=utf-8');
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: GET, OPTIONS');
    header('Access-Control-Allow-Headers: Content-Type');

    if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
        http_response_code(200);
        exit();
    }
}

// Validation des paramètres
function getPaginationParams(int $defaultLimit = 6, int $maxLimit = 50): array {
    $offset = filter_input(INPUT_GET, 'offset', FILTER_VALIDATE_INT, [
        'options' => ['default' => 0, 'min_range' => 0]
    ]);

    $limit = filter_input(INPUT_GET, 'limit', FILTER_VALIDATE_INT, [
        'options' => ['default' => $defaultLimit, 'min_range' => 1, 'max_range' => $maxLimit]
    ]);

    return [$offset, $limit];
}
