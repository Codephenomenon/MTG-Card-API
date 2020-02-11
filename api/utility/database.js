// Connect to a local MAMP Database:
const mysql = require('mysql');

const dbConnect = mysql.createConnection({
    socketPath : '/Applications/MAMP/tmp/mysql/mysql.sock',
    host: 'localhost',
    user: 'magicAdmin', 
    password: 'mypassword123',
    database: 'MagicCardApi'
});

dbConnect.connect(function(error) {
    if (error) {
        console.log('There is an error connecting to the Database.');
    } else {
        console.log('Connecting to the Database.');
    }
});

module.exports = dbConnect;