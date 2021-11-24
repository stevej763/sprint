# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

def add_challenge_to_db(title, description, difficulty, distance, badge_file_path, icon_file_path,checkpoints)
  result = Challenge.new(title: title, description: description, difficulty: difficulty, distance: distance, checkpoints: checkpoints)
  result.badge.attach(io: File.open(badge_file_path), filename: 'badge.png')
  result.icon.attach(io: File.open(icon_file_path), filename: 'icon.png')
  result.save
end

hp_description = "Dumbledore has discovered Voldemort has split his soul. Can you help Harry Potter defeat Voldemort by finding and destroying each horcrux?"
hp_checkpoint = ["Tom Riddle's Diary","Marvolo Gaunt's Ring", "Salazar Slytherin's Locket","Helga Hufflepuff's Cup","Rowena Ravenclaw's Diadem","Harry Potter","Nagini the Snake"]
marathon_description = "In a nod to Greek history, the first marathon commemorated the run of the soldier Pheidippides from a battlefield near the town of Marathon, Greece, to Athens in 490 B.C. According to legend, Pheidippides ran the approximately 25 miles to announce the defeat of the Persians to some anxious Athenians. Do you have what it takes?"
marathon_checkpoint = ["Alpha","Zeus","Poseidon","Ares","Aphrodite", "Hera","Demeter","Athena","Apollo","Artemis","Hephaestus","Hermes","Dionysus","Omega"]
fuji_description = "Japan’s Mt. Fuji is an active volcano about 100 kilometers southwest of Tokyo. Commonly called “Fuji-san,” it’s the country’s tallest peak, at 3,776 meters. Are you up to the challenge?"
fuji_checkpoint = ["Lake Kawaguchi","Lake Motosu","Lake Sai","Lake Shōji","Lake Yamanaka","Mount Fuji summit"]
space_station_description = "Ever wanted to be an astronaut? Here's your chance to travel to the space station!"
space_station_checkpoint = ["Trosposphere","Stratosphere","Mesosphere","Thermosphere","Ionosphere","Exosphere"]
run_rabbit_run_description = ["Can you take on the Run Rabbit Run challenge and evade capture? Collect your rabbit friends along the way but watch out for that gardener, Mr McGregor!"]
run_rabbit_run_checkpoint = ["Benjamin Bunny","Flopsy Rabbit","Mopsy Rabbit","Cottontail Rabbit","Peter Rabbit"]
dinosaur_description = ["Get ready to roar with dinosaurs for this half marathon! Can you collect them all?"]
dinosaur_checkpoint = ["Velociraptor","Triceratops","Stegosaurus","Allosaurus","Tyrannosaurus Rex","Brachiosaurus"]
hadrians_wall_description = ["Hadrian's Wall was built by the Roman army on the orders of the emperor Hadrian following his visit to Britain in AD 122. It crosses northern Britain from Wallsend on the River Tyne in the east to Bowness-on-Solway in the west. The wall is under attack. Do you have what it takes to deliver messages to each checkpoint in time?"]
hadrians_wall_checkpoint = ["Wallsend","Heddon-on-the-Wall","Chollerford","Steel Rigg","Walton","Carlisle","Bowness-on-Solway"]
north_coast_500_description = ["Join a spectacular 500 mile journey through the Scottish Highlands — a scenic route that has it all, from sandy beaches to beautiful castles and diverse wildlife. What are you waiting for? Let's do it!"]
north_coast_500_checkpoint = ["Inverness (Start)","Dornoch","Wick","Tongue","Lochinver","Ullapool","Kinlochewe","Inverness (End)"]


add_challenge_to_db('Hunt the Horcruxes', hp_description, "Easy", 7.0, 'template_images/harry_potter/badge.png', 'template_images/harry_potter/icon.png',hp_checkpoint)
add_challenge_to_db('Marathon to Athens', marathon_description, "Medium", 26.0, 'template_images/marathon/badge.png', 'template_images/marathon/icon.png',marathon_checkpoint)
add_challenge_to_db('Mount Fuji', fuji_description, "Hard", 46.0, 'template_images/fuji/badge.png', 'template_images/fuji/icon.jpeg',fuji_checkpoint)
add_challenge_to_db('Space Station', space_station_description, "Insane!", 254.0, 'template_images/space/badge.png', 'template_images/space/icon.png',space_station_checkpoint)
add_challenge_to_db('Run Rabbit Run!', run_rabbit_run_description, "Easy", 3.2, 'template_images/rabbit/badge.png', 'template_images/rabbit/icon.png', run_rabbit_run_checkpoint)
add_challenge_to_db('Dinosaur Hunter', dinosaur_description, "Medium", 13.1, 'template_images/dinosaur/badge.png', 'template_images/dinosaur/icon.png', dinosaur_checkpoint)
add_challenge_to_db("Hadrian's Wall", hadrians_wall_description, "Difficult", 73.0, 'template_images/hadrians_wall/badge.png', 'template_images/hadrians_wall/icon.png', hadrians_wall_checkpoint)
add_challenge_to_db('North Coast 500', north_coast_500_description, "Insane!", 500, 'template_images/north_coast_500/badge.png', 'template_images/north_coast_500/icon.png', north_coast_500_checkpoint)

