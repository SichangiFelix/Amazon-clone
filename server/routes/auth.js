const express = require('express');
const User = require("../models/user");

const authRouter = express.Router();

authRouter.post("/api/signup", async (req, res) => {
    const {name, email, password} = req.body;

    const exsistingUser = await User.findOne({email});
    if(exsistingUser){
        return res.status(400).json({"msg": "User with same email already exsists!"});
    }

    let user = new User({
        email,
        password,
        name,
    })

    user = await user.save();
    res.json(user);

});

authRouter.get("/api/signup", async (req, res) => {
    const {name, email, password} = req.body;

    const exsistingUser = await User.findOne({email});
    if(exsistingUser){
        return res.status(400).json({"msg": "User with same email already exsists!"});
    }

    let user = new User({
        email,
        password,
        name,
    })

    user = await user.save();
    res.json(user);

});

module.exports = authRouter; //makes it accessible in other files