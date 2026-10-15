<?php
return [
    'title' => 'Product Management and WHERE Search',
    'database' => 'product_db',
    'table' => 'products',
    'pk' => 'product_id',
    'order' => 'product_id',
    'list_label' => 'Product List & Search',
    'ajax' => false,
    'search' => ['product_name', 'category'],
    'fields' => [
        'product_name' => ['label' => 'Product Name', 'type' => 'text', 'max' => 120],
        'category' => ['label' => 'Category', 'type' => 'text', 'max' => 80],
        'price' => ['label' => 'Price', 'type' => 'number', 'max' => 30],
        'stock' => ['label' => 'Stock', 'type' => 'integer', 'max' => 20],
    ],
];
