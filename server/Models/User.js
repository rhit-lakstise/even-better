const mongoose = require('mongoose');

const UserSchema = mongoose.Schema(
    {
        "username": {
            type: String,
            required: true
        },
        "rose-username": {
            type: String,
            required: true
        },
        "verification-token": String,
        "verified": Boolean,
        "pfp-uri": String,
        "bio": String,
        "friends": [String],
    })

module.exports = mongoose.model('UserModel', UserSchema)