<?php
require_once "../api/db.php";
require_once "../api/helpers.php";

setHeaders();

try {
    $pdo = getPDO();

    // Compter les messages non lus
    $stmt = $pdo->prepare("SELECT COUNT(*) AS NumberMessage FROM contacts WHERE seen = 0");
    $stmt->execute();
    $NumberMessage = $stmt->fetch(PDO::FETCH_ASSOC)['NumberMessage'] ?? 0;

    // Récupérer les messages (même lus pour l'affichage)
    $stmt = $pdo->prepare("SELECT id, name, email, phone, service_id, message, seen, created_at FROM contacts ORDER BY created_at DESC LIMIT 10");
    $stmt->execute();
    $Messages = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode([
        'success' => true,
        'NumberMessage' => $NumberMessage,
        'data' => $Messages
    ]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'error' => $e->getMessage()
    ]);
}
?>
