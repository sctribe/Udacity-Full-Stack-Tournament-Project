# Tournament Results Project

The purpose of this project was to develop a sql database to store player and match details
for a Swiss system tournament. In the Swiss system no players are eliminated from a tournament
and the winner is found by matching players with the same number of wins to play each other. The
winner of the tournament is the person with the most number of wins.

## Files

#### tournament.sql

User edited. sql database and tables created here.

#### tournament.py

User edited. Implementation of Swiss style system. Contains functions that connect to sql database.

#### tournament_test.py

Provided by Udacity. Test cases for tournament.py. Creates players and simulates matches that are added
to sql database.

## How to Run

1. Download Vagrant VM from Udacity
2. Open Terminal and navigate to vagrant folder
  * Type `vagrant up`
3. SSH in to the Vagrant VM by typing `vagrant ssh`
4. Type in `cd /vagrant/tournament` to navigate to correct folder
5. Type in `psql` to open PSQL
  * Copy the code from tournament.sql and paste it in the terminal window.
  * type `\q` to exit PSQL
6. To run tests type in `python tournament_test.py`. You will see a success message if all test pass.

