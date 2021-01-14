if [ "$1" == "start" ]
then
export RAILS_ENV=development
rails s > log/serv_logs.log &

#bundle exec rails s -b 0.0.0.0 -p 80 -e development > log/serv_logs.log &
#rails s -e development -p 80 -b 0.0.0.0 > log/serv_logs.log &
#puma -p 80 -e development > log/serv_logs.log &
fi

if [ "$1" == "stop" ]
then
processes=`ps auxwe | grep 'rails' | grep -v grep | awk '{print $2}'`
kill $processes
fi

if [ "$1" == "" ]
then
echo "Usage"
echo "./server.sh start"
echo "- OR - "
echo "./server.sh stop"
fi
