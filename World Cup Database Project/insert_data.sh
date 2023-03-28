#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Clear both tables
echo "$($PSQL "TRUNCATE TABLE games, teams;")"

# Loop through the CSV file
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT W_GOALS OP_GOALS
do
  # Games: game_id, year, round, winner_goals, opponent_goals, winner_id, opponent_id
  # teams: team_id, name
  # Ignore the first row
  if [[ $YEAR != year ]]
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")
    
    # Check if winner team and opponent team are registered in the 'teams' table
    if [[ $WINNER_ID == $null ]]
    then
      INSERT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")
      WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")
    fi
    if [[ $OPPONENT_ID == $null ]]
    then
      INSERT_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")
      OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")
    fi
    
    # Insert into games table the extracted information 
    INSERT_RESULT=$($PSQL "INSERT INTO games(year, round, winner_goals, opponent_goals, winner_id, opponent_id) VALUES('$YEAR', '$ROUND', '$W_GOALS', '$OP_GOALS', '$WINNER_ID', '$OPPONENT_ID');")
  fi
done