var express = require('express');
var morgan = require('morgan');
var uuid = require('node-uuid');

morgan.token('id', function getId (req) {
  return req.id
})

var app = express();

app.use(assignId);
//app.use(morgan(':id :method :url :response-time'));
app.use(morgan("timestamp=:date[iso], remote-addr=:remote-addr, remote-user=:remote-user, method=:method, url=:url, htp-line=\":method :url HTTP/:http-version\", status=:status, content-length=:res[content-length], content-type=:res[content-type], accept=:req[accept], referrer=\":referrer\",  user-agent=\":user-agent\", response-time=:response-time"));

//Constants
const PORT = 8080;

app.use(express.static('public'));

app.listen(PORT, function () {
  console.log('Example app listening on port ' + PORT);
});

function assignId (req, res, next) {
  req.id = uuid.v4()
  next()
};
