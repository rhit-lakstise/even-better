const Comment = require('../Models/Comment');
const express = require('express');
const router = express.Router();

router.get('/all', async (req, res) => {
    try{
        console.log('made it to getting all comments')
        const comments = await Comment.find();

        res.json(comments);
    } catch(err){
        res.json({message: "Error!"})
    }
})

router.post('/get', async (req, res) => {
    try{
        console.log('made it to getting specific comments')
        const comments = await Comment.find({"parent-id": req['parent-id']});
        res.json(comments);
    } catch(err){
        res.json({message: "Error!"})
    }
})


router.post('/create', (req, res) => {
    console.log('creating comment')
    console.log(req.body)
    const comment = new Comment({
        "content": req.body.content || "",
        "likes": req.body.likes || 0,
        "commenter": req.body.commenter,
        "timestamp": req.body.timestamp,
        "parent-id": req.body.['parent-id']
    });

    post.save()
    .then(data => {
        res.json(data);
    })
    .catch(err => {
        res.json({message: err})
    })
})



module.exports = router;