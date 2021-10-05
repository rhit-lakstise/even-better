const User = require('../Models/User');
const express = require('express');
const router = express.Router();



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
        "password": req.body.password,
        "rose-username": req.body['rose-username']
    });

    user.save()
    .then(data => {
        res.json(data);
    })
    .catch(err => {
        res.json({message: err})
    })
})

module.exports = router;