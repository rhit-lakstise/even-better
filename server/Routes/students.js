const Student = require('../Models/Student');
const express = require('express');
const router = express.Router();



router.get('/all', async (req, res) => {
    try{
        const students = await Student.find();
        res.json(users);
    } catch(err){
        res.json({message: "Error!"})
    }
})

router.post('/create', (req, res) => {
    console.log('creating student')
    console.log(req.body)
    const user = new User({
        "first-name": req.body['first-name'],
        "last-name": req.body['last-name'],
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