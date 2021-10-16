const mongoose = require('mongoose');

const PostSchema = mongoose.Schema(
    {

        "rose-username": {
            type: String,
            required: true,
        },
        "first-name": {
            type: String,
            required: true,
        },
        "last-name": {
            type: String,
            required: true,
        }

        //No need to have an email field because it's just rose-usernmae@rose-hulman.edu
    })

module.exports = mongoose.model('StudentModel', PostSchema)