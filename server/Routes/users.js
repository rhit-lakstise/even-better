const User = require('../Models/User');
const express = require('express');
const router = express.Router();
const student = require('../Models/Student');
const nodemailer = require('nodemailer');


router.get('/all', async (req, res) => {
    try{
        const users = await User.find();
        res.json(users);
    } catch(err){
        res.json({message: "Error!"})
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
        res.json({message: err})
    })
})

router.post('/delete', async (req, res) =>  {
    console.log('deleting user ' + req.body['rose-username']);
    const deleted = await User.deleteOne({'rose-username': req.body['rose-username']}).catch(err => {res.json({message: err})})
    if(deleted['deletedCount'] == 1)  res.json({message: 'successfully deleted '+ req.body['rose-username']})   
    else res.json({message: 'could not find user '+ req.body['rose-username']})
    

})
router.post('/sendValidationEmail', async (req, res) => {

//     var toUpdate = await Student.find({"rose-username": req.body['rose-username']});
//     toUpdate[0]['status'] = "pending";
//     const result = await Student.updateOne({"_id": toUpdate[0]['_id']}, toUpdate[0])
//   .catch(err => {
//       res.json({message: err})
//   })
//     console.log(result)
    
    var transporter = nodemailer.createTransport({
        service: 'gmail',
        auth: {
          user: 'UtsukushiiNee@gmail.com',
          pass: 'ilovekousei123'
        }
      });
      
      var mailOptions = {
        from: 'Kaori Miyazono',
        to: req.body['rose-username']+'@rose-hulman.edu',
        subject: req.body['inviter']+' Invites you to join Even Better',
        text: ''
      };
      
      transporter.sendMail(mailOptions, function(error, info){
        if (error) {
          console.log(error);
          res.json({message: error});
        } else {
          console.log('Email sent: ' + info.response);
        }
      });
      

      res.json({
          message: 'Successfully sent user verification link!'
      });
    
})
module.exports = router;