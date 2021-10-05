const mongoose = require('mongoose');

const PostSchema = mongoose.Schema(
    {

        "title": {
            type: String,
            required: true,
        },
        "description": String,
        "picture-uri": String,
        "likes": Number,
    })

module.exports = mongoose.model('PostModel', PostSchema)