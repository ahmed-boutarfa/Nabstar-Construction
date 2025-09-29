<?php
require_once 'db.php';
require_once 'helpers.php';

setHeaders();

try {
    [$offset, $limit] = getPaginationParams();
    $pdo = getPDO();

    $stmt = $pdo->prepare("
        SELECT id, name, description, icon, created_at
        FROM services
        WHERE is_active = 1
        ORDER BY created_at DESC
        LIMIT :limit OFFSET :offset
    ");
    $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
    $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
    $stmt->execute();

    $services = $stmt->fetchAll();

    $total = $pdo->query("SELECT COUNT(*) FROM services WHERE is_active = 1")->fetchColumn();

    echo json_encode([
        'success' => true,
        'data' => $services,
        'pagination' => [
            'offset' => $offset,
            'limit' => $limit,
            'total' => (int)$total,
            'has_more' => ($offset + $limit) < $total
        ],
        'timestamp' => date('c')
    ]);

} catch (Exception $e) {
    http_response_code(500);
    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
}
