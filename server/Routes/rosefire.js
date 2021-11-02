var RosefireTokenVerifier = require('rosefire-node');
const express = require('express');
// const jwt = require('njwt')
const router = express.Router();
const https = require('https');
const cors = require('cors');


let secret = "weCPEXRyXWeYIkOmWKUk";
// var rosefire = new RosefireTokenVerifier(secret);
//stuff is here: X:\sethl\SeniorProject\EvenBetter\even-better\server\node_modules\jsonwebtoken\index.js
router.post('/rose_login', cors(), (req, res) => {


  console.log("posting...");
  const url = 'https://api.allorigins.win/get?url=https://example.org/=https://rosefire.csse.rose-hulman.edu/v2/api/register';
  let key = "13b72349-fe0e-4e6a-b2ec-7065d6ee4039";


  const options = {
    method: 'POST',
    // host: "api.allorigins.win",
    // method: 'GET',
    // host: "api.allorigins.win",
    // host: "https://api.allorigins.win",
    host: "rosefire.csse.rose-hulman.edu",
    path: "/v2/api/register",
    // path: "/get?callback=myFunc&url=https://example.org/=https://rosefire.csse.rose-hulman.edu/v2/api/register",
    // registryToken: key,
    data: {
      email: "lakstise@rose-hulman.edu",
      password: "sotmtwwgrmI9",
      secret: secret,
    },

  }
  //https://nodejs.org/api/http.html#httprequestoptions-callback

  https.get(options, res => {
    let data = '';
    res.on('data', chunk => {
      data += chunk;
    });
    res.on('end', () => {
      // data = JSON.parse(data);
      console.log("here it is: " + data);
    })
  }).on('error', err => {
    console.log("request error: " + err);
  })
  // console.log(rosefire);

});


module.exports = router;