<?php
declare(strict_types=1);

session_start();
$model = require __DIR__ . '/model.php';
require_once __DIR__ . '/db.php';

function e($value): string {
    return htmlspecialchars((string)$value, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
}
function token(): string {
    if (empty($_SESSION['csrf'])) {
        $_SESSION['csrf'] = bin2hex(random_bytes(32));
    }
    return $_SESSION['csrf'];
}
function check_token(): void {
    if (!hash_equals(token(), (string)($_POST['csrf'] ?? ''))) {
        http_response_code(403); exit('Invalid CSRF token.');
    }
}
function positive_id($input): int {
    $id = filter_var($input, FILTER_VALIDATE_INT);
    if ($id === false || $id < 1) {
        http_response_code(400); exit('Invalid record identifier.');
    }
    return $id;
}
function validate_input(array $model): array {
    $values = [];
    foreach ($model['fields'] as $key => $definition) {
        $value = trim((string)($_POST[$key] ?? ''));
        if ($value === '') {
            throw new InvalidArgumentException($definition['label'] . ' is required.');
        }
        switch ($definition['type']) {
            case 'email':
                if (!filter_var($value, FILTER_VALIDATE_EMAIL)) {
                    throw new InvalidArgumentException('Invalid email address.');
                }
                break;
            case 'number':
                if (!is_numeric($value) || (float)$value < 0) {
                    throw new InvalidArgumentException('Invalid amount.');
                }
                break;
            case 'integer':
                if (!ctype_digit($value)) {
                    throw new InvalidArgumentException('Enter a non-negative integer.');
                }
                break;
        }
        if (strlen($value) > ($definition['max'] ?? 1000)) {
            throw new InvalidArgumentException($definition['label'] . ' is too long.');
        }
        $values[$key] = $value;
    }
    return $values;
}
function fetch_rows(array $model, string $search = ''): array {
    $table = $model['table'];
    $order = $model['order'];
    $sql = "SELECT * FROM `$table`";
    $params = [];
    if ($search !== '' && !empty($model['search'])) {
        $clauses = [];
        foreach ($model['search'] as $i => $column) {
            $placeholder = ":q$i";
            $clauses[] = "`$column` LIKE $placeholder";
            $params[$placeholder] = '%' . $search . '%';
        }
        $sql .= ' WHERE ' . implode(' OR ', $clauses);
    }
    $sql .= " ORDER BY `$order` ASC";
    $stmt = db($model)->prepare($sql);
    $stmt->execute($params);
    return $stmt->fetchAll();
}
function goto_home(): void {
    header('Location: index.php');
    exit;
}
