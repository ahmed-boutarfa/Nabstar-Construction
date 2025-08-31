<?php
    $pdo = new PDO("mysql:host=localhost;dbname=nabstar;charset=utf8mb4", "root", "");

    // params
    $offset = isset($_GET['offset']) ? (int)$_GET['offset'] : 0;
    $limit  = isset($_GET['limit']) ? (int)$_GET['limit'] : 6;

    $stmt = $pdo->prepare("SELECT id, name, description, icon 
                           FROM services 
                           ORDER BY created_at DESC 
                           LIMIT :limit OFFSET :offset");
    $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
    $stmt->bindValue(':offset', $offset, PDO::PARAM_INT);
    $stmt->execute();

    $services = $stmt->fetchAll(PDO::FETCH_ASSOC);

    header('Content-Type: application/json');
    echo json_encode($services);
?>