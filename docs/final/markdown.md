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

*Last Updated:May 10, 2013*

***Authors:***

* Shane Chin, sac2171  
* Molly Karcher, mdk2133  
* Luis E. P. lep2141  
* Brian Wagner, bhw2113  
* Miguel Yanez, may2114  

***Affiliation:***

* Columbia University  

## Introduction [intro] ##

###Design Goals of the CORaL Programming Language###

Our language addresses the problem of no native support in high-level languages for SQL queries and table manipulation. Currently, in order to talk to SQL databases in languages such as C, a bunch of complicated code is required and the queries are still implemented directly as ugly SQL statements represented by strings in your program. Our language will have specific data types and new keywords that will allow users to directly access and manipulate tables. Once the compiler is run, these commands can be translated into SQL commands.

The target users of our language are programmers who need to access and manipulate large amounts of data quickly and easily. We will assume that users have experience with high-level languages (i.e. Java/C) and knowledge of databases and database management, but may not have deep knowledge of SQL, just relational algebra.

Different from high-level programming languages, the scope of SQL includes data insert, query, update and delete, schema creation and modification, and data access control. As such it makes the way users program and communicate different than they would with higher-level languages. Also, due to SQL’s roots in relational algebra and tuple relational calculus, the structure of the language is radically different from high-level languages. SQL became a standard of the American National Standards Institute (ANSI) in 1986, and of the International Organization for Standards (ISO) in 1987. Since then, the standard has been enhanced several times with added features. Many have attempted to implement variations of SQL that allow the user to program in a more procedural fashion; this has made the language to branch of depending on the different vendors.

One of the first languages that seeked to combine the power of a high-level programming language with the database manipulation capabilities of SQL is Embedded SQL. Embedded SQL statements are SQL statements written inline with the program source code of the host language. The embedded SQL statements are parsed by an embedded SQL preprocessor and replaced by host-language calls to a code library.

Another such attempt to bridge the gap of procedural languages and SQL is Oracle’s PL/SQL. PL/SQL’s general syntax resembles that of Ada or Pascal. It supports variables, conditions, loops and exceptions.  


Finally, another such language from yet another vendor is Microsoft’s Transact-SQL. T-SQL expands on the SQL standard to include procedural programming, local variables, various support functions for string processing, data processing, mathematics, etc.

There is one problem that plagues all of these languages however, they aren’t portable, universal, and their syntax is clunky. Having dealt, with these languages the CORaL team has decided that there is an opportunity to address this problem with a proper language implementation. Unlike the languages described above, CORaL seeks to create a cleaner, easier to use, readable syntax that allows us to describe database manipulations using object-relational methods.

####Vendor-neutral, portable, and universal####

SQL code is not completely portable among different database systems, which can lead to vendor lock-in. The different makers do not perfectly follow the standard, they add extensions, and the standard is sometimes ambiguous. As such the proprietary languages that extended SQL to add procedural elements to it, suffer from different syntax as well as different levels of complexity. CORaL aims to remedy the vendor lock-in by offering a neutral, portable, and universal solution to the procedural extension of the SQL language. In order to remain backwards compatible with current systems, as well as to try and gain widespread adoption CORaL will support Oracle and Microsoft database implementations.

####Clean, familiar, and intuitive####

A primary goal of our language is to make interacting with SQL databases through a high-level language into a simple and intuitive experience. Because the language will natively support database manipulation, the SQL objects and data types will be just like the language’s primitives and standard data types, so interacting with them will not only be much cleaner, but feel as familiar as manipulating strings or integers.

CORaL will be similar in syntax and structure to C and Java, but support additional data types, such as database tables, entries, and queries. These data types will have many built-in functions by which users can perform relational algebra and construct queries. At compile time, the database-related objects and functions will be transformed into SQL code which can be sent to the database.

This will allow for more robust and streamlined programming for any applications which require complicated use of a database, and improve the ease with which such programs can be documented and maintained. The simple use and syntax of the database types will allow programmers who have only limited understanding of databases to easily construct queries and incorporate database usage into their applications, which will decrease the time needed to create the applications and the knowledge required.

The driving force behind the creation of CORaL is to integrate database manipulation into high-level programming. Currently, in languages such as C and Java, SQL queries are represented by strings, and any database code looks foreign and bulky. CORaL will transform this interaction from a dense, confusing web of strange keywords into a set of simple, elegant, and easy-to-read data types and commands.

####Object-relational, versatile and productive####

One of the biggest parts of the CORaL programming language is the ability to write code without added cognitive strain. Most SQL databases do not provide any built in mechanism for manipulating data as objects. Despite this missing feature, it is something that clearly most programmers want, as every SQL implementation has an Object Relational Mapper which simulates the effect of object orientation with an added abstraction layer. 

Our language will directly implement this relational mapper as a native feature of the language. By creating a language with strong object-relations, most programmers will have no problem picking up. Our intended stack and implementation allows our language to be versatile; less code allows developers to be more productive. 

The encapsulation of data within objects fits in with how developers already see the data, and as such allows for easier transition. While our language will have less similarities with SQL, we hope that the code reuse capabilities of object orientation will allow for smaller code, which is easier to maintain, and more versatile. All this results with developers who can write less, and do more.

####Easy-peasy####

The culmination of all these design requirements results in a language that is user-friendly above all else. The overall goal is to aid towards programmers with limited knowledge of SQL syntax, and to eliminate the need for creating queries when using different flavors of SQL. One of the ideas behind the design of SQL was to make queries appear almost as sentences. While this works for trivial statements, it completely falls apart when you have a much larger statement to translate into a query. This forms the leading problem that the CORaL programming language aims to solve; that SQL is hard to parse for humans. This language allows one to represent a SQL query in a way that seems far more intuitive, especially to someone with programming experience, the main target audience of the language. 

By drawing functionality and syntax from commonly used languages, CORaL serves as an easy transition from any high-level programming language. The problem with these languages is that they become clunky and difficult to use once databases connection and integration is required. In building these features directly into the language, programming with a database becomes exponentially easier, leaving no better explanation for the language than easy-peasy. 

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

This will produce as output an executable file named 

	hello.clx
If everything has proceeded as expected so far, after inputting the command

	./hello.clx  
you will be greeted by the text

	Hello, world  
And just like that, you're a CORaL programmer!  

By now, you may be wondering exactly what makes CORaL, well, CORaL. The above program looks almost exactly like C code, and it would be valid at this point to raise the question "Why not just use C?" As promised, CORaL, does support object-relational database creating, manipulation, and querying, but a CORaL program is not required to implement this. We'll soon demonstrate how to incorporate this functionality into your program, but first, allow us to dive a little deeper into "bare bones," or "offline," CORaL.  

Just like C, CORaL programs are composed of functions and variables. Variables store data and functions use statements to interact with data. Within a CORaL program, you are at liberty to create as many or as few functions as you'd like, but the execution of a CORaL program will always invoke `main` and thus the inclusion of this function is requisite. It is from `main` that the rest of your functions can be called.  

In looking at the source code for the "Hello, world" program, we can see that the function `main` receives no arguments (there is nothing between the `()` following `main`), and the function definition is found between braces `{}`. Likewise, the `printf` function follows a similar structure, but receives as input the string literal `"Hello, world\n"` as input. In the definition of `main`, we see that the return type of the function `main` is denoted as `void`, meaning nothing is returned from the function.  

All of this should be (almost painfully) familiar to the veteran C programmer, so let us proceed a bit more quickly.

### Functions, Variables, and Control Flow in CORaL ###

The next program we present will show off many aspects of "bare bones" CORaL that will teach the programmer how to define and implement function of his or her own creation. Specifically, we will create a function that takes as input two numbers, the base and exponent, and computes and prints out the result. For example, if the input was `(2,3)` then the output would read as follows  

	The result of 2 ^ 3 is 8

An understanding of the source code for this program will enable the user to do almost anything with the offline version of CORaL. Here we introduce functions, variables, arrays, loops, string formatting, and commenting.


	
	void printExp(int b, int e)
	{
		int result = b**e;
		printf("The result of " + b " ^ " + e + 
				" is " + result);
	}

	int main()
	{
		int base = 2;
		int exp = 3;
		// Call the exponentiation function
		printExp(base, exp);
		return 0;
	}


The general structure and implementation of this program should still be familiar to C and Java programmers, but there are some subtle differences. As in C, the lines that begin with either `//` or `/*` are comments, and ignored by the compiler. Comments beginning with `//` extend to the end of the current line; comments beginning with `/*` extend until the `*/` and can stretch over multiple lines.

You will again observe that our first function is the `main()` function. This time, however, we have prefaced the declaration with `int`. This means that the return value of the function is going to be an `int`, which is a data type in CORaL. It is customary (as it is in C) to return 0 at the end of a successfully run `main` function, and return a nonzero value in the event of an error.

Unlike our "Hello, world" program, the `main` function here includes a call to a separate, user-defined function called `printExp`. This is where the differences from C begin to arise. CORaL has shed the bulky notion of header files, and does not require the user to provide prototypes for functions. Instead, the CORaL compiler finds functions not defined in the included libraries, and looks for them elsewhere in the code (assuming the programmer did the due diligence of implementing them). In our case, the definition of `printExp` precedes the statement in `main`  at which it is called, so that the compiler can still find it at compile time. As with `printf`, the `printExp` function is called by simply typing the name and providing arguments with parentheses.

This program has also introduced us to our first variables. This program uses `int` values to hold the values of numbers and their squares, and then prints them using the `printf` function. The program also uses arrays, but we'll get to those in a moment. Other datatypes supported by CORaL include `float`, `string`, `void`, and `Table`.

Control flow in CORaL is similar to that of most other high-level languages. CORaL accepts the following control flow

	for(expr; condition; expr) {
	}
	
	while (condition) {
	// do something
	}
	
	if (condition) {
	// do something
	} else {
	// do something else
	}
We expect that these constructs should be familiar enough to our readers, so we will not elaborate further.

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

For our purposes instead of having someone host a server instance we will user the following connection block that works with in-memory SQLite3.

	#cordbconn
	server=""
	user=""
	password=""
	port=""
	DBName=""
	type="sqlite"
	#enddbconn

Now let us create a simple database, with only one table, and add an entry to it. CORaL will have the ability to detect if the current database is already created, and create it if it does not already exists.

	#cordb
	Table Person {
		firstName : string;
		lastName : string;
		age : int;
		primary_key(firstName);
	};
	#enddb
 
	int main()
	{
		user_t Person samePerson;
		connectDB;
		samplePerson = Person(firstName = "John", lastName = "Example", age = 25);
		samplePerson.add();
		closeDB;
		return 0;
	}
	
This program, though short, has introduced many of the features of CORaL. We have created a new database, added a table, created an object using our new table's class, and added the object to the table. We will walk through this line by line below. CORaL provides the ability to connect to, create, and manage databases, along with many functions to assist with that process.

The actual definition of databases in CORaL takes place outside of the other function definitions and between the two preprocessor statements `#cordb` and `#enddb`. Here, SQL-like code is used to describe different tables in the database. Most variants of SQL will be understood by the compiler. Looking at the `Person` table within the database definition, we can see that the table definition is identical to SQL, with the exception of the table creation statement. 

After the creation of the `Person` table, that table can be referenced and accessed by all functions within a CORaL program. Creating a new `Person` object is done within the lines

	user_t Person samplePerson = Person(firstName = "John", lastName = "Example", age = 25

In CORaL, new database object are always defined using the `user_t [name of table] [variable name] = [name of table](attribute list)` syntax. The various object attributes are filled in between the parentheses following the name of the object, and are done in the key-value format. The order of the keys does not matter, and any values not specified will be filled in as `null`.

To formally add the new object to the database table, CORaL simply invokes the function `[new table row].add()`.

### Database Connections, Queries, and File Manipulation in CORaL ###

The above program demonstrates how to define and populate a new database within a CORaL program. A database, however, isn't of much use to the user unless it can be queried. The below program will demonstrate how to create queries, and also how to print the results to local files. We're going to define the same database schema as the previous example, but omit the code filling it for the sake of clarity.

	#cordbconn
	// The same connection as used above.
	#enddbconn

	#cordb
	// The same connection as used above.
	#enddb

	int main() {
		File fp;
		int i;
		int size;
		/* We’ll also omit the code used 
		to fill the database, but assume that 
		it is present */
		fp = fopen(“query_results.txt”, "w");
		fprintf(fp, "People over the age of 21\n");
		result = People.get(age>21);
		size = sizeof(result);

		for(i=0; i < size; i++) {

			user_t Person user = result[i];
			fprintf(fp, user.firstName + " " 
					+ user.lastName + "\n");
	
		}
	
		fclose(fp);

		return 0;
}

Here is the output of this program as they would be displayed in `query_results.txt`:

	People over the age of 21
	Shane Chin
	Molly Karcher
	Luis E. P.
	Brian Wagner
	Miguel Yanez

We've shown off a lot of CORaL functionality in the above program. The first new concept is querying. The `get()` function is a built-in function that every `Table` has. It is used to search through rows within a database table that match the arguments of the function. The arguments to the function are the attributes of the `Table` on which `get()` is being called on. For example `User.get(age>21, name="Luis")` translates to the following SQL:

	SELECT "User".age AS age , "User".name AS name FROM "User" WHERE age > 21 and name == "ed" 

In the future more complicated `get()` expressions will be supported.

Another concept introduced in this program is the notion of files. A `File` is an object in CORaL, and the functiones used to operate on it are included in the standard library. These include `fopen()`, `fclose()`, `fprintf()`, `freadline()` functions, which operate as one would expect. 

With a working knowledge of CORaL queries under your belt, you can begin fully utilizing the language for database manipulation. These example programs, while simple, contain all of the building blocks required to create the powerful, yet clean and efficient, object-relational programs typical of the CORaL language. We trust that you have found them both useful and inspirational.

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
