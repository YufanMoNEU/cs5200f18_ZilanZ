module.exports = function () {
    const mongoose = require('mongoose');
    const databaseName = "white-board";
    var connString = "mongodb://localhost/";
    connString += databaseName;
    mongoose.connect(connString);
};