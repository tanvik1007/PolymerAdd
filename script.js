fetch('DEMO.php')
  .then(response => response.text())
  .then(data => {
    document.getElementById('result').innerHTML = data;
  });