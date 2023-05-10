const express = require('express')
const fs = require('fs')
const morgan = require('morgan')
var cors = require('cors')

const generateServices = require('./generateServices')

const app = express()
const port = 3001

app.use(express.json())
app.use(morgan('common', {stream: fs.createWriteStream('./access.log', {flags: 'a'})}))
app.use(morgan('dev'))
app.use(cors())

let services = generateServices(20);

app.post('/', (req, res) => {
    services.push(req.body)
    res.send(services)
  })

app.post('/approve/:serviceID', (req, res) => {
  let foundServiceIndex = services.findIndex(x => x.id == req.params.serviceID);
  services[foundServiceIndex].approved = true;
  res.send(services)
})

app.get('/', (req, res) => {
  res.send(services)
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})