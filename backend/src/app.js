const express = require('express');
const bodyParser = require('body-parser');
const dotenv = require('dotenv');
const path = require('path');
const logger = require('morgan');
const db = require('./config/db/index');
const route = require('./routes/index');

db.connect();

dotenv.config({path: path.resolve(__dirname, './config/.env')});
const app = express();
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended: false}));
app.use(logger("dev"));
app.use(express.static("public"))
app.set("view engine", "ejs");
app.set("views", "./views");

route(app);



module.exports = app;