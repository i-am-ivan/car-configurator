// Setting up the express server
const express = require('express');
const exphbs = require('express-handlebars');
const bodyParser = require('body-parser');
const mysql = require('mysql');

require('dotenv').config();

const app = express();
const port = process.env.PORT || 3000;

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

// Deploy server
app.listen(port, () => console.log(`\n Listening on port ${port}`));