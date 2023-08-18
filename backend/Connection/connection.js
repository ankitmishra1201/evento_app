const mysql = require('mysql');

// /usr/local/mysql/bin/mysql -u root -p
const connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : 'root123',
    database : 'test',
   
});

connection.connect(function(err) {
    if (err) {
        console.error('error connecting: ' + err.stack);
        return;
    }

    console.log('connected');
});

module.exports=connection;

