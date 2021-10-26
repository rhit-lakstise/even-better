var RosefireTokenVerifier = require('rosefire-node');
const express = require('express');
const router = express.Router();

var rosefire = new RosefireTokenVerifier("3482813e-62c6-4d21-aa85-519e9d70dc49");

router.post('/rose_login', function (req, res) {
  var token = req.headers.authorization;
  if (!token) {
    res.status(401).json({
      error: 'Not authorized!'
    });
    return;
  }
  token = token.split(' ')[1]; 
  rosefire.verify(token, function(err, authData) {
    if (err) {
      res.status(401).json({
        error: 'Not authorized!'
      });
    } else {
      console.log(authData.username); // rockwotj
      console.log(authData.issued_at); // <Date Object of issued time> 
      console.log(authData.group); // STUDENT (Only there if options asked)
      console.log(authData.expires) // <Date Object> (Only there if options asked)
      res.json(authData);
    }
  });
});
