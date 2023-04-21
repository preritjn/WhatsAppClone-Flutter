const express = require("express")
const http = require("http")
const port = process.env.PORT || 3000
const app = express()

const server = http.createServer(app)

const io = require('socket.io')(server)

//  middleware
app.use(express.json())

var clients = {}

io.on("connection",(socket)=> {
    console.log("Connected")
    console.log(socket.id," has joined")
    socket.on("signin",(id)=> {
        console.log(id)
        clients[id] = socket
        console.log(clients)
    })
    socket.on("message",(data) => {
        console.log(data)
        let targetId = data.targetId
        clients[targetId].emit("message",data)
    })
})

server.listen(port, "0.0.0.0",()=> {
    console.log('now listening to the server')
})