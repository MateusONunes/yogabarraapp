const express = require('express');

const StudentsController = require('./controllers/StudentsController');

const routes = express.Router();

routes.post('/routesnewstudent', StudentsController.create);
routes.post('/routesdeletestudent', StudentsController.delete);
routes.get('/routesquerystudent',  StudentsController.query);
routes.post('/testpost',  function(req, res) {console.log(req.body); res.send('Rota Ok.')});
routes.get('/test',  function(req, res) {res.send('Rota Ok')});
//routes.get('/ongs', OngController.index);
//routes.delete('/incidents/:id', IncidentController.delete);

module.exports = routes;
