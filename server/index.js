//Imports from packages
const express = require("express");

//Imports from other files
const authRouter = require("./routes/auth");

//Init
const PORT = 3000;
const app = express();


//middleware
//CLIENT -> SERVER -> CLIENT
app.use(authRouter);


app.listen(PORT, () => {
    console.log(`connected at port ${PORT} Hey`);
});



