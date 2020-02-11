const express = require('express');
const router = express.Router();
const dbConnect = require('../utility/database');

router.get('/', (req, res, next) => {
    dbConnect.query("SELECT * FROM mtg_card", function(error, rows, fields) {
        if (error) {
            console.log('There was an error fetching MTG cards.')
        } else {
            res.status(200).json({
                message: 'here is a list of cards:',
                data: rows
            });
        }
    });
});

router.get('/:cardId', (req, res, next) => { 
    dbConnect.query("SELECT * FROM mtg_card WHERE card_id = (" + req.params.cardId + ")", function(error, rows, fields) {
        if (error) {
            console.log('There was an error fetching this specific card.')
        } else {
            res.status(200).json({
                message: 'here is your card:',
                data: rows
            });
        }
    });
});

module.exports = router;