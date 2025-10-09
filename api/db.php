<?php


$isLocal = in_array($_SERVER['HTTP_HOST'], ['localhost', '127.0.0.1']);

if ($isLocal) {
    // --- Connexion locale ---
    define('DB_HOST', 'localhost');
    define('DB_NAME', 'nabstar');
    define('DB_USER', 'root');
    define('DB_PASS', '');
} else {
    // --- Connexion en ligne (InfinityFree) ---
    define('DB_HOST', 'sqlXXX.infinityfree.com');
    define('DB_NAME', 'epiz_XXXXXXX_nabstar');
    define('DB_USER', 'nabstar123');
    define('DB_PASS', 'nabstar123');
}

define('DB_CHARSET', 'utf8mb4');

function getPDO(): PDO {
    static $pdo = null;

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
                ]
            );
        } catch (PDOException $e) {
            error_log("Database connection error: " . $e->getMessage());
            http_response_code(500);
            echo json_encode(['success' => false, 'error' => 'Database connection failed']);
            exit;
        }
    }

    return $pdo;
}
