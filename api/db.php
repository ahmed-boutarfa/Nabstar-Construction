<?php
// db.php : fichier de connexion PDO réutilisable

// Configuration
const DB_HOST = 'localhost';
const DB_NAME = 'nabstar';
const DB_CHARSET = 'utf8mb4';
const DB_USER = 'root';
const DB_PASS = '';

function getPDO(): PDO {
    static $pdo = null; // Singleton (connexion unique par requête)

    if ($pdo === null) {
        try {
            $pdo = new PDO(
                "mysql:host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=" . DB_CHARSET,
                DB_USER,
                DB_PASS,
                [
                    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
                    PDO::ATTR_EMULATE_PREPARES => false,
                    PDO::ATTR_PERSISTENT => false
                ]
            );
        } catch (PDOException $e) {
            error_log("Database connection error: " . $e->getMessage());
            http_response_code(500);
            echo json_encode([
                'success' => false,
                'error' => 'Database connection failed'
            ]);
            exit;
        }
    }

    return $pdo;
}
