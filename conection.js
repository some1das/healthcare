const mysql = require("mysql");
const connection = mysql.createConnection({
  port: 3306,
  host: "localhost",
  user: "root",
  password: "admin",
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
