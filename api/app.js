const express = require('express')
const app = express()
const port = 3000

const dict = [
  {
    "en": "search",
    "mn": "haih"
  },
  {
    "en": "paper",
    "mn": "tsaas"
  }
]
app.get('/', (req, res) => {
  res.send('hello!')
})

app.get('/dict', (req, res) => {
  const enWord = req.query.en
  const result = dict.filter(obj => obj["en"] == enWord)[0]
  if (!result) {
    res.status(404).send("You are doomed!")
  }
  res.send(result)
})

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
