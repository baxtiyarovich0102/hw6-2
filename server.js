const env = require("dotenv").config();
const express = require("express");
let app = express();
app.use(express.json());
app.use(express.urlencoded({extended:true}));


const authRouter = require("./routes/auth.route.js");
const errController = require("./controllers/error.controller.js");
const connectDb = require("./config/db.js");
app.use("/auth", authRouter)

connectDb()
app.use(errController)


app.listen(process.env.PORT, () =>
    console.log("This server is running on " , process.env.PORT)
  );