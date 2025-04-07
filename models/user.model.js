const mongoose = require("mongoose");
const bcryptjs = require("bcryptjs")

const userSchema = new mongoose.Schema({
  fullname: String,
  email: { type: String, unique: true, required: true },
  password: { type: String, required: true },
  role: { type: String, enum: ["teacher", "student"], required: true }
});

userSchema.pre('save', async function (next) {
	let password = this.password
	this.password = await bcryptjs.hash(password, 12)

	next()
})

let user = mongoose.model("User", userSchema);

module.exports = user
