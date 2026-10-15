<?php
require_once __DIR__ . '/common.php';
require_once __DIR__ . '/rows.php';
$error = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    check_token();
    try {
        $values = validate_input($model);
        $names = array_keys($values);
        $columns = implode(', ', array_map(fn($n) => "`$n`", $names));
        $holders = implode(', ', array_map(fn($n) => ":$n", $names));
        $table = $model['table'];
        $stmt = db($model)->prepare(
            "INSERT INTO `$table` ($columns) VALUES ($holders)"
        );
        $stmt->execute($values);
        goto_home();
    } catch (InvalidArgumentException $ex) {
        $error = $ex->getMessage();
    }
}
$search = trim((string)($_GET['q'] ?? ''));
try {
    $records = fetch_rows($model, $search);
} catch (PDOException $ex) {
    http_response_code(500);
    $error = 'Database connection failed. Check setup and credentials.';
    $records = [];
}
?>
<!doctype html><html lang="en"><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title><?= e($model['title']) ?></title>
<link rel="stylesheet" href="style.css"></head><body>
<header><h1><?= e($model['title']) ?></h1>
<p>PHP · MySQL · structured records</p></header>
<main>
<section class="card"><h2>Add new record</h2>
<?php if ($error): ?><p role="alert" class="alert"><?= e($error) ?></p><?php endif; ?>
<form method="post" action="index.php"><input type="hidden" name="csrf"
 value="<?= e(token()) ?>"><div class="fields">
<?php foreach ($model['fields'] as $key => $def): ?>
<div><label for="f_<?= e($key) ?>"><?= e($def['label']) ?></label>
<?php if ($def['type'] === 'textarea'): ?>
<textarea required id="f_<?= e($key) ?>" name="<?= e($key) ?>"></textarea>
<?php else: ?>
<input required id="f_<?= e($key) ?>" name="<?= e($key) ?>"
 type="<?= e($def['type'] === 'integer' ? 'number' :
   ($def['type'] === 'number' ? 'number' : $def['type'])) ?>"
 <?= in_array($def['type'], ['number','integer'], true)
      ? 'min="0" step="' . ($def['type'] === 'integer' ? '1' : '0.01') . '"' : '' ?>>
<?php endif; ?></div>
<?php endforeach; ?></div><div class="actions">
<button type="submit">Save record</button></div></form>
</section>
<section class="card"><h2><?= e($model['list_label']) ?></h2>
<?php if ($model['search']): ?>
<?php if ($model['ajax']): ?>
<div class="search"><label for="live-search">Live search</label>
<input id="live-search" autocomplete="off" placeholder="Search records" aria-label="Live search"></div>
<?php else: ?>
<form class="search" method="get"><label for="search">Search product / category</label>
<input id="search" name="q" value="<?= e($search) ?>">
<div class="actions"><button type="submit">Search</button>
<a class="button muted" href="index.php">Clear</a></div></form>
<?php endif; endif; ?>
<div class="table-wrap"><table><thead><tr><th>ID</th>
<?php foreach ($model['fields'] as $def): ?><th><?= e($def['label']) ?></th><?php endforeach; ?>
<th>Actions</th></tr></thead><tbody id="data-body">
<?php render_rows($records, $model); ?>
</tbody></table></div></section></main>
<?php if ($model['ajax']): ?>
<script>
const searchBox = document.querySelector('#live-search');
const tbody = document.querySelector('#data-body');
let waitHandle;
searchBox.addEventListener('input', () => {
  clearTimeout(waitHandle);
  waitHandle = setTimeout(async () => {
    try {
      const response = await fetch('search.php?q=' +
        encodeURIComponent(searchBox.value));
      if (!response.ok) throw new Error('Search failed');
      tbody.innerHTML = await response.text();
    } catch (_) {
      tbody.innerHTML = '<tr><td>Unable to load results.</td></tr>';
    }
  }, 180);
});
</script>
<?php endif; ?>
</body></html>
