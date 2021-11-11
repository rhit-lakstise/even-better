const mongoose = require('mongoose');

const PostSchema = mongoose.Schema(
    {

        "rose-username": {
            type: String,
            required: true,
        },
        "name": {
            type: String,
            required: true,
        },
        "status": {
            type: String,
            required: true,
        },
        "major": {
            type: String,
            required: true,
        },
        "year": {
            type: String,
            required: true,
        },
        

    })

module.exports = mongoose.model('StudentModel', PostSchema)