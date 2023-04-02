#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# Check if there is no arguments
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."

# Check if there is an argument
elif [[ $1 ]]
then
  # Check if the argument is numerical
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENTS_RESULT=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE atomic_number = $1;")
  else
    ELEMENTS_RESULT=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE symbol = '$1' OR name = '$1';")
  fi

  # Check if result is empty 
  if [[ -z $ELEMENTS_RESULT ]]
  then
    echo "I could not find that element in the database."
  else
    IFS=' | ' read ATOMIC_NUMBER SYMBOL NAME <<< $ELEMENTS_RESULT

    # Retrieve properties 
    PROPERTIES_RESULT=$($PSQL "SELECT type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN types USING(type_id) WHERE atomic_number = $ATOMIC_NUMBER;")
    IFS=' | ' read TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT <<< $PROPERTIES_RESULT

    # Print report 
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  fi
fi
