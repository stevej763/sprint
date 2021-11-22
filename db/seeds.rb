# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

def add_db_to_challenge(title, description, difficulty, distance, badge_file_path, icon_file_path)
  result = Challenge.new(title: title, description: description, difficulty: difficulty, distance: distance)
  result.badge.attach(io: File.open(badge_file_path), filename: 'badge.png')
  result.icon.attach(io: File.open(icon_file_path), filename: 'icon.png')
  result.save
end

hp_description = "Dumbledore has discovered Voldemort has split his soul. Can you help Harry Potter defeat Voldemort by finding and destroying each horcrux?"
marathon_description = "In a nod to Greek history, the first marathon commemorated the run of the soldier Pheidippides from a battlefield near the town of Marathon, Greece, to Athens in 490 B.C. According to legend, Pheidippides ran the approximately 25 miles to announce the defeat of the Persians to some anxious Athenians. Do you have what it takes?"
fuji_description = "Japan’s Mt. Fuji is an active volcano about 100 kilometers southwest of Tokyo. Commonly called “Fuji-san,” it’s the country’s tallest peak, at 3,776 meters. Are you up to the challenge?"
space_station_description = "Run to the space station"

hp_check_points

add_db_to_challenge('Hunt the Horcruxes', hp_description, "Easy", 7, 'template_images/harry_potter/badge.png', 'template_images/harry_potter/icon.png')
add_db_to_challenge('Marathon to Athens', marathon_description, "Medium", 26, 'template_images/marathon/badge.png', 'template_images/marathon/icon.png')
add_db_to_challenge('Mount Fuji', fuji_description, "Hard", 46, 'template_images/fuji/badge.png', 'template_images/fuji/icon.jpeg')
add_db_to_challenge('Space Station', space_station_description, "Insane!", 254, 'template_images/space/badge.png', 'template_images/space/icon.png')