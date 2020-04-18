const connection = require('../database/connection');
const { date } = require('../lib/utils')

module.exports = {
  async create(request, response) {
    console.log('x')
    
    //name_pers = data.name_pers;
    console.log(request.body)
    
    const { name_pers, address_pers, birth_pers, city_pers, comments_pers, cpf_pers, phonewhats_pers, rg_pers, zipcode_pers } =  request.body

    birth_pers = date(birth_pers).iso
    
    console.log(birth_pers)

    await connection('person_pers').insert(
        {name_pers, 
         address_pers, 
         birth_pers,
         city_pers, 
         comments_pers, 
         cpf_pers, 
         phonewhats_pers, 
         rg_pers, 
         zipcode_pers
        });

    return response.json({name_pers})
}
}