// const serverless = require('serverless-http')
import express from 'express'
import { getDataFromMerriamWebster, buildResponse } from './utils/utils.js'
import bodyParser from 'body-parser';
import * as dotenv from 'dotenv'

const { urlencoded, json } = bodyParser;

dotenv.config()

const app = express()
const port = 3000

app.use(urlencoded({
  extended: true
}));
app.use(json());

app.get('/', (req, res) => {
  res.send('Hello! This is MongoDict backend. Welcome!')
})

app.get('/dict/en/:word', async (req, res) => {
  const searchWord = req.params.word;
  const mwRes = await getDataFromMerriamWebster(searchWord)
  const response = await buildResponse(searchWord, mwRes)
  
  res.setHeader('Content-Type', 'application/json');
  res.end(JSON.stringify(response));
});


app.listen(port, () => {
  console.log(`MangoDict listening on port ${port}`)
})

// module.exports.handler = serverless(app);