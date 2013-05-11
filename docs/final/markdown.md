Title: 	CORaL Project Report  
Author:	Shane Chin, sac2171  
	Molly Karcher, mdk2133  
	Luis E. P. lep2141  
	Brian Wagner, bhw2113  
	Miguel Yanez, may2114  
Affiliation:	Columbia University  
Web:	https://github.com/l31g/coral
Date: 	May 10, 2013  

# CORaL Project Report #

fds

## Introduction [intro] ##

bla ble bli  

## Language Tutorial [tut] ##

Here we present five simple CORaL programs with the aim of introducing the reader to the core elements and components of CORaL. These will cover the basics of the CORaL language: working with variables and primitives, control flow, database integration and access, implementing simple database queries, and manipulation of files. Those well-versed in C should find working with CORaL functions to be completely familiar and intuitive, and we hope that the object-relational aspects of CORaL come equally naturally to those with previous exposure to databases and SQL, as well as those who have little-to-no experience with databases.   

### Getting Started With CORaL ###

As per tradition, the first program we present you with is the timeless “Hello, world.” Once you see these two words appear on your console, you’ve taken the first step towards unleashing the power of the CORaL language. Let this short program be your stepping stone to much greater things.  
The CORaL program to print “Hello, world” is shown below:

	void main()
	{
		printf("Hello, world\n");
	}
Now that we’ve written it, it’s time to compile and run it. CORaL programs are typically saved in files with the extension “.cl” and compiled with the command

	coralc hello.cl
This will produce as output an executable file named "hello.clx." If everything has proceeded as expected so far, after inputting the command

	./hello.clx  
you will be greeted by the text

	Hello, world  
And just like that, you're a CORaL programmer!  

By now, you may be wondering exactly what makes CORaL, well, CORaL. The above program looks almost exactly like C code, and it would be valid at this point to raise the question "Why not just use C?" As promised, CORaL, does support object-relational database creating, manipulation, and querying, but a CORaL program is not required to implement this. We'll soon demonstrate how to incorporate this functionality into your program, but first, allow us to dive a little deeper into "bare bones," or "offline," CORaL.  

Just like C, CORaL programs are composed of functions and variables. Variables store data and functions use statements to interact with data. Within a CORaL program, you are at liberty to create as many or as few functions as you'd like, but the execution of a CORaL program will always invoke `main` and thus the inclusion of this function is requisite. It is from `main` that the rest of your functions can be called.  

In looking at the source code for the "Hello, world" program, we can see that the function `main` receives no arguments (there is nothing between the `()` following `main`), and the function definition is found between braces `{}`. Likewise, the `printf` function follows a similar structure, but receives as input the string literal `"Hello, world\n"` as input. In the definition of `main`, we see that the return type of the function `main` is denoted as `void`, meaning nothing is returned from the function.  

All of this should be (almost painfully) familiar to the veteran C programmer, so let us proceed a bit more quickly.

### Functions, Variables, and Control Flow in CORaL ###

The next program we present will show off many aspects of "bare bones" CORaL that will teach the programmer how to define and implement function of his or her own creation. Specifically, we will create a function that takes as input an array of numbers, and computes and prints out the square of each. For example, if the input was the array `{1,2,3,4,5}` then the output would read as follows  

	The square value of 1 is 1
	The square value of 2 is 4
	The square value of 3 is 9
	The square value of 4 is 16
	The square value of 5 is 25
An understanding of the source code for this program will enable the user to do almost anything with the offline version of CORaL. Here we introduce functions, variables, arrays, loops, string formatting, and commenting.

	int main()
	{
		int[] numbers = {1, 2, 3, 4, 5};
		// Call the square function with the array we defined
		printSquare(numbers);
		return 0;
	}
 
	void printSquares(int[] someNums)
	{
		/* Here we use a for loop to iterate over the array */
		for (int i = 0; i < someNums.length(); i++)
		{
			int squared = someNums[i]**2;
			printf("The square value of %d is %d\n", i, squared);
		}
	}
The general structure and implementation of this program should still be familiar to C and Java programmers, but there are some subtle differences. As in C, the lines that begin with either `//` or `/*` are comments, and ignored by the compiler. Comments beginning with `//` extend to the end of the current line; comments beginning with `/*` extend until the `*/` and can stretch over multiple lines.

You will again observe that our first function is the `main()` function. This time, however, we have prefaced the declaration with `int`. This means that the return value of the function is going to be an `int`, which is a datatype in CORaL. It is customary (as it is in C) to return 0 at the end of a successfully run `main` function, and return a nonzero value in the event of an error.

Unlike our "Hello, world" program, the `main` function here includes a call to a separate, user-defined function called `printSquares`. This is where the differences from C begin to arise. CORaL has shed the bulky notion of header files, and does not require the user to provide prototypes for functions. Instead, the CORaL compiler finds functions not defined in the included libraries, and looks for them elsewhere in the code (assuming the programmer did the due diligence of implementing them). In our case, the definition of `printSquares` follows the statement in `main`  at which it is called, but the compiler can still find it at compile time. As with `printf`, the `printSquares` function is called by simply typing the name and providing arguments with parentheses.

This program has also introduced us to our first variables. This program uses `int` values to hold the values of numbers and their squares, and then prints them using the `printf` function. The program also uses arrays, but we'll get to those in a moment. Other datatypes supported by CORaL include 'float', 'string', 'void', and 'Table'.

**FIX STUFF ABOUT PRINTING**

Control flow in CORaL is similar to that of most other high-level languages. Asisde from the `for` statement demonstrated in the above program, CORaL also accepts

	while (condition) {
	// do something
	}
	
	if (condition) {
	// do something
	} else {
	// do something else
	}
We expect that these constructs should be familiar enough to our readers, so we will not elaborate further.

**FIX STUFF ABOUT ARRAYS**

### Connecting to and Creating a Database in CORaL ###

Now that we have exhibited much of the basic functionality of CORaL, it is time to dive into the more important feature of CORaL, database management. As you have already seen, the execution of a CORaL program takes place within the `main()` function and any other functions which calls it. Now we demonstrate the other portion of a CORaL program, done outside of other function calls.

The first thing to do is create a connection to a server

	#cordbconn
	server = "localhost"
	user = "user"
	password = "pass"
	port = "8888"
	DBName = "People"
	type = "mysql"
	#enddbconn
Now let us create a simple database, with only one table, and add an entry to it. CORaL will have the ability to detect if the current database is already created, and create it if it does not already exists.

	#cordb
	Table Person {
		firstName : string,
		lastName : string,
		age : int,
		primary key(firstName)
	}
	#enddb
 
	int main()
	{
		Person samplePerson = Person(firstName = "John", lastName = "Example", age = 25);
		samplePerson.add();
		return 0;
	}
This program, though short, has introduced many of the features of CORaL. We have created a new database, added a table, created an object using our new table's class, and added the object to the table. We will walk through this line by line below. CORaL provides the ability to connect to, create, and manage databases, along with many functions to assist with that process.

The actual definition of databases in CORaL takes place outside of the other function definitions and between the two preprocessor statements `#cordb` and `#enddb`. Here, SQL-like code is used to describe different tables in the database. Most variants of SQL will be understood by the compiler. Looking at the `Person` table within the database definition, we can see that the table definition is identical to SQL, with the exception of the table creation statement. 

After the creation of the `Person` table, that table can be referenced and accessed by all functions within a CORaL program. Creating a new `Person` object is done within the lines

	Person samplePerson = Person(firstName = "John", lastName = "Example", age = 25);
In CORaL, new database object are always defined using the `[name of object] [variable name] = [name of object]` syntax. The various object attributes are filled in between the parentheses following the name of the object, and are done in the key-value format. The order of the keys does not matter, and any values not specified will be filled in as `null`.

To formally add the new object to the database table, CORaL simply invokes the function `[new object].add()`.

### Database Connections, Queries, and File Manipulation in CORaL ###



## Language Reference Manual [man] ##

bli blo blu

## Project Plan [plan] ##

blo blu bla

## Language Evolution [evol] ##

blu bla ble

## Translator Architecture [arch] ##

bla ble bli

## Development and Run-Time Environment [dev] ##

ble bli blo

## Test Plan [test] ##

bli blo blu

## Conclusions [conc] ##

blo blu bla

## Appendix [appendix] ##

blu bla ble
