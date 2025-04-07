const User = require("../models/user.model");
const {errorHandler} = require("../utils/error.handler");
const responscha = require("../utils/response");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");



let registerUser = errorHandler(async (req, res, next) => {
    let body = req.body;
    if (!body.email || !body.fullname || !body.password) {
      throw new Error("Ma'lumotlar to'liq emas");
    }
  
    let [existUser, existUserEmail] = await Promise.all([
      User.find({ fullname: body.fullname }),
      User.find({ email: body.email }),
    ]);
    if (existUser.length || existUserEmail.length) {
      throw new Error(`Boshqa ${existUser.length ? "username" : "email"} qo'y`);
    }
    
    let user = await User.create(body);
    console.log(user);
    
    responscha(res, 200, {
      message: "Siz muvaffaqiyat ro'yxatdan o'tdingiz",
      user,
    });
  });



  let loginUser = errorHandler(async (req, res, next) => {
    // console.log(req.cookies);
  
    let { fullname, password } = req.body;
    console.log(fullname);
    
    if (!fullname || !password)
      throw new Error("Username yoki password berilmagan");
    let user = await User.findOne({fullname})
    console.log(user);
    
    if (!user) throw new Error("Siz oldin ro'yxat o'tmagansiz ");
  
  
    let checking = await bcrypt.compare(password, user.password);
    if (!checking) throw new Error("password xato kiritilgan berilmagan");
    console.log(user.password, checking);
    
    let token = await jwt.sign(
      { id: user.id, role: user.role },
      process.env.JWT_TOKEN_SECRET_KEY,
      { expiresIn: process.env.JWT_EXP_TIME }
    );
  
    console.log(eval(process.env.JWT_REFRESH_EXP_TIME));
  
    let refreshToken = await jwt.sign(
      { id: user.id, role: user.role },
      process.env.JWT_REFRESH_TOKEN_SECRET_KEY,
      { expiresIn: eval(process.env.JWT_REFRESH_EXP_TIME) }
    );
    user.refreshToken = refreshToken;
    await user.save();
  
    let options = {
      maxAge: eval(process.env.JWT_REFRESH_EXP_TIME), // would expire after 15 minutes
      httpOnly: false, // The cookie only accessible by the web server
      // signed: true, // Indicates if the cookie should be signed
    };
  
    // cookie
    res.cookie("jwt", refreshToken, options);
    let userObj = user.toObject();
  
    delete userObj.password;
    delete userObj.refreshToken;
  
    responscha(res, 200, { userObj, token });
  });


  module.exports = {
    registerUser, loginUser
}