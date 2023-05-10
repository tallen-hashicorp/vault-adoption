const express = require('express')
const app = express()
const port = 3000

app.use(express.json())

let services = [
  {
    name: "Test Service",
    owners: [
      {
        groupName: "tenant1",
        approved: true,
      }
    ]
  }
]

app.post('/', (req, res) => {
    services.push(req.body)
    res.send(services)
  })

app.get('/', (req, res) => {
  res.send(services)
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})