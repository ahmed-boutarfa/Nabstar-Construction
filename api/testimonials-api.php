<?php
require_once 'db.php';
require_once 'helpers.php';

setHeaders();

try {
    $pdo = getPDO();

    $stmt = $pdo->prepare("
        SELECT 
            id,
            client_name,
            company,
            content,
            photo,
            rating,
            approved,
            created_at,
            last_updated_at
        FROM testimonials
        WHERE approved = 1
        ORDER BY created_at DESC
    ");
    $stmt->execute();

    $testimonials = $stmt->fetchAll();

    echo json_encode([
        'success' => true,
        'data' => $testimonials
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
}
