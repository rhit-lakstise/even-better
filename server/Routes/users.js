const User = require('../Models/User');
const express = require('express');
const router = express.Router();
const student = require('../Models/Student');
const nodemailer = require('nodemailer');
const rtg = require('random-token-generator');


router.get('/all', async (req, res) => {
  try {
    const users = await User.find();
    res.json(users);
  } catch (err) {
    res.json({
      message: "Error!"
    })
  }
})

router.post('/signup', (req, res) => {
  console.log('creating user')
  console.log(req.body)
  const user = new User({
    "username": req.body.username,
    "rose-username": req.body['rose-username'],
  });

  user.save()
    .then(data => {
      res.json(data);
    })
    .catch(err => {
      res.json({
        message: err
      })
    })
})

router.post('/delete', async (req, res) => {
  console.log('deleting user ' + req.body['rose-username']);
  const deleted = await User.deleteOne({
    'rose-username': req.body['rose-username']
  }).catch(err => {
    res.json({
      message: err
    })
  })
  if (deleted['deletedCount'] == 1) res.json({
    message: 'successfully deleted ' + req.body['rose-username']
  })
  else res.json({
    message: 'could not find user ' + req.body['rose-username']
  })


})

router.post('/sendValidationEmail', async (req, res) => {

  let testAccount = await nodemailer.createTestAccount();

  var transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
      user: 'seth@lakstins.net',
      pass: 'sotmtwwgrmI8'
    }
  });

  rtg.generateKey({
    len: 16,
    string: true,
    strong: false,
    retry: true
  },async (err, key) => {
    console.log(err, key);

    //TODO: upload the code to the database for the user ...

    var toUpdate = await User.find({"rose-username": req.body['rose-username']});
    toUpdate[0]['verification-token'] = key;
    const result = await User.updateOne({"_id": toUpdate[0]['_id']}, toUpdate[0]);
    console.log(toUpdate);
    
    if (err) {

    } else {
      var mailOptions = {
        from: 'Kaori Miyazono',
        to: req.body['rose-username'] + '@rose-hulman.edu',
        subject: "Verify Your Even Better Account",
        html: "<p><a href='https://youtube.com'>click here to verify email</a></p>"
      };
      transporter.sendMail(mailOptions, function (error, info) {
        if (error) {
          console.log(error);
          res.json({
            message: error
          });
        } else {
          console.log('Email sent: ' + info.response);
        }
      });

    }
  });
  res.json({
    message: 'Successfully sent user verification link!'
  });

})

module.exports = router;