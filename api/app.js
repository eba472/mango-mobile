const express = require('express')
const { getData, getDataById, deleteData, addOrUpdate } = require('./dynamo')
const app = express()
const port = 3000

app.get('/', (req, res) => {
  res.send('hello!')
})

app.get('/mock_data', async (req, res) => {
  try {
    const mockData = await getData();
    res.json(mockData)
  } catch (err) {
    console.error(err)
    res.status(500).json({'error': 'Someting went wrong'})
  }
});

app.get('/mock_data/:id', async (req, res) => {
  const id = req.params.id;
  try {
    const mockData = await getDataById(id);
    res.json(mockData)
  } catch (err) {
    console.error(err)
    res.status(500).json({'error': 'Someting went wrong'})
  }
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
