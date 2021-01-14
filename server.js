//add express
const express = require('express');


const app = express();
//port that we will use as server
const port = 161;

var cors = require("cors");

//start serving
app.listen(port,()=>console.log("App is running"));


//API Part
categoriesAPI = require("./API/categories");
productAPI = require("./API/Products");

//use cors in order to prevent cors errors
app.use(cors());

//Paths and APIs
app.use("/categories",categoriesAPI);
app.use("/Products",productAPI);

