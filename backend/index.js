var app = require('express')()
var ledStatus = "OFF";

app.get("/toggleLedStatus",(req,res)=>{
    if(ledStatus === "OFF")
        ledStatus = "ON";
    else
        ledStatus = "OFF";
    res.send("toggled");
});
  
app.get("/led",(req,res) => {
    res.send(ledStatus);
});

const PORT = process.env.PORT || 3333;

app.listen(PORT);