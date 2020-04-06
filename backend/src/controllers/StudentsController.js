const connection = require('../database/connection');

module.exports = {
  async create(request, response) {
    console.log(request.body)
    const { name_pers, address_pers, email_pers } = request.body;

    //const [code_pers] = 
    await connection('person_pers').insert({
        name_pers, 
        address_pers,
        email_pers
    });

    return response.json({ res: "ok" });
  }

};