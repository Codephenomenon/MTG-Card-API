'use strict';

const http = require('http');
const express = require('express');
const app = express();
const logMiddleware = require('morgan');
const bodyParser = require('body-parser');
const cors = require('cors');

const setRoutes = require('./api/routes/sets');
const cardRoutes = require('./api/routes/cards');

// Log requests to API:
app.use(logMiddleware('dev'));

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

app.use(cors());

// Routes handling requests.
app.use('/sets', setRoutes);
app.use('/cards', cardRoutes);

// Handle errors. 
app.use((req, res, next) => {
    const error = new Error('Sorry, we can\'t find that!');
    error.status = 404;
    next(error);
});
app.use((req, res, next) => {
    res.status(error.status || 500);
    res.json({
        error: {
            message: error.message
        }
    });
});

const port = process.env.PORT || 4000;
const server = http.createServer(app);
server.listen(port);