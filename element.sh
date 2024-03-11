PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[ $1 ]]
then
if [[ $1 =~ ^[0-9]+$ ]]
then
ELEMENT=$($PSQL "SELECT elements.atomic_number, name, symbol, melting_point_celsius, boiling_point_celsius, atomic_mass FROM elements JOIN properties ON elements.atomic_number=properties.atomic_number WHERE elements.atomic_number=$1")
else
ELEMENT=$($PSQL "SELECT elements.atomic_number, name, symbol, melting_point_celsius, boiling_point_celsius, atomic_mass FROM elements JOIN properties ON elements.atomic_number=properties.atomic_number WHERE symbol='$1' OR name='$1'")
fi

if [[ -z $ELEMENT ]]
then
echo "I could not find that element in the database."
else
 IFS='|' read -r ATOMIC_NUMBER NAME SYMBOL MELTING_POINT BOILING_POINT MASS <<< "$ELEMENT"
echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a nonmetal, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
fi
else
echo "Please provide an element as an argument."
fi
