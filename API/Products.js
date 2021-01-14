var express = require("express");
var router = express.Router();
const mysql = require('mysql');
//mysql connection needed properties
var con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "chivasregal",
    database:"store_project"
});

//our query to take data from database
let query = "SELECT * FROM product";


//connect to database , throw error if occurs
con.connect(function(err) {
    if (err) throw err;
    console.log("Connected!");
});

//query part
con.query(query,function (err,result,fields) {
    //if error throw it
if(err)
{
    throw err;
}
//if no error send results
    router.get("/",function (req,res) {
        res.send(result);
    })

});

//export router in order to use eit on server.js
module.exports = router;