# To run this file, run the following command at your terminal prompt: `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!
# - Note rubric explanation for appropriate use of external resources.

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:

# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)

# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)

# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
Movie.destroy_all
Studio.destroy_all
Role.destroy_all
Actor.destroy_all

# Generate models and tables, according to the domain model.
# rails generate model Movie
# rails generate model Studio
# rails generate model Role
# rails generate model Actor

# at migration files, add columns

# rails db:migrate

# check schema

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

warner = Studio.new
warner["studio_name"] = "Warner Bros"
warner.save

batman1 = Movie.new
batman1["movie_name"] = "Batman Begins"
batman1["year_released"] = "2005"
batman1["MPAA_rating"] = "PG-13"
batman1["studio_id"] = warner["id"]
batman1.save

batman2 = Movie.new
batman2["movie_name"] = "The Dark Knight"
batman2["year_released"] = "2008"
batman2["MPAA_rating"] = "PG-13"
batman2["studio_id"] = warner["id"]
batman2.save

batman3 = Movie.new
batman3["movie_name"] = "The Dark Knight Rises"
batman3["year_released"] = "2012"
batman3["MPAA_rating"] = "PG-13"
batman3["studio_id"] = warner["id"]
batman3.save

actor1 = Actor.new
actor1["actor_name"] = "Christian Bale"
actor1.save

actor2 = Actor.new
actor2["actor_name"] = "Michael Caine"
actor2.save

actor3 = Actor.new
actor3["actor_name"] = "Liam Neeson"
actor3.save

actor4 = Actor.new
actor4["actor_name"] = "Katie Holmes"
actor4.save

actor5 = Actor.new
actor5["actor_name"] = "Gary Oldman"
actor5.save

actor6 = Actor.new
actor6["actor_name"] = "Heath Ledger"
actor6.save

actor7 = Actor.new
actor7["actor_name"] = "Aaron Eckhart"
actor7.save

actor8 = Actor.new
actor8["actor_name"] = "Maggie Gyllenhaal"
actor8.save

actor9 = Actor.new
actor9["actor_name"] = "Tom Hardy"
actor9.save

actor10 = Actor.new
actor10["actor_name"] = "Joseph Gordon-Levitt"
actor10.save

actor11 = Actor.new
actor11["actor_name"] = "Anne Hathaway"
actor11.save

role1 = Role.new
role1["role_name"] = "Bruce Wayne"
role1["movie_id"] = batman1["id"]
role1["actor_id"] = actor1["id"]
role1.save

role2 = Role.new
role2["role_name"] = "Bruce Wayne"
role2["movie_id"] = batman2["id"]
role2["actor_id"] = actor1["id"]
role2.save

role3 = Role.new
role3["role_name"] = "Bruce Wayne"
role3["movie_id"] = batman3["id"]
role3["actor_id"] = actor1["id"]
role3.save

role4 = Role.new
role4["role_name"] = "Alfred"
role4["movie_id"] = batman1["id"]
role4["actor_id"] = actor2["id"]
role4.save

role5 = Role.new
role5["role_name"] = "Alfred"
role5["movie_id"] = batman2["id"]
role5["actor_id"] = actor2["id"]
role5.save

role6 = Role.new
role6["role_name"] = "Ra's Al Ghul"
role6["movie_id"] = batman1["id"]
role6["actor_id"] = actor3["id"]
role6.save

role7 = Role.new
role7["role_name"] = "Rachel Dawes"
role7["movie_id"] = batman1["id"]
role7["actor_id"] = actor4["id"]
role7.save

role8 = Role.new
role8["role_name"] = "Rachel Dawes"
role8["movie_id"] = batman2["id"]
role8["actor_id"] = actor8["id"]
role8.save

role9 = Role.new
role9["role_name"] = "Commissioner Gordon"
role9["movie_id"] = batman1["id"]
role9["actor_id"] = actor5["id"]
role9.save

role10 = Role.new
role10["role_name"] = "Commissioner Gordon"
role10["movie_id"] = batman3["id"]
role10["actor_id"] = actor5["id"]
role10.save

role11 = Role.new
role11["role_name"] = "Joker"
role11["movie_id"] = batman2["id"]
role11["actor_id"] = actor6["id"]
role11.save

role12 = Role.new
role12["role_name"] = "Harvey Dent"
role12["movie_id"] = batman2["id"]
role12["actor_id"] = actor7["id"]
role12.save

role13 = Role.new
role13["role_name"] = "Bane"
role13["movie_id"] = batman3["id"]
role13["actor_id"] = actor9["id"]
role13.save

role14 = Role.new
role14["role_name"] = "John Blake"
role14["movie_id"] = batman3["id"]
role14["actor_id"] = actor10["id"]
role14.save

role15 = Role.new
role15["role_name"] = "Selina Kyle"
role15["movie_id"] = batman3["id"]
role15["actor_id"] = actor11["id"]
role15.save

puts "There are #{Role.all.count} Role."

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!

movies = Movie.all

for movie in movies
    movie_name = movie["movie_name"]
    year_released = movie["year_released"]
    mpaa_rating = movie["MPAA_rating"]
    studio = Studio.find_by({"id" => movie["studio_id"]})
    puts "#{movie_name} #{year_released} #{mpaa_rating} #{studio["studio_name"]}"
end


# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

roles = Role.all
actors = Actor.all


for role in roles
    rolename = role["role_name"]
    movie = Movie.find_by({"id" => role["movie_id"]})
    actor = Actor.find_by({"id" => role["actor_id"]})
    puts "#{movie["movie_name"]} #{actor["actor_name"]} #{rolename}"
end



# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle