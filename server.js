const express = require('express')
const app = express()

app.get('/', (req, res) => {
	console.log('Here')
	res.send('It is first commit')
})

app.listen(3000)

