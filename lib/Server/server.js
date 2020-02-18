 
var SquareConnect = require('square-connect');
var defaultClient = SquareConnect.ApiClient.instance;
var app = require('express')();
var bodyParser = require('body-parser');
var bodyParser = require('body-parser')
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({
    extended: true
}));
app.get("/", (request, response) => {
  if (request.query.nonce == null) {
    response.send({
      code: 400,
      message: "nonce not found"
    })
  }
   
    
  var oauth2 = defaultClient.authentications['oauth2'];
  oauth2.accessToken = 'EAAAEMlez2BUfO8KTN48fDBhZvD3ADcWodhGcTr21brV2tefZHlGhtlsZqFmhOZl';
  var transactionApi = new SquareConnect.TransactionsApi();
  transactionApi.charge("sq0idp-Ub9xz0mzfWawh2XtcMiwig", {
    idempotency_key: new Date(),
    card_nonce: request.query.nonce,
    amount_money: {
      amount: 1,
      currency: "USD"
    }
  }).then(function (data) {
    console.log('API called successfully. Returned data: ' + JSON.stringify(data));
    response.send(data);
  }, function (error) {
    console.error(JSON.parse(error.response.text).errors[0].detail);
    response.send(error);
  });
})
// Replace the IP address with your own local IP
app.listen(8080, '192.168.8.207', () => {
    console.log("Server running...");
})