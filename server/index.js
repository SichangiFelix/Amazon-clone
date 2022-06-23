console.log("Hello, World");


const express = require('express');
const PORT = 3000;

const app = express();

//Creating an API
app.listen(PORT, "0.0.0.0", () => {
    console.log(`connected at port ${PORT}`);
});
//localhost
//