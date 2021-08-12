// var connectionString = "postgres://userName:password@serverName/ip:port/nameOfDatabase";

// var pgClient = new pg.Client(connectionString);

// pgClient.connect();
const express = require('express');
var pg = require('pg');
const keys = require('./config.js');
console.log(keys.key);
const { Pool } = require('pg');
// var config = {
//     user: 'postgres',
//     database: 'stellar',
//     password: 'secret',
//     host: 'localhost',
//     port: 5432,
//     max: 10, // max number of clients in the pool
//     idleTimeoutMillis: 30000
// };
// const pool = new Pool(config);
// pool.on('error', function (err, client) {
//     console.error('idle client error', err.message, err.stack);
// });
// pool.query('SELECT $1::int AS number', ['2'], function(err, res) {
//     if(err) {
//         return console.error('error running query', err);
//     }
//     console.log('number:', res.rows[0].number);
// });



const app = express()
const port = 3000
// var connectionString = `postgres://userName:password@serverName/ip:port/nameOfDatabase`;



app.get('/', (req, res) => {
  res.send('Hello World!')
})

app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})
