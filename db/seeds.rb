# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
hp_description = "Dumbledore has discovered Voldemort has split his soul. Can you help Harry Potter defeat Voldemort by finding and destroying each horcrux?"
m_to_athens_description = "In a nod to Greek history, the first marathon commemorated the run of the soldier Pheidippides from a battlefield near the town of Marathon, Greece, to Athens in 490 B.C. According to legend, Pheidippides ran the approximately 25 miles to announce the defeat of the Persians to some anxious Athenians. Do you have what it takes?"
m_fuji_description = "Japan’s Mt. Fuji is an active volcano about 100 kilometers southwest of Tokyo. Commonly called “Fuji-san,” it’s the country’s tallest peak, at 3,776 meters. Are you up to the challenge?"
space_station_description = "Run to the space station"

Challenge.find_or_create_by(title: 'Horcrux challenge', description: hp_description, difficulty: "Easy", distance: 7)

Challenge.find_or_create_by(title: 'Marathon to Athens', description: m_to_athens_description, difficulty: "Medium", distance: 26)

Challenge.find_or_create_by(title: 'Mount Fuji', description: m_fuji_description, difficulty: "Difficult", distance: 46)

Challenge.find_or_create_by(title: 'Space Station', description: space_station_description, difficulty: "Insane!", distance: 254)