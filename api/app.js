const serverless = require('serverless-http')
const express = require('express')
const { getData, getDataById } = require('./dynamo')
const { getMnDef } = require('./utils')
const bodyParser = require('body-parser')
const axios = require('axios')
const app = express()
const port = 3000
require('dotenv').config();

app.use(bodyParser.urlencoded({
  extended: true
}));
app.use(bodyParser.json());

app.get('/', (req, res) => {
  res.send('hello!')
})

app.get('/mock_data', async (req, res) => {
  try {
    const mockData = await getData();
    res.json(mockData)
  } catch (err) {
    console.error(err)
    res.status(500).json({'error': 'Something went wrong'})
  }
});

app.get('/mock_data/:id', async (req, res) => {
  const id = req.params.id;
  try {
    const mockData = await getDataById(id);
    res.json(mockData)
  } catch (err) {
    console.error(err)
    res.status(500).json({'error': 'Something went wrong'})
  }
});

app.get('/dict/en/:word', async (req, res) => {
  const word = req.params.word;
  const url = `https://www.dictionaryapi.com/api/v3/references/collegiate/json/${word}?key=${process.env.MW_DICT_KEY}`
  const mwRes = await axios.get(url);
  const respData = {}
  respData["word"] = word
  respData["mnDef"] = await getMnDef(word)
  respData["enDef"] = mwRes.data[0].shortdef
  respData["prs"] = mwRes.data[0].hwi
  respData["examples"] = [] //TODO: Examples will be array of strings.
  res.setHeader('Content-Type', 'application/json');
  res.end(JSON.stringify(respData));
});

// module.exports.handler = serverless(app);
app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
