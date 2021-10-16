const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser')

require('dotenv/config')
const app = express();
app.use(bodyParser.json());




const userRoute = require('./Routes/users');
const postRoute = require('./Routes/posts');
const studentRoute = require('./Routes/students');

app.use('/users', userRoute);
app.use('/posts', postRoute);
app.use('/sutdents', studentRoute);


mongoose.connect(process.env.DB_CONNECT, {useNewUrlParser: true}, () => console.log('Connected'));


app.listen(3000);