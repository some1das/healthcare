const mysql = require("mysql");
const dotenv = require("dotenv");
dotenv.config();
const connection = mysql.createConnection({
  port: 3306,
  host: "localhost",
  user: process.env.USER,
  password: process.env.PASSWORD,
  database: "healthcare",
});

connection.connect((err) => {
  if (!err) {
    console.log("Connected successfully");
  } else {
    console.log("Error :(");
  }
});

module.exports = connection;
