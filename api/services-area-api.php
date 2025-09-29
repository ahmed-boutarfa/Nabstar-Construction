<?php
require_once 'db.php';
require_once 'helpers.php';

setHeaders();

try {
    [$offset, $limit] = getPaginationParams(); 
    $pdo = getPDO();

    $stmt = $pdo->prepare("
        SELECT id, name, description, created_at
        FROM areas
        WHERE is_active = 1
        ORDER BY name ASC
        LIMIT :limit OFFSET :offset
    ");
    $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
    $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
    $stmt->execute();

    $areas = $stmt->fetchAll(PDO::FETCH_ASSOC);

    $total = $pdo->query("SELECT COUNT(*) FROM areas WHERE is_active = 1")->fetchColumn();

    echo json_encode([
        'success' => true,
        'data' => $areas,
        'pagination' => [
            'offset' => $offset,
            'limit' => $limit,
            'total' => (int)$total
        ],
        'timestamp' => time()
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
}
