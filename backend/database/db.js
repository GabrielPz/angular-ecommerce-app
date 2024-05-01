const mysql = require("mysql");

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'myapp',
  
});

connection.connect((err) => {
  if (err) console.log(err);
  else console.log("MySQL is connected...");
});

module.exports = connection;
