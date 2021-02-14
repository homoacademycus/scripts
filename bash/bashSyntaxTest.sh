#!/bin/bash

myvar=1
MYVAR="one"

testIf(){
	if[ $myvar -eq 10 ] then
	echo "equal"
	elif[ $myvar -gt 10 ] then
	echo "grater"
	else
	echo "base"
	fi
}
testFor(){
	for arg in 1 2 3
	do
	echo $arg
	done
}
testWhile(){
	while[ $MYVAR = "two" ]
	do
	MYVAR = "one"
	done
}
testInput(){
	echo -n "enter password:"
	read password
	echo $password
}
testInput

