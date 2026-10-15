<?php
return [
    'title' => 'Customer Management with AJAX',
    'database' => 'customer_db',
    'table' => 'customers',
    'pk' => 'customer_id',
    'order' => 'name',
    'list_label' => 'Customer List',
    'ajax' => true,
    'search' => ['name', 'city'],
    'fields' => [
        'name' => ['label' => 'Name', 'type' => 'text', 'max' => 100],
        'email' => ['label' => 'Email', 'type' => 'email', 'max' => 140],
        'phone' => ['label' => 'Phone', 'type' => 'text', 'max' => 25],
        'city' => ['label' => 'City', 'type' => 'text', 'max' => 80],
    ],
];
