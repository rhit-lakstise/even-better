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
        "poster": String,
        "timestamp": Number
    })

module.exports = mongoose.model('PostModel', PostSchema)