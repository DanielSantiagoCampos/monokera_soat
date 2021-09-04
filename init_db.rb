TariffType.destroy_all
Tariff.destroy_all

puts "Saving Tariffs:\n"

TariffType.create(description: 'Clase 1 (Motos)')
TariffType.create(description: 'Clase 2 (Camperos y camionetas)')
TariffType.create(description: 'Clase 3 (Carros de carga o mixto)')
TariffType.create(description: 'Clase 4 (Carros oficiales, especiales o ambulancias)')
TariffType.create(description: 'Clase 5 (Carros familiares)')
TariffType.create(description: 'Clase 6 (Carros con capacidad para 6 personas o más)')
TariffType.create(description: 'Clase 7 (Taxis y microbuses urbanos)')
TariffType.create(description: 'Clase 8 (Carros de servicio público urbano buses)')
TariffType.create(description: 'Clase 9 (Carros de servicio intermunicipal)')

tariffs = [
 [1, 10, 'Ciclomotor',                            117800, 58900, 178500],
 [1, 11, 'Menos de 100 c.c.',                     245300, 122650, 369750],
 [1, 12, 'Entre 100 - 200 c.c.',                  329400, 164700, 495900],
 [1, 13, 'Más de 200 c.c.',                       371500, 185750, 559050],
 [1, 14, 'Motocarros, Tricimotos y Cuadriciclos', 371500, 185750, 559050],
 [2, 21, 'Menos de 1500 c.c.',     387000, 193500, 582300],
 [2, 22, 'Entre 1500 - 2500 c.c.', 462400, 231200, 695400],
 [2, 23, 'Más de 2500 c.c.',       542300, 271150, 815250],
 [3, 31, 'Menos de 5 Tons.',   433600, 216800, 652200],
 [3, 32, 'Entre 5 - 15 Tons.', 626800, 313400, 942000],
 [3, 33, 'Más de 15 Tons.',    792800, 396400, 1191000],
 [4, 41, 'Menos de 1500 c.c.',     488100, 244050, 733950],
 [4, 42, 'Entre 1500 - 2500 c.c.', 615600, 307800, 925200],
 [4, 43, 'Más de 2500 c.c.',       738300, 369150, 1109250],
 [5, 51, 'Menos de 1500 c.c.',     218000, 109000, 328800, true],
 [5, 52, 'Entre 1500 - 2500 c.c.', 265500, 132750, 400050, true],
 [5, 53, 'Más de 2500 c.c.',       310400, 155200, 467400, true],
 [5, 51, 'Menos de 1500 c.c.',     289200, 144600, 435600],
 [5, 52, 'Entre 1500 - 2500 c.c.', 330700, 165350, 497850],
 [5, 53, 'Más de 2500 c.c.',       368200, 184100, 554100],
 [6, 61, 'Menos de 2500 c.c.', 389400, 194700, 585900, true],
 [6, 62, '2500 o más c.c.',    521400, 260700, 783900, true],
 [6, 61, 'Menos de 1500 c.c.', 497200, 248600, 747600],
 [6, 62, '2500 o más c.c.',    626200, 313100, 941100],
 [7, 71, 'Menos de 1500 c.c.',     270100, 135050, 406950, true],
 [7, 72, 'Entre 1500 - 2500 c.c.', 335800, 167900, 505500, true],
 [7, 73, 'Más de 2500 c.c.',       433600, 216800, 652200, true],
 [7, 71, 'Menos de 1500 c.c.',     337600, 168800, 508200],
 [7, 72, 'Entre 1500 - 2500 c.c.', 415400, 207700, 624900],
 [7, 73, 'Más de 2500 c.c.',       509000, 254500, 765300],
 [8, 81, 'N/A',                   648000, 324000, 973800],
 [8, 91, 'Menos de 10 pasajeros', 640800, 320400, 963000],
 [9, 92, '10 o más pasajeros',    930300, 465150, 1397250]
]

tariffs.map do |tariff|
  Tariff.create(
    tariff_type_id:        tariff[0],
    code:                  tariff[1],
    cylinders_description: tariff[2],
    prime_tax:             tariff[3],
    contribution_tax:      tariff[4],
    total_value:           tariff[5],
    younger_than_twelve:   tariff[6] && tariff[6]
  )
end
