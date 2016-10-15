var express = require('express');
var app = express();

//Constants
const PORT = 8080;

app.use(express.static('public'));

app.listen(PORT, function () {
  console.log('Example app listening on port ' + PORT);
});