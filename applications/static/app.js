var express = require('express');
var app = express();

app.use(express.static('public'));

app.listen(3000, function () {
  console.log('Joe Rice Architect Site listening on port 3000!');
});

