const express = require('express');

const StudentsController = require('./controllers/StudentsController');

const routes = express.Router();

routes.post('/routes_newstudent', StudentsController.create);
routes.get('/test',  function(req, res) {res.send('Rota Ok')});
//routes.get('/ongs', OngController.index);
//routes.delete('/incidents/:id', IncidentController.delete);

module.exports = routes;
