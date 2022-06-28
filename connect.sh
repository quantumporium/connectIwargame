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

 [+] create usage function
	[ ] test usage function
 [+] create connection / arguement level number 
	[ ] test connection function
 [+] create password rememberer
	[ ] test password rememberer / arguement level number
 [+] add password 
	[ ] test password rememberer / argumement level number
 [+] check progression
	[ ] 
 [ ] create error message
 [ ] post on github ???

todo

# library of function -> main flow start at line: 
usage()
{
echo """
[+] name: connect_ioWargame
[+] traditional usage: ./connect_ioWargame {l|k|a|p} [argument]
[+] usage:
	-l : connect to a ioWargame level 
	-k : give the flag of a ioWargame level 
	-a : add  the flag of a ioWargame level in database
	-p : check progression in the ioWargame
"""

}

connect()
{
echo ""[+] connecting into  $1@io.netgarage.org ...""
ssh -p2224 $1@io.netgarage.org

}

get_password()
{
echo ""[+] searching key for $1@io.netgarage.org ...""
echo ""[++] $( cat .pass | grep $1: ) ""
}

add_password()
{
echo "[+] adding key for $1@io.netgarage.org ..."

if [[ $( cat .pass | grep $1: ) != ""  ]]
then
	echo "[++] a password already exist for this level it is ..."
	echo "[++] $( cat .pass | grep $1: ) "

else
	echo "$1: $2" >> .pass
	echo "[++] the command was sucessfull check it for yourself ..."
	echo "[++] $( cat .pass | grep $1: )"

fi
}

parse_com()
{
echo "this is the arguments passed -> $@|"

if [ $2="-h" ]
 then 
  echo "this is usage" 

elif [[ $2="-l" ]]
then
	echo "this is connect"
 if [ "$3" == "^[0-9]+$"]  $$ [ 1 <= "$3" <= 10 ]
 then
		echo "this should connect to $3"
 fi

else
	echo "there a problem"
fi

}

# this how you pass argument to a function in bash
# remember $@ -> all the argv $#  
parse_com $@
