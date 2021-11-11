const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser')

require('dotenv/config')
const app = express();
app.use(bodyParser.json());




const userRoute = require('./Routes/users');
const postRoute = require('./Routes/posts');
const studentRoute = require('./Routes/students');
const rosefireRoute = require('./Routes/rosefire');
const commentsRoute = require('./Routes/comments');
const forumsRoute = require('./Routes/forums');



app.use('/users', userRoute);
app.use('/posts', postRoute);
app.use('/students', studentRoute);
app.use('/rosefire', rosefireRoute);
app.use('/comments', commentsRoute);
app.use('/forums', forumsRoute);



mongoose.connect(process.env.DB_CONNECT, {useNewUrlParser: true}, () => console.log('Connected'));


app.listen(3000);