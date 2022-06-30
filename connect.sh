#!/bin/bash
# author: @quantumporium
# title : IO wargame connector
# 
#
#
#
<< todo
I whant to be able to use this script to allow me to easely connect to io wargame without entering a lenghty 
text.

It need to take the level I am at a entry, return a usage message when no argument are giving or when --help is giving

It also need to return a error message is the program occure some.

It also need to keep track of where in the ctf I am and what where the previous ctf password/key.

all test were made by hand and note by unit test ...

 [+] create usage function
	[+] test usage function
 [+] create connection / arguement level number 
	[+] test connection function
 [+] create password rememberer
	[+] test password rememberer / arguement level number
 [+] add password 
	[+] test password rememberer / argumement level number
 [+] create error message
 [ ] post on github ???

todo

# library of function -> main flow start at line: 
usage()
{
echo """
[+] name: connect_ioWargame
[+] traditional usage: ./connect_ioWargame -{l|k|a|h} [argument]
[+] usage:
	-l : connect to a ioWargame level 
	-f : give the flag of a ioWargame level 
	-a : add  the flag of a ioWargame level in database
	-h : show usage/function page
"""

}

fatal()
{
	echo "[ ERROR ] an fatal error occur"
}

connect()
{
echo ""[+] connecting into  $2@io.netgarage.org ...""
ssh "$2"@io.netgarage.org

}

get_flag()
{
echo ""[+] searching key for $2@io.netgarage.org ...""
echo ""[++] $( cat .pass | grep $2: ) ""
}

add_password()
{
echo "[+] adding key for $2@io.netgarage.org ..."

if [[ $( cat .pass | grep $2: ) != ""  ]]
then
	echo "[++] a password already exist for this level it is ..."
	echo "[++] $( cat .pass | grep $2: ) "

else
	echo "$2: $3" >> .pass
	echo "[++] the command was sucessfull check it for yourself ..."
	echo "[++] $( cat .pass | grep $2: )"

fi
}

main()
{
# example usage: ./scrypt -l level1
echo "this is the arguments passed -> $@|"
if [[ "$1" == "-h" ]]
then
	usage

elif [[ "$1" == "-l" ]]
then
	if [[ "$2" != "" ]]
	then
		connect $@
	else
		echo "[ ERROR ] You need to give a level"
	fi

elif [[ "$1" == "-f" ]]
then 
	if [[ "$2" != "" ]]
	then
		get_flag $@
	else
		echo "[ ERROR ] You need to give a level"
	fi

elif [[ "$1" == "-a" ]]
then
	if [[ "$3" != "" ]]
		add_password $@
	else
		echo "[ ERROR ] You need to give the level and the flag"
	fi

else
	fatal

fi

}

# this how you pass argument to a function in bash
# remember $@ -> all the argv $#  
main $@
