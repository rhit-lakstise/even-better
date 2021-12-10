const User = require('../Models/User');
const express = require('express');
const router = express.Router();
const student = require('../Models/Student');


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

module.exports = router;