echo *************************
echo Starting the replica set
echo *************************
sleep 30s | echo Sleeping
mongosh mongodb://mongo1:27017 replicaSet.js