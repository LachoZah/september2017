var express = require('express');
var app = express();

app.set('port', (process.env.PORT || 5000));
 
app.post('/sum', function (req, res) {
        res.end(parseInt(req.query.a) + parseInt(req.query.b) + '');
});

app.listen(app.get('port'), function() {
  console.log('Node app is running on port', app.get('port'));
});
