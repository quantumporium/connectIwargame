# connect to IO wargame (connectIwargame)
Connnect to Io wargame is a single bash script create to simplify the process
of remote connecting to (IO wargame)[https:\\io.netgarage.org]. It has other
functionality that I found interesting to implement. 

## Table of contents
- Installation and Launch
- Usage
- Option
- Testing
- License

## Installation and Launch
Install the scrypt by either downloading with the user interface of github, by
copying the repositery on your local machine or by using curlor other similar 
command. You can launch the shell program in a shell, to be honest I don't know
if it will work in a not-unix environment like windows. 

## Usage
The basic usage of connectIwargame is ````./connect.sh {option} [argument] ````.
For example ````./connect.sh -l level1 ```` will connect to the first level of
IO wargame. 

The option and the accept argument are given below.
```bash
	-h:	show the help/usage page
	-f:	show the flag of a given level (you first need to add the flag to the databse)
	-a:	add the flag of a given level to the database
	-l:	connect to a given level of IO wargame
```

The argument accept by the option are cited below, keep in mind that I didn't
implement a throught error handdling in the code so not respecting the accepted
argument might crash the scrypt.

```terminal
	-h [nothing]
	-l [level name] you need to give the full level name not just the number
	-a [level] [flag] give the full level and the full flag
	-f [level] again the full name of the level
```

## Testing
Most of the function testing were made by hand during development. Mainly
because I don't know how to unit test bash scrypt.

## License
This project use the GPL-2.0 license
