#!/bin/bash

# PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# echo "Enter your username:"
# read USERNAME

# # # Certify that USER_NAME is no more than 22 characters
# # # If more than 22 characters: ${#USERNAME} -gt 22
# if [[ -z $USERNAME ]]; then
#   # Return home
#   exit 1
# else
#   # Check if user is already registered
#   USER_ID_RESULT=$($PSQL "SELECT user_id FROM users WHERE LOWER(username) = LOWER('$USERNAME');")

#   if [[ $USER_ID_RESULT ]]; then
#     # Get details from user in the database
#     USERNAME=$($PSQL "SELECT username FROM users WHERE user_id = $USER_ID_RESULT;")
#     GAMES_PLAYED=$($PSQL "SELECT count(game_id) FROM games WHERE user_id = $USER_ID_RESULT;")
#     BEST_GAME=$($PSQL "SELECT MIN(number_guesses) FROM games WHERE user_id = $USER_ID_RESULT;")
#     echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
#   else
#     echo "Welcome, $USERNAME! It looks like this is your first time here."
#   fi

#   # Random between 0 and 1000
#   RANDOM_NUMBER=$((1 + $RANDOM % 1000))

#   NUM_GUESSES=1

#   echo "Guess the secret number between 1 and 1000:"
#   # GUESS_NUMBER
#   # Read number from the user
#   GUESS=-1

#   until [[ $GUESS -eq $RANDOM_NUMBER ]]; do
#     # Check if GUESS is an integer
#     if [[ ! $GUESS =~ ^-?[0-9]+$ ]]; then
#       echo "That is not an integer, guess again:"
#       # Ask to guess a number again
#       read GUESS
#       continue
#     else
#       # If guess is greater than number, ask to guess again
#       if [[ $GUESS -gt $RANDOM_NUMBER ]]; then
#         echo "It's lower than that, guess again:"
#         NUM_GUESSES=$((1 + $NUM_GUESSES))
#         read GUESS
      
#       # If guess is less than number, ask to guess again
#       elif [[ $GUESS -lt $RANDOM_NUMBER ]]; then
#         echo "It's higher than that, guess again:"
#         NUM_GUESSES=$((1 + $NUM_GUESSES))
#         read GUESS
#       fi
#     fi
#   done

#   # Add user to the database
#   if [[ -z $USER_ID_RESULT ]]; then
#     # Add user to the database
#     ADD_RESULTS=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
#     USER_ID_RESULT=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME';")
#   fi

#   # Add record to the database
#   ADD_RECORD_RESULT=$($PSQL "INSERT INTO games(user_id, number_guesses) VALUES($USER_ID_RESULT, $NUM_GUESSES);")
# fi

# # Print successful guess message
# echo -e "You guessed it in $NUM_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"



PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#generate the number
SNUMBER=$(( 1 + RANDOM % 1000 ))

NUMBER_GUESS() {
  echo "Enter your username:"
  read USERNAME
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE LOWER(username) = LOWER('$USERNAME')")
  #if empty > new user
  if [[ -z $USER_ID ]]; then
    echo "Welcome, $USERNAME! It looks like this is your first time here."
    ADD_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  else
    GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id=$USER_ID")
    BEST_GAME=$($PSQL "SELECT MIN(number_guesses) FROM games WHERE user_id=$USER_ID")
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi

  echo "Guess the secret number between 1 and 1000:"
  read GUESS
  if [[ $GUESS =~ ^-?[0-9]+$ ]]; then
    if [[ $GUESS = $SNUMBER ]]; then
      NGUESS=1
      echo "You guessed it in $NGUESS tries. The secret number was $SNUMBER. Nice job!"
      #enter game_info to database
      INSERT_GAME=$($PSQL "INSERT INTO games(user_id, number_guesses) VALUES($USER_ID, $NGUESS)")
    else
      NGUESS=1
      while [[ $GUESS -ne $SNUMBER ]]; do
        NGUESS=$(( $NGUESS + 1 ))
        if [[ $GUESS -gt $SNUMBER ]]; then
          echo "It's lower than that, guess again:"
          read GUESS
          if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
            echo "That is not an integer, guess again:"
            read GUESS
          fi
        else
          echo "It's higher than that, guess again:"
          read GUESS
          if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
            echo "That is not an integer, guess again:"
            read GUESS
          fi
        fi
      done
      echo "You guessed it in $NGUESS tries. The secret number was $SNUMBER. Nice job!"
      #enter game info to database
      INSERT_GAME=$($PSQL "INSERT INTO games(user_id, number_guesses) VALUES($USER_ID, $NGUESS)")
    fi
  else
    echo "That is not an integer, guess again:"
  fi
}

NUMBER_GUESS