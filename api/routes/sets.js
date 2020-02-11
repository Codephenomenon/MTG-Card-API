const express = require('express');
const router = express.Router();
const dbConnect = require('./utility/database');

router.get('/', (req, res, next) => {
    dbConnect.query("SELECT * FROM mtg_set", function(error, rows, fields) {
        if (error) {
            console.log('There was an error fetching MTG sets.')
        } else {
            res.status(200).json({
                message: 'here is a list of sets:',
                data: rows
            });
        }
    });
});

router.get('/:setId', (req, res, next) => {
    dbConnect.query("SELECT * FROM mtg_set WHERE set_id = (" + req.params.setId + ")", function(error, rows, fields) {
        if (error) {
            console.log('There was an error fetching this specific set.')
        } else {
            res.status(200).json({
                message: 'here is your set:',
                data: rows
            });
        }
    });
});

module.exports = router;