<?php
include 'config.php';

$category = $_GET['category'] ?? '';

if (!empty($category)) {
    $sql = "SELECT s.*, c.name as category_name 
            FROM solutions s 
            JOIN categories c ON s.category_id = c.id 
            WHERE c.name LIKE '%$category%' 
            ORDER BY s.title";
    
    $result = $conn->query($sql);
    
    $solutions = [];
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $solutions[] = $row;
        }
    }
    
    echo json_encode($solutions);
} else {
    echo json_encode([]);
}

$conn->close();
?>