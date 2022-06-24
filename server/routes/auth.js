const express = require('express');

const authRouter = express.Router();

authRouter.get("/user", (req, res) => {
    res.json({msg: "Rivaan"});
});

module.exports = authRouter; //makes it accessible in other files