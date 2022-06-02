const mysql = require('mysql');


const connection = mysql.createConnection({
    host     : 'localhost',
    user     : 'root',
    password : 'Ankit@1201',
    database : 'test'
});

connection.connect(function(err) {
    if (err) {
        console.error('error connecting: ' + err.stack);
        return;
    }

    console.log('connected');
});

module.exports=connection;

