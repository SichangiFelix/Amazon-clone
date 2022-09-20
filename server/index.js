//Imports from packages
const express = require("express");
const mongoose = require("mongoose");
const adminRouter = require("./routes/admin");
const productRouter = require("./routes/product");

//Imports from other files
const authRouter = require("./routes/auth");

//Init
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://prime:JacobTUTU@cluster0.ey3vg.mongodb.net/?retryWrites=true&w=majority"


//middleware
//CLIENT -> SERVER -> CLIENT
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);



//connections
mongoose.connect(DB).then(() => {
    console.log('Connection Successful');
}).catch((e) => {
    console.log(e);
});

app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected at port ${PORT} Hey`);
});



