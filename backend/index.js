const express = require('express')

const app = express()

app.get('/', (req, resp) =>{
    return resp.send('Hello Word - Yoga')
})

app.listen(3333)

