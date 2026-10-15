<?php
return [
    'title' => 'Employee Management System',
    'database' => 'employee_db',
    'table' => 'employees',
    'pk' => 'id',
    'order' => 'id',
    'list_label' => 'Employee List',
    'ajax' => false,
    'search' => [],
    'fields' => [
        'name' => ['label' => 'Name', 'type' => 'text', 'max' => 100],
        'email' => ['label' => 'Email', 'type' => 'email', 'max' => 140],
        'department' => ['label' => 'Department', 'type' => 'text', 'max' => 80],
        'designation' => ['label' => 'Designation', 'type' => 'text', 'max' => 80],
        'salary' => ['label' => 'Salary', 'type' => 'number', 'max' => 30],
    ],
];
