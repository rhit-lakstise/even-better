const Post = require('../Models/Post');
const express = require('express');
const router = express.Router();

router.get('/all', async (req, res) => {
    try{
        res.write("success!");
        console.log('made it to all')
        const posts = await Post.find();

        res.json(posts);
    } catch(err){
        res.json({message: "Error!"})
    }
})

router.post('/create', (req, res) => {
    console.log('creating post')
    console.log(req.body)
    const post = new Post({
        "title": req.body.title,
        "description": req.body.description || "",
        "picture-uri": req.body['picture-uri'] || "",
        "likes": req.body.likes || 0
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