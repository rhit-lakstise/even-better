//expects two files in this directory, one named "Software Engineers.json" and the other named "Computer Scientists.json"
const csv = require('csv-parser');
const fs = require('fs');
const mongoose = require('mongoose');

mongoose.connect("mongodb+srv://admin:admin@cluster0.xhabv.mongodb.net/test?retryWrites=true&w=majority", {useNewUrlParser: true}, () => console.log('Connected to db'));

const Student = require('../Models/Student');

async function  upload(){
let rawdata = fs.readFileSync('Computer Scientists.json');
let students = JSON.parse(rawdata);
const major = 'CS';

for(i in students){
  let student = students[i];
  console.log(student);
  const username = student['Email'].split('@')[0]
  let year = "current student"
  let name = student['Name']

  if(name.includes('(')){
    nameSplit = name.split('(');
    name = nameSplit[0].substr(0, nameSplit[0].length -1);
    year = nameSplit[1].substr(0, nameSplit[1].length -1);
  } 
  
  let firstName = name.split(', ')[1];
  let lastName = name.split(', ')[0];
  name = firstName + ' '+lastName;
  console.log(name)


  var toUpdate = await Student.find({"rose-username": username});
  if(toUpdate.length != 0){
    toUpdate[0]['major'] = "CSSE"
    const result = await Student.updateOne({"_id": toUpdate[0]['_id']}, toUpdate[0])
  .catch(err => {
      console.log(err);
  })
    console.log(result)
  }
  else{
    const newUser = new Student({
      "name": name,
      "rose-username": username,
      "year": year,
      "major": major,
      "status": "Invite",
    });
  
  
  
     newUser.save()
     .then()
     .catch(err => {
       console.log(err)
     })
  }

  
}
}

upload()




