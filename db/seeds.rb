# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  states = State.create([{ name: 'Rio Grande do Sul', uf: 'RS' }, { name: 'Santa Catarina', uf: 'SC'  }])
  cities = City.create([{ name: 'Taquara', state_id: 1 },
                        { name: 'Igrejinha', state_id: 1 },
                        { name: 'Parobé', state_id: 1 },
                        { name: 'Rolante', state_id: 1 },
                        { name: 'Joinville', state_id: 2  }])
  districts = District.create([{ name: 'Santa Rosa', city_id: 1, cep: 95600000 },
                        { name: 'Viaduto', city_id: 2, cep: 95650000  },
                        { name: 'XV Novembro', city_id: 2, cep: 95650000 },
                        { name: 'Rio da Ilha', city_id: 1, cep: 95600000 },
                        { name: 'Floresta', city_id: 5, cep: 95650000  }])