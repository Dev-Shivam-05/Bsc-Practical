<?php
require_once __DIR__ . '/common.php';
$id = positive_id($_GET['id'] ?? null);
$table = $model['table'];
$pk = $model['pk'];
$stmt = db($model)->prepare("SELECT * FROM `$table` WHERE `$pk` = :id");
$stmt->execute([':id' => $id]);
$row = $stmt->fetch();
if (!$row) { http_response_code(404); exit('Record not found.'); }
$error = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    check_token();
    try {
        $values = validate_input($model);
        $set = implode(', ', array_map(fn($k) => "`$k` = :$k", array_keys($values)));
        $stmt = db($model)->prepare("UPDATE `$table` SET $set WHERE `$pk` = :id");
        $stmt->execute($values + ['id' => $id]);
        goto_home();
    } catch (InvalidArgumentException $ex) {
        $error = $ex->getMessage();
        $row = array_replace($row, $_POST);
    }
}
?>
<!doctype html><html lang="en"><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Edit <?= e($model['title']) ?></title>
<link rel="stylesheet" href="style.css"></head><body>
<header><h1>Edit <?= e($model['title']) ?></h1><p>Record #<?= $id ?></p></header>
<main><section class="card"><h2>Edit record</h2>
<?php if ($error): ?><p class="alert" role="alert"><?= e($error) ?></p><?php endif; ?>
<form method="post"><input type="hidden" name="csrf" value="<?= e(token()) ?>">
<div class="fields">
<?php foreach ($model['fields'] as $key => $def): ?>
<div><label for="f_<?= e($key) ?>"><?= e($def['label']) ?></label>
<?php if ($def['type'] === 'textarea'): ?>
<textarea required id="f_<?= e($key) ?>" name="<?= e($key) ?>"><?= e($row[$key]) ?></textarea>
<?php else: ?>
<input required id="f_<?= e($key) ?>" name="<?= e($key) ?>"
 value="<?= e($row[$key]) ?>"
 type="<?= e($def['type'] === 'integer' ? 'number' :
   ($def['type'] === 'number' ? 'number' : $def['type'])) ?>"
 <?= in_array($def['type'], ['number','integer'], true)
      ? 'min="0" step="' . ($def['type'] === 'integer' ? '1' : '0.01') . '"' : '' ?>>
<?php endif; ?></div>
<?php endforeach; ?></div><div class="actions">
<button type="submit">Update record</button>
<a href="index.php" class="button muted">Cancel</a></div></form>
</section></main></body></html>
