<?php
$pdo=new PDO("mysql:host=localhost;dbname=nabstar;charset=utf8mb4","root","");

//params
$offset =isset($_GET['offset'])?(int)$_GET['offset']:0;
$limit=isset($_GET['limit'])?(int)$_GET['limit']:6;

$stmt=$pdo->prepare("SELECT name
                            FROM areas
                            WHERE is_active=1
                            LIMIT :limit OFFSET :offset");

$stmt->bindValue('limit',$limit,PDO::PARAM_INT);
$stmt->bindValue('offset',$offset,PDO::PARAM_INT);
$stmt->execute();

$areas=$stmt->fetchAll(PDO::FETCH_ASSOC);

header('Content-Type: application/json');
echo json_encode($areas);
?>