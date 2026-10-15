<?php
return [
    'title' => 'Mobile Shop Management with AJAX',
    'database' => 'mobile_db',
    'table' => 'mobiles',
    'pk' => 'mobile_id',
    'order' => 'price',
    'list_label' => 'Mobile Stock List',
    'ajax' => true,
    'search' => ['brand', 'model'],
    'fields' => [
        'brand' => ['label' => 'Brand', 'type' => 'text', 'max' => 80],
        'model' => ['label' => 'Model', 'type' => 'text', 'max' => 120],
        'price' => ['label' => 'Price', 'type' => 'number', 'max' => 30],
        'stock' => ['label' => 'Stock', 'type' => 'integer', 'max' => 20],
    ],
];
