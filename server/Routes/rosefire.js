var RosefireTokenVerifier = require('rosefire-node');
const express = require('express');
  const jwt = require('njwt')
const router = express.Router();

let secret ="weCPEXRyXWeYIkOmWKUk"; 
// let token ="JWT 13b72349-fe0e-4e6a-b2ec-7065d6ee4039"; 
var rosefire = new RosefireTokenVerifier(secret);
//stuff is here: X:\sethl\SeniorProject\EvenBetter\even-better\server\node_modules\jsonwebtoken\index.js
router.post('/rose_login',  (req, res) => {
  // this.issued_at = decodedJwt.iat;
  // this.username = decodedJwt.d.uid;
  // this.group = decodedJwt.d.group;
  // this.name = decodedJwt.d.name;
  // this.expires_at = decodedJwt.exp; 
  // this.provider = decodedJwt.d.provider;
  // this.email = this.username + "@rose-hulman.edu";






  const claims = { uid: "lakstise", jti: "13b72349-fe0e-4e6a-b2ec-7065d6ee4039"}
  let token = jwt.create(claims, secret)
  token.setExpiration(new Date().getTime() + 60*1000)
  // res.send(token.compact())

  console.log(rosefire);
  console.log("rose_login starting\n");
  req.headers.authorization = token;
  console.log(req.headers);
  console.log(token);
  token  =token.toString();
  console.log(token);

  if (!token) {
    res.status(401).json({
      error: 'Not authorized!'
    });
    return;
  }
  // token = token.split(' ')[1]; 
  rosefire.verify(token, function(err, authData) {
    if (err) {
      res.status(401).json({
        error: err
      });
      console.log(err);
    } else {
      console.log(authData.username); // rockwotj
      console.log(authData.issued_at); // <Date Object of issued time> 
      console.log(authData.group); // STUDENT (Only there if options asked)
      console.log(authData.expires) // <Date Object> (Only there if options asked)
      res.json(authData);
    }
  });
});


module.exports = router;