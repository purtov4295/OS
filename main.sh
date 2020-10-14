#!/bin/bash


if [[ "$1" = "-h" || "$1" = "--help" ]]
then
	echo "Авторы: Пуртов Михаил, Мильват Кирилл"
	echo "-h, --help - справка"
	echo "-i, --info - информация о сетевых интерфейсах"
	echo "-u, --up - включение интерфейса [-u\--up interface_name_i]"
	echo "-d, --down - отключение интерфейса [-d\--down interface_name_i]"
	echo "-c, --config - установка IP/MASK [-c\--config cur_ip new_ip new_mask]"
	echo "-g, --gateway - установка Gateway [-g\--gateway destination gateway]"
	echo "-k, --kill - убийство процесса по занимаемому порту [-k\--kill port]"
	echo -e "\nПримеры:"
	echo "./main.sh -d lo"
	echo "./main.sh -i"
	exit
fi

if [[ "$1" = "-i" || "$1" = "--info" ]]
then
	ip a
	exit
fi

if [[ "$1" = "-u" || "$1" = "--up" ]]
then
	if [ "$2" = "" ]; then
		echo "[ -u | --up interface]"
		exit
	fi
	for param in "$2"
	do
		sudo ip link set $param up
	done
	exit
fi

if [[ "$1" = "-d" || "$1" = "--down" ]]; then
	if [ "$2" = "" ]; then
		echo "[ -d | --down interface_name_i]"
		exit
	fi
	for param in "$2"
	do
		sudo ip link set $param down
	done
	exit
fi

if [[ "$1" = "-c" || "$1" = "--config" ]]; then
	if [[ "$2" = "" || "$3" = "" ]]; then
		echo "[ -c | --config new_ip cur_ip]"
		exit
	fi
	sudo ip addr add $2 dev $3
	exit
fi

if [[ "$1" = "-g" || "$1" = "--gateway" ]]; then
	if [[ "$2" = "" || "$3" = "" ]]; then
		echo "[ -g | --gateway destination gateway]"
		exit
	fi
	sudo ip route add $2 via $3
	exit
fi

if [[ "$1" = "-k" || "$1" = "--kill" ]]; then
	if [ "$2" = "" ]; then
		echo "[ -k | --kill port]"
		exit
	fi
		kill $2
	exit
fi

if [ "$1" = "" ]; then
	echo "-h, --help - справка"
fi