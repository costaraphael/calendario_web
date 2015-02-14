# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

EventoTipo.create([
                      {nome: 'Normal'},
                      {nome: 'G1'},
                      {nome: 'G2'},
                      {nome: 'Substituição'},
                      {nome: 'Semi-Presencial'},
                      {nome: 'Feriado'},
                      {nome: 'Institucional'},
                      {nome: 'Aula trocada'},
                  ])