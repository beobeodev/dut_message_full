const mongoose = require('mongoose');

async function connect(){
  await mongoose.connect(process.env.DB_LC)
    .then(() => console.log("Connect success"))
    .catch(err => console.log("Connect error: " + err)); 
}

module.exports = {connect}