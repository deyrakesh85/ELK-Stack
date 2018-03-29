#!/bin/bash
echo -e "\e[1m\e[32m"
echo "

"
echo "###########################################"
echo "#                                         #"
echo "#   Welcome to the ELK Stack deployment   #"
echo "#                                         #"
echo "###########################################"
echo "
"
echo -e "\e[1m\e[94m"
echo "Please select the ELK Stack architecture you would like to deploy:"
echo "
"
echo -e "\e[1m\e[97m"
echo -e "1. [\e[1m\e[90mLog Shipper from Server\e[1m\e[97m] ==> [\e[1m\e[91mElastic Search\e[1m\e[97m]--[\e[1m\e[92mKibana\e[1m\e[97m]"
echo ""
echo -e "2. [\e[1m\e[90mLog Shipper from Server\e[1m\e[97m] ==> [\e[1m\e[96mLogstash Indexer\e[1m\e[97m] ==> [\e[1m\e[91mElastic Search\e[1m\e[97m]--[\e[1m\e[92mKibana\e[1m\e[97m]"
echo ""
echo -e "3. [\e[1m\e[90mLog Shipper from Server\e[1m\e[97m] ==> [\e[1m\e[35mRedis/Kafka\e[1m\e[97m]      ==> [\e[1m\e[96mLogstash Indexer\e[1m\e[97m] ==> [\e[1m\e[91mElastic Search\e[1m\e[97m]--[\e[1m\e[92mKibana\e[1m\e[97m]"
echo ""
echo -e "4. [\e[1m\e[90mLog Shipper from Server\e[1m\e[97m] ==> [\e[1m\e[93mLogstash Shipper\e[1m\e[97m] ==> [\e[1m\e[35mRedis/Kafka\e[1m\e[97m]      ==> [\e[1m\e[96mLogstash Indexer\e[1m\e[97m] ==> [\e[1m\e[91mElastic Search\e[1m\e[97m]--[\e[1m\e[92mKibana\e[1m\e[97m]"
echo ""

 cd Stack

 while :
 do
 	echo "Enter your choice:"
 	read INPUT_CHOICE
 	echo ""
 	case $INPUT_CHOICE in
 		1)
 			echo "Starting ELK Stack Architecture...."
 			cd ElasticSearch_Kibana && docker-compose up -d &> /dev/null
 			echo "ElasticSearch_Kibana" > /tmp/ELK_Stack
 			break
 			;;
 		2)
 			echo "Starting ELK Stack Architecture...."
 			cd ElasticSearch_Kibana_Logstash-Indexer && docker-compose up -d &> /dev/null
 			echo "ElasticSearch_Kibana_Logstash-Indexer" > /tmp/ELK_Stack
 			break
 			;;
 		3)
 			echo "What would you like to use as the Message Queue"
 			echo "1. Redis"
 			echo "2. Kafka" 
 			while :
 			do
 				echo "Enter your choice:"
 				read INPUT_CHOICE_3
 				case $INPUT_CHOICE_3 in
 					1) 
 						echo "Starting ELK Stack Architecture...."
 						cd ElasticSearch_Kibana_Logstash-Indexer_Redis && docker-compose up -d &> /dev/null
 						echo "ElasticSearch_Kibana_Logstash-Indexer_Redis" > /tmp/ELK_Stack
 						break
 						;;
 					2)
 						echo "Starting ELK Stack Architecture...."
 						cd ElasticSearch_Kibana_Logstash-Indexer_Kafka && docker-compose up -d &> /dev/null
 						echo "ElasticSearch_Kibana_Logstash-Indexer_Kafka" > /tmp/ELK_Stack
 						break
 						;;
 					*)
 						echo "Invalid Choice!! Try again"
 						;;
 				esac
 			done
 			break
 			;;
 		4)
 			echo "What would you like to use as the Message Queue"
 			echo "1. Redis"
 			echo "2. Kafka" 
 			while :
 			do
 				echo "Enter your choice:"
 				read INPUT_CHOICE_4
 				case $INPUT_CHOICE_4 in
 					1) 
 						echo "Starting ELK Stack Architecture...."
 						cd ElasticSearch_Kibana_Logstash-Indexer_Redis_Logstash-Shipper && docker-compose up -d &> /dev/null
 						echo "ElasticSearch_Kibana_Logstash-Indexer_Redis_Logstash-Shipper" > /tmp/ELK_Stack
 						break
 						;;
 					2)
 						echo "Starting ELK Stack Architecture...."
 						cd ElasticSearch_Kibana_Logstash-Indexer_Kafka_Logstash-Shipper && docker-compose up -d &> /dev/null
 						echo "ElasticSearch_Kibana_Logstash-Indexer_Kafka_Logstash-Shipper" > /tmp/ELK_Stack
 						break
 						;;
 					*)
 						echo "Invalid Choice!! Try again"
 						;;
 				esac
 			done
 			break
 			;;
 		*)
 			echo "Invalid Choice!! Try again"
 			;;
 	esac
 done

 echo "
 "
 sleep 60
 echo "ELK Stack started!! Enjoy ELK"
 echo "
 "
 echo "Your List of Docker Processes"
 echo "
 "
 docker ps
 echo "
 "
