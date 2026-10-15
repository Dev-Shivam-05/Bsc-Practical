<?php
return [
    'title' => 'Course Management System',
    'database' => 'course_db',
    'table' => 'courses',
    'pk' => 'course_id',
    'order' => 'course_id',
    'list_label' => 'Course List',
    'ajax' => false,
    'search' => [],
    'fields' => [
        'course_name' => ['label' => 'Course Name', 'type' => 'text', 'max' => 120],
        'duration' => ['label' => 'Duration', 'type' => 'text', 'max' => 60],
        'fees' => ['label' => 'Fees', 'type' => 'number', 'max' => 30],
        'course_description' => ['label' => 'Course Description', 'type' => 'textarea', 'max' => 1000],
    ],
];
