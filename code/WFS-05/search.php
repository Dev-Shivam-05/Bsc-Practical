<?php
require_once __DIR__ . '/common.php';
require_once __DIR__ . '/rows.php';
header('Content-Type: text/html; charset=utf-8');
try {
    $q = trim((string)($_GET['q'] ?? ''));
    render_rows(fetch_rows($model, $q), $model);
} catch (PDOException $ex) {
    http_response_code(500);
    echo '<tr><td>Search unavailable.</td></tr>';
}
