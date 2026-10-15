<?php
function render_rows(array $records, array $model): void {
    if (!$records) {
        echo '<tr><td colspan="' . (count($model['fields']) + 2) . '">'
            . 'No matching records.</td></tr>';
        return;
    }
    foreach ($records as $row) {
        echo '<tr><td>' . e($row[$model['pk']]) . '</td>';
        foreach (array_keys($model['fields']) as $name) {
            echo '<td>' . e($row[$name]) . '</td>';
        }
        $id = (int)$row[$model['pk']];
        echo '<td><a href="edit.php?id=' . $id . '">Edit</a> ';
        echo '<form class="inline" method="post" action="delete.php"'
             . ' onsubmit="return confirm(&quot;Delete this record?&quot;)">';
        echo '<input type="hidden" name="id" value="' . $id . '">';
        echo '<input type="hidden" name="csrf" value="' . e(token()) . '">';
        echo '<button type="submit">Delete</button></form></td></tr>';
    }
}
