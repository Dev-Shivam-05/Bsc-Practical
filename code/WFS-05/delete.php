<?php
require_once __DIR__ . '/common.php';
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405); exit('POST required.');
}
check_token();
$id = positive_id($_POST['id'] ?? null);
$table = $model['table'];
$pk = $model['pk'];
$stmt = db($model)->prepare("DELETE FROM `$table` WHERE `$pk` = :id");
$stmt->execute(['id' => $id]);
goto_home();
