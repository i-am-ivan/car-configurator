// Setting up the express server
const express = require('express');
const exphbs = require('express-handlebars');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const sql = require('mssql');

require('dotenv').config();

const app = express();
const port = process.env.PORT || 3000;

// DB connection string
var dbConnection = {
    user: "...",
    password: "...",
    server: "l192.168.100.102",
    driver: "msnnodesql",
    database: "cconfigurator",
    connectionString: ""
};

// Parsing middleware
// Parse application
app.use(bodyParser.urlencoded({ extended: false }));

// Parse application/json
app.use(bodyParser.json());
// Static files
app.use(express.static('public'));

// Templating Engine
app.engine('hbs', exphbs.engine({ extname: '.hbs' }));
app.set('view engine', 'hbs');

// Render frontpage
app.get('', (req, res) => {
    res.render('home')
});

// Render Summary page
app.get('/configurators', (req, res) => {
    res.render('configurators')
})

// Render Edit page
app.get('/edit', (req, res) => {
    res.render('edit')
})

// Deploy server
app.listen(port, () => console.log(`\n Listening on port ${port}`));