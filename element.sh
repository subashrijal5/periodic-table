PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[ $1 ]]
then
ELEMENT=$($PSQL "SELECT * FROM elements WHERE atomic_number='$1' OR symbol='$1' OR name='$1'")
if [[ -z $ELEMENT ]]
then
echo "I could not find that element in the database."
fi
echo $ELEMENT
else
echo "Please provide an element as an argument."
fi
