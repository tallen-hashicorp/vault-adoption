const express = require('express')
const fs = require('fs')
const morgan = require('morgan')

const generateServices = require('./generateServices')

const app = express()
const port = 3000

app.use(express.json())
app.use(morgan('common', {stream: fs.createWriteStream('./access.log', {flags: 'a'})}))
app.use(morgan('dev'))

let services = generateServices(20)

app.post('/', (req, res) => {
    services.push(req.body)
    res.send(services)
  })

app.post('/approve/:serviceID', (req, res) => {
  console.log(req.params)
  let foundServiceIndex = services.findIndex(x => x.id === req.params.serviceID);
  services[foundServiceIndex].approved = true;
  res.send(services)
})

app.get('/', (req, res) => {
  res.send(services)
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})