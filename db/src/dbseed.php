<?php
require 'bootstrap.php';

$filePath = __DIR__.getenv('DB_SEED_PATH');
if (!file_exists($filePath))
{
    throw new Exception('DB_SEED_PATH is invalid\tFile not found');
}

$file = fopen($filePath, 'r');
$statement = fread($file, filesize($filePath));
fclose($file);

try 
{
    $createTable = $dbConnection->exec($statement);
    echo "Success!\n";
}
catch (PDOException $e)
{
    exit($e->getMessage());
}