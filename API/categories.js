var express = require("express");
var router = express.Router();
//add mysql
const mysql = require('mysql');

//mysql connection needed properties
var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "chivasregal",
    database:"store_project"
});

//connect to database , throw error if occurs
con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
});


let query = "SELECT * FROM categories";

var results = [];


con.query(query,function (err,result,fields) {
    if(err)
    {
        throw err;
    }

    Object.keys(result).forEach(function(key) {
        var row = result[key];
        results.push(row);
    });

})



router.get("/",function (req,res,next) {
    res.send(results);
})

module.exports = router;