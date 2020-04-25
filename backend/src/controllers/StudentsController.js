const connection = require('../database/connection');
const { date } = require('../lib/utils')

module.exports = {
  async query(request, response) {
    console.log('a')

    const { page = 1, code_pers} = request.query;

    const [count] = await connection('person_pers').count();
    
//    connection('person_pers').where('code_pers', '17')
    console.log(code_pers)
    const person_pers = await connection('person_pers')
      .limit(5)
      .offset((page - 1) * 5)
      .where(function() {
        if(code_pers){this.where('code_pers', code_pers)}
      })
      .select([
        'code_pers',
        'name_pers',
        'birth_pers',
        'address_pers',
        'city_pers',
        'zipcode_pers',
        'cpf_pers',
        'rg_pers',
        'phonewhats_pers',
        'email_pers',
        'fisicajuridica_pers',
        'comments_pers',
        'login_pers'
      ]);

    response.header('X-Total-Count', count['count(*)']);

    return response.json(person_pers);
  },

  async create(request, response) {
    console.log('-------')
    
    //name_pers = data.name_pers;
    console.log(request.body)
    
    let { code_pers, name_pers, address_pers, birth_pers, city_pers, comments_pers, cpf_pers, phonewhats_pers, rg_pers, zipcode_pers } =  request.body
    console.log('birth_pers-antes', birth_pers)

    birth_pers = date(birth_pers).iso
    
    console.log('code_pers', code_pers)

    if (code_pers == 0) {
      await connection('person_pers').insert(
          {name_pers, 
          address_pers, 
  //         birth_pers,
          city_pers, 
          comments_pers, 
          cpf_pers, 
          phonewhats_pers, 
          rg_pers, 
          zipcode_pers
          });
      } else {
        await connection('person_pers').update(
          {name_pers, 
          address_pers, 
  //         birth_pers,
          city_pers, 
          comments_pers, 
          cpf_pers, 
          phonewhats_pers, 
          rg_pers, 
          zipcode_pers
          }).where('code_pers', code_pers)
      }

    return response.json({name_pers})
  },
  async delete(request, response) {
    
    let { code_pers } = request.body
    console.log('Delete', request.body
    )

    if (code_pers != 0) {
      await connection('person_pers')
        .where('code_pers', code_pers)
        .delete()
    }

    return 
  }

}
