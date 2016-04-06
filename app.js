var express = require('express');
var app = express();

//app.get('/', function (req, res) {
//  res.send('Hello World!');
//});


app.use('/', express.static('taiga-front-dist/dist'));
app.use('/media', express.static('taiga-back/images'));
app.use('/static', express.static('taiga-back/static'));

app.listen(3000, function () {
  console.log('TaigaIO listening on port 3000');
});
