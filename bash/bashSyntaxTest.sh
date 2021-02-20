#!/bin/sh

myvar=1
MYVAR="one"

testInput(){
	echo -n "enter password:"
	read password
	echo $password
}
testIf(){
    if [ $myvar -eq 10 ]; then
        echo "equal"
    elif [ $myvar -gt 10 ]; then
        echo "grater"
    else
        echo "base"
    fi
}
testCase(){
    echo -n "enter option:"
    read op
    case $op in
    1)
        echo "you selected 1"
        ;;
    2)
        echo "you selected 2"
        ;;
    *)
        echo "you selected nither 1 nor 2"
        ;;
    esac
}
testFor(){
	for arg in 1 2 3
	do
	echo $arg
	done
}
testWhile(){
	while [ $MYVAR = "two" ];
	do
	MYVAR = "one"
	done
}
testPath(){
    echo "`dirname $0`"
    echo $BASH_SOURCE
    echo $(dirname -- "$(readlink -f -- "${BASH_SOURCE[0]}")")
    echo $PWD
}
testPath

