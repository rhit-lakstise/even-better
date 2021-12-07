const express = require('express');
const router = express.Router();


router.post('/register', (req, res) => {
    username = req.body['username']
    password = req.body['password']


    res.json({
        message: 'message',
    })
})


module.exports = router;


