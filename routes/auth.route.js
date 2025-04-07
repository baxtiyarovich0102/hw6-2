let express = require("express");
let router = express.Router();
let authController = require("../controllers/auth.controller");



router.route("/register").post(authController.registerUser);
router.route("/login").post(authController.loginUser);



module.exports = router