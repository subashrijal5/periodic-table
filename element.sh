PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"
if [[ $1 ]]
then

else
echo "Please provide an element as an argument."
fi
