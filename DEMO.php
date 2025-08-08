<?php
if (!isset($_SERVER['REQUEST_METHOD']) || $_SERVER['REQUEST_METHOD'] !== 'POST' || !isset($_POST['fetch'])) {
    http_response_code(403);
    echo 'Access Denied.';
    exit;
}

$host = 'localhost';
$port = '5432';
$dbname = 'postgres';
$user = 'postgres';
$password = '123';

$conn = pg_connect("host=$host port=$port dbname=$dbname user=$user password=$password");

if (!$conn) {
    die("Connection failed: " . pg_last_error());
}

$query = "SELECT * FROM company ORDER BY id";
$result = pg_query($conn, $query);

if (!$result) {
    die("Error in SQL query: " . pg_last_error($conn));
}

echo '<table border="0" cellpadding="0" cellspacing="0">';
echo '<tr>
        <th>ID</th><th>Company Name</th><th>Reference</th><th>Contact Person</th>
        <th>Position</th><th>Email 1</th><th>Email 2</th><th>Mobile 1</th>
        <th>Mobile 2</th><th>Pincode</th><th>City</th><th>Country</th>
      </tr>';
while ($row = pg_fetch_assoc($result)) {
    echo '<tr>';
    echo '<td>' . htmlspecialchars($row['id']) . '</td>';
    echo '<td>' . htmlspecialchars($row['COMPANY NAME']) . '</td>';
    echo '<td>' . htmlspecialchars($row['REFERENCE']) . '</td>';
    echo '<td>' . htmlspecialchars($row['CONTACT PERSON']) . '</td>';
    echo '<td>' . htmlspecialchars($row['POSITION']) . '</td>';
    echo '<td>' . htmlspecialchars($row['EMAIL-1']) . '</td>';
    echo '<td>' . htmlspecialchars($row['EMAIL-2']) . '</td>';
    echo '<td>' . htmlspecialchars($row['MOBILE-1']) . '</td>';
    echo '<td>' . htmlspecialchars($row['MOBILE-2']) . '</td>';
    echo '<td>' . htmlspecialchars($row['PIN CODE']) . '</td>';
    echo '<td>' . htmlspecialchars($row['CITY']) . '</td>';
    echo '<td>' . htmlspecialchars($row['COUNTRY']) . '</td>';
    echo '</tr>';
}
echo '</table>';

pg_close($conn);
?>
