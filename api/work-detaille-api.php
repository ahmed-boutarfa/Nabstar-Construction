<?php
require_once 'db.php';
require_once 'helpers.php';

// Check id
if(!isset($_GET["id"])){
    echo json_encode(["status"=>"error","message"=>"No Id Provided"]);
    exit;
}

$id = $_GET["id"];
$pdo=getPDO();

// Get project
$projectstmt = $pdo->prepare("SELECT title, bio, location, `total-area` as total_area,
               duration,image FROM works WHERE title = ?");
$projectstmt->execute([$id]);
$project = $projectstmt->fetch(PDO::FETCH_ASSOC);
if(!$project){
    echo json_encode(["status"=>"error","message"=>"Project Not Found"]);
    exit;
}

// Get gallery (all images related to this project)
$gallerystmt = $pdo->prepare("SELECT * FROM gallery WHERE title = ?");
$gallerystmt->execute([$project["title"]]);
$gallery = $gallerystmt->fetchAll(PDO::FETCH_ASSOC);

// Final response
echo json_encode([
    "status" => "success",
    "data" => [
        "project" => $project,
        "gallery" => $gallery
    ]
]);
