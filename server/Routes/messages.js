const Conversation = require('../Models/Conversation');
const express = require('express');
const router = express.Router();

router.get('/all', async (req, res) => {
    try{
        console.log('made it to getting all conversations')
        const conversations = await Conversation.find();

        res.json(conversations);
    } catch(err){
        res.json({message: "Error!"})
    }
})

router.get('/conversation', async (req, res) => {
    try{
        console.log('made it to getting specific conversation '+ req.query['sender']+ 'a'+req.query['recipient'])
        const conversation = await Conversation.find({$or: [{"users": [req.query['sender'], req.query['recipient']]}, {"users": [req.query['recipient'], req.query['sender']]}]});
        res.json(conversation[0]);
    } catch(err){
        res.json({message: "Error!"})
    }
})




module.exports = router;