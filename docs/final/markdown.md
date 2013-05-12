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

*Last Updated: May 11, 2013*  

***Authors:***  

* Shane Chin, sac2171, Testing & Verification  
* Molly Karcher, mdk2133, Language Guru  
* Luis E. P. lep2141, Systems Architect  
* Brian Wagner, bhw2113, Project Manager  
* Miguel Yanez, may2114, Systems Integrator  

***Affiliation:***   

* Columbia University  

## Introduction [intro] ##

###Design Goals of the CORaL Programming Language###

CORaL addresses the problem of no native support in high-level languages for SQL queries and table manipulation. Currently, in order to talk to SQL databases in languages such as C, a bunch of complicated code is required and the queries are still implemented directly as ugly SQL statements represented by strings in your program. Our language will have specific data types and new keywords that will allow users to directly access and manipulate tables. Once the compiler is run, these commands can be translated into SQL commands.  

The target users of our language are programmers who need to access and manipulate large amounts of data quickly and easily. We will assume that users have experience with high-level languages (i.e. Java/C) knowledge of databases and database management, but may not have deep knowledge of SQL, just relational algebra.  

Different from high-level programming languages, the scope of SQL includes data insert, query, update and delete, schema creation and modification, and data access control. As such it makes the way users program and communicate different than they would with higher-level languages. Also, due to SQL’s roots in relational algebra and tuple relational calculus, the structure of the language is radically different from high-level languages. SQL became a standard of the American National Standards Institute (ANSI) in 1986, and of the International Organization for Standards (ISO) in 1987. Since then, the standard has been enhanced several times with added features. Many have attempted to implement variations of SQL that allow the user to program in a more procedural fashion; this has made the language to branch of depending on the different vendors.

One of the first languages that sought to combine the power of a high-level programming language with the database manipulation capabilities of SQL is Embedded SQL. Embedded SQL statements are SQL statements written inline with the program source code of the host language. The embedded SQL statements are parsed by an embedded SQL preprocessor and replaced by host-language calls to a code library.

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

Before you can begin writing programs in CORaL, you need to first ensure that you have the CORaL compiler installed on your local machine. After you unzip the CORaL package, you can use the following commands to compile and install the source. 

	make all
	make install
	make backend

The first command will compile all the source, and the second will compile the source, install dependencies, and install coralc into /usr/local/bin so that you are able to run the coral compiler from the command line. THe last command will install the Python backend and dependencies that are required to run the CORaL executable file.

And now, let's start writing CORaL. As per tradition, the first program we present you with is the timeless “Hello, world.” Once you see these two words appear on your console, you’ve taken the first step towards unleashing the power of the CORaL language. Let this short program be your stepping stone to much greater things.  
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
		printf("The result is "); 
		printf(result);
	}

	int main()
	{
	   /* 
		*	This is a really long comment that goes over
		*  	multiple lines
		*/
		int base = 2;
		int exp = 3;
		// Call the exponentiation function
		printExp(base, exp);
		return 0;
	}


Compiling and running this CORaL program should produce the output:

	The result is 8

The general structure and implementation of this program should still be familiar to C and Java programmers, but there are some subtle differences. As in C, the lines that begin with either `//` or `/*` are comments, and ignored by the compiler. Comments beginning with `//` extend to the end of the current line; comments beginning with `/*` extend until the `*/` and can stretch over multiple lines.

You will again observe that our first function is the `main()` function. This time, however, we have prefaced the declaration with `int`. This means that the return value of the function is going to be an `int`, which is a data type in CORaL. It is customary (as it is in C) to return 0 at the end of a successfully run `main` function, and return a nonzero value in the event of an error.

Unlike our "Hello, world" program, the `main` function here includes a call to a separate, user-defined function called `printExp`. This is where the differences from C begin to arise. CORaL has shed the bulky notion of header files, and does not require the user to provide prototypes for functions. Instead, the CORaL compiler finds functions not defined in the included libraries, and looks for them elsewhere in the code (assuming the programmer did the due diligence of implementing them). In our case, the definition of `printExp` precedes the statement in `main`  at which it is called, so that the compiler can still find it at compile time. As with `printf`, the `printExp` function is called by simply typing the name and providing arguments with parentheses.

This program has also introduced us to our first variables. This program uses `int` values to hold the values of numbers and their squares, and then prints them using the `printf` function. Other datatypes supported by CORaL include `float`, `string`, `void`, and `Table`.

Control flow in CORaL is similar to that of most other high-level languages. CORaL accepts the following control flow

	for(expr; condition; expr) {
		// do something
	}
	
	while (condition) {
		// do something 
	}
	
	if (condition) {
		// do something
	} 
	else {
		// do something else
	}

We expect that these constructs should be familiar enough to our readers, so we will not elaborate further.

### Connecting to and Creating a Database in CORaL ###

Now that we have exhibited much of the basic functionality of CORaL, it is time to dive into the more important feature of CORaL, database management. As you have already seen, the execution of a CORaL program takes place within the `main()` function and any other functions which calls it. Now we demonstrate the other portion of a CORaL program, done outside of other function calls.

The first thing to do is create a connection to a server

	#cordbconn
	server = "localhost";
	user = "user";
	password = "pass";
	port = "8888";
	DBName = "People";
	type = "mysql";
	#enddbconn

For our purposes instead of having someone host a server instance we will user the following connection block that works with in-memory SQLite3. If you have unzipped and installed CORaL as directed above, you local machine should be ready-to-go to connect to SQLite3.

	#cordbconn
	server="";
	user="";
	password="";
	port="";
	DBName="";
	type="sqlite";
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
		user_t Person samplePerson;
		connectDB;

		samplePerson = Person(firstName = "John", lastName = "Example", age = 25);
		samplePerson.add();
		closeDB;
		return 0;
	}
	
This program, though short, has introduced many of the features of CORaL. We have created a new database, added a table, created an object using our new table's class, and added the object to the table. We will walk through this line by line below. CORaL provides the ability to connect to, create, and manage databases, along with many functions to assist with that process.

The actual definition of databases in CORaL takes place outside of the other function definitions and between the two preprocessor statements `#cordb` and `#enddb`. Here, SQL-like code is used to describe different tables in the database. Most variants of SQL will be understood by the compiler. Looking at the `Person` table within the database definition, we can see that the table definition is identical to SQL, with the exception of the table creation statement. 

After the creation of the `Person` table, that table can be referenced and accessed by all functions within a CORaL program. Creating a new `Person` object is done with the lines

	user_t Person samplePerson = Person(firstName="John", lastName ="Example", age=25);

In CORaL, new database object are always defined using the following syntax:

	`user_t [name of table] [variable name] = [name of table](attribute list)` 

The various object attributes are filled in between the parentheses following the name of the object, and are done in the key-value format. The order of the keys does not matter, and any values not specified will be filled in as `null`.

To formally add the new object to the database table, CORaL simply invokes the function `[new table row].add()`.

### Database Connections, Queries, and File Manipulation in CORaL ###

The above program demonstrates how to define and populate a new database within a CORaL program. A database, however, isn't of much use to the user unless it can be queried. The below program will demonstrate how to create queries, and also how to print the results to local files. We're going to define the same database schema as the previous example, but omit the code filling it for the sake of clarity.

	#cordbconn
	server="";
	user="";
	password="";
	port="";
	DBName="";
	type="sqlite";
	#enddbconn

	#cordb
	Table Person {
		firstName : string;
		lastName : string;
		age : int;
		primary_key(firstName);
	};
	#enddb

	int main() {
		File fp;
		int i;
		int size;
		user_t Person u;
		user_t Person result;	
		
		connectDB;
		user_t Person molly = Person(firstName="molly", age=22);
		user_t Person miguel = Person(firstName="miguel", age=22);
		user_t Person shane = Person(firstName="shane", age=22);
		user_t Person brian = Person(firstName="brian", age=21);

		molly.add();
		miguel.add();
		shane.add();
		brian.add();

		fp = fopen("output.txt", "w");
		fprintf(fp, "People over the age of 21\n");
		result = Person.get(age>21);
		size = sizeof(result);

		for(i=0; i < size; i++) {
		u = result[i];
			fprintf(fp, u.firstName + "\n");
		}
		fclose(fp);
		
		closeDB;

		return 0;
	}

Here is the output of this program as they would be displayed in `query_results.txt`:

	People over the age of 21
	molly
	miguel
	shane


We've shown off a lot of CORaL functionality in the above program. The first new concept is querying. The `get()` function is a built-in function that every `Table` has. It is used to search through rows within a database table that match the arguments of the function. The arguments to the function are the attributes of the `Table` on which `get()` is being called on. For example `User.get(age>21, name="Luis")` translates to the following SQL:

	SELECT "User".age AS age , "User".name AS name FROM "User" WHERE age > 21 and name == "Luis" 

In the future more complicated `get()` expressions will be supported.

Another concept introduced in this program is the notion of files. A `File` is an object in CORaL, and the functiones used to operate on it are included in the standard library. These include `fopen()`, `fclose()`, `fprintf()`, `freadline()` functions, which operate as one would expect. 

With a working knowledge of CORaL queries under your belt, you can begin fully utilizing the language for database manipulation. These example programs, while simple, contain all of the building blocks required to create the powerful, yet clean and efficient, object-relational programs typical of the CORaL language. We trust that you have found them both useful and inspirational.

## Language Reference Manual [man] ##

### Introduction ###

This manual describes the CORaL 1.0 language as established in May of 2013. It is modeled after the C Reference Manual included in Appendix A of *The C Programming Language* by Kernighan and Ritchie. CORaL (C-like Object-Relational Language) integrates elements of C with native SQL support, that can be written directly into your source program. 

### Lexical Conventions ###

CORaL programs are translated in several phases. Translation begins with searching for the `#` character in order to look for the `#cordbconn` and `#enddb` tags, which will be used to connect to a database, after which you can create database objects. This is similar to, but not exactly the same as a preprocessor element, in that it does not do any preprocessing. The CORaL backend reads between the tags and connects to the corresponding database when it sees the connectDB command within a CORaL program. So essentially, everything between the tags is read in by the compiler, but only processed and used when the programmer explicitly asks for a connection. Next, there are `#corddb` and `#enddb` tags, between which the programmer may define the database tables that they wish to include in their program, and then add them to the database that they have connected to. The programmer may only use this functionality if they also provide a database connection scheme between the `#corddbconn` and `#enddbconn` tags. 

#### Tokens ####

CORaL implements implements six kinds of tokens: identifiers, keywords, constants, operators, and separators. Anything characterized as "white space" (which includes blanks, tabs, and newlines) is ignored by the compiler. Tokens consist of the longest sequential string characters that could constitute a token.

#### Comments ####

Comments in CORaL can be done in two styles. The first is an inline comment, designated by `//`. The compiler ignores everything after `//` until the conclusion of the line. Comments can also be begun with `/*` and concluded with `*/`. This flavor of comment can span multiple lines. Once the compiler sees a `/*` it will ignore everything until it sees another `*/`. 

#### Identifiers ####

An identifier is a sequence of letters and digits. Identifiers in CORaL have similar restrictions as those in C. The first character of an identifier must be a letter (the '`_`' character counts as a letter). The language is case-sensitive, so upper and lower case letters are considered different, and identifiers can have any length. 

#### Keywords ####

CORaL reserves the following identifiers for use as keywords:  

	if 				else 				while 			for	
	return  		global  			server 			port  				
	user 			password			type  			DBName 			
	primary_key		foreign_key 		connectDB  		closeDB 
	int  			float 				void 			Table
	user_t 			get 				add  			sizeof	
	string  		File

Most of these reserved words are similar to those reserved in C, and one can interpolate what they will be used for. All of the words `server`, `port`, `user`, `password`, `type`, `DBName`, and `type` are required to connect to the database and will be described later in the language tutorial. The `connectDB` and `closeDB` words are used to connect to and disconnect from the database. The key-related words are also obviously used within database definitions. All of the words `int`, `string`, `float`, `void`, `File`, `Table` are types in the language and so cannot be used other than in that context. The `user_t` is a user-defined type, similar to `struct` in C and must be declared before each user-defined type. The remaining reserved words are `get`, `add`, `sizeof` are built-in functions that are used on database manipulations, so they cannot be used in any other context.  	

#### String Literals ####

A string literal is a sequence of characters surrounded by double quotes. An example would be `"this string"`. A string has type `string` and is initialized with the given characters that are valid for a general string literal; this includes any characters that are valid identifiers as well as whitespace characters. Adjacent string literals are concatenated into a simple string. String literals do not contain newline or double-quote characters; in order to represent them, one can use the following escape sequences:  

	newline					\n
	tab						\t

Strings can be concatenated in CORaL the same way that they would be in Java, using the `+` operator. 

### Syntax Notation ###

Here, we are not describing the syntax of our language, but rather the syntax that we used within this manual to describe our language and our grammar. It should be noted that none of this is CORaL syntax, and is purely used in this document for clarification.

It may have been interpolated already that the *italic* type is used to indicate syntactic categories, or grammar rules. The `console` type is used to indicated literal words or characters that are part of the CORaL grammar. 

When describing the grammar of our language the *-->* symbol denotes the way that certain variables in the grammar are defined. The expression on the left hand side is the name of that expression and the right hand side shows the different definitions that a symbol can take on when it appears in a larger expression. The pipe | symbols represent "or" in this case. So for example, the grammar statement 
	
	*S --> true* 

indicates that the expression *S* can take on either value *true* or value *false*. This syntax is very similar to the way our grammar was defined in the implementation stage, when written in OCaml, so our syntax throughout should look very familiar to those familiar with OCaml style.

### Meaning of Identifiers ###

The term identifier can refer to a function or an object (objects includes variables). Objects are locations in memory, and each object has a type which identifies how the object's data should be interpreted. Object names also have scopes, which are the regions of the program in which the object is know to the program. CORaL is not object-oriented by any means. So when we talk about *Objects*, what we really mean are *Tables*. Tables will be explained later, but are the closest thing that we have in CORaL to Objects, and we treat them the same as we would user-defined objects if CORaL were to be object-oriented.

#### Basic Types ####

The basic types in CORaL are `int`, `float`, `string`, `void`, `Table` and `user_t`. An `int` supports arithmetic operations; the `float` type is a single-precision floating point number; a `string` is a sequence of characters. CORaL has eliminated the need to user `char` types. The `void` type is an empty value used as the return value for a function that does not return anything. The `Table` type represents a table in the database and the type `Table` is only used when a `Table` is declared between the `#corddb` and `#enddb` blocks. The type `user_t` denotes a user-defined type. This is used whenever an instance of a `Table` type is defined, because the type will need to be the name which the user gives to it. `File` types are used when creating files.

#### Derived Types####

The derived types in CORaL are built out of the basic types in the following ways:  

* *functions* : that return an object or variable of a given type
* *Tables* : that emulate SQL tables
* *user_t* : user-defined types, Table instances

### Expressions ###

The priority sequence of expressions is the same as the are presented within these subsections, and within each subsection the operations all have equal preference.

#### Primary Expressions ####

Primary expressions are identifiers, constants, strings, or expressions that are encased in parentheses.  

#### Postfix Expressions ####

Like all primary expressions, postfix expressions are also grouped left to right. Postfix expressions that are valid expressions in CORaL are `++` and `--` which just indicate `+1` and `-1`, respectively. Other than this, there are no postfix expressions present in CORaL. 

#### Unary Operators ####

Expressions with unary operators are grouped right-to-left which is the opposite of everything that has come thus far. The operators `+` and `-` are the only unary operators in the language. They can be applied to any expression that has either an `int` or `float` type. 

#### Multiplicative Operators ####

All of the operators must be given arithmetic types, so only `int` or `float` will be accepted as valid inputs to the expression. The `%` operator must have `int` type. The `*` operator yields multiplication, the `/` operator yields the quotient, the `%` yields the remainder, and the `**` operator yields exponentiation. If the second operand of the `/` or the `%` operator is `0` then the result will be undefined.

#### Additive Operators ####

The additive operators in the language are `+` and `-` and are also grouped from left-to-right. All the operands given to these operators need to be of arithmetic type. The result of the `+` operator is the sum of the operands and the result of the `-` table is the difference of the operands.

#### Relational Operators ####

The relational operators are grouped from left-to-right, the same way that the additive and multiplicative operators are. The operators are `<`, `>`,`<=`, and `>=`. The < operator denotes “less than” and will return true if and only if the expression on the left evaluates to a value that is exclusively less than the value that the expression on the right hand side evaluates to. The > operator denotes “greater than” and will return true if and only if the expression on the left evaluates to a value that is exclusively greater than the value that the expression on the right evaluates to. The <= operator denotes “less than or equal to” and performs the same function as the < operator, but also evaluates to true if the two expressions have an equal numerical or logical value. The >= operator denotes “greater than or equal to” and performs the same function as the > operator, but also evaluates to true if the two expressions have an equal numerical or logical value. It should be noted that there are technically no boolean types in CORaL, so these expressions don't actually return type booleans. Semantically, we check them to be equal to integers either 0 or 1 and then generated code is just passed to the language that CORaL is translated into; Python. Python will actually correctly handle this matching of booleans, so from CORaLs standpoint, we still don't need boolean types. Every time from now on in this document, when we refer to an expression returning a boolean value, this is what we actually mean.

#### Equality Operators ####

The `==` denotes “equal to” and `!=` denotes “not equal to” and will return a boolean value. The `==` and the != operators are analogous to the relational operators except for their lower precedence. Thus `a<b == c<d` is true whenever `a<b` and `c<d` have the same truth-value.)

#### Logical Operators ####

The logical AND operator is denoted by `&&` in CORaL. The `&&` operator groups left-to-right and guarantees left-to-right evaluation. It returns true if both of the operands are logically equivalent and false if they are not. 

The logical OR operator is denoted by `||` in CORaL. The `||` operator groups left-to-right and guarantees left-to-right evaluation. It returns true if both of the operands are logically equivalent and false if they are not. 

#### Assignment Expressions ####

There are several possible assignment operators in CORaL. The language utilizes the `=` assignment operator, which just simple assigns the value on the right to the value on the left. It also utilizes the `*=`, `/=`, `+=`, `-=` assignment operators, which perform the same assignment operation but first apply the designated operation between the left and right value.

The type of an assignment expression is that of the left operand, the value stored in the left operand after the assignment has taken place. However, type-checking does need to be implemented to make sure that a variable is not being assigned to a type that is not allowed.

An expression of the form `T1 op= T2` is equivalent to `T1 = T1 op (T2)` except that `T1` is evaluated only once. This is how it is handled in CORaL.

### Declarations ###

Declarations determine the type and name of an identifier. It is permissible in CORaL to both declare and initialize your variables at the same time, but it is not required. However, like C, all variable declarations must occur at the top of a function of file. Global variables are declared at the top of a file, and local variables are declared at the top of each function. If variables are declared after any other statements have been written, this should be an error in CORaL (note that is is just a warning in C). 

#### Type Specifiers ####

The type-specifiers assign a type to an object. They are: `void`, `int`, `string`, `float`, `user_t`, and `Table` Only one type-specifier is provided for a given declaration, anything else will result in an error in CORaL. Variables may only be declared once in a given scope. However, variables with the same name may be declared in different scopes if they are not overlapping.

#### Initialization ####

Objects can be initialized when declared in the following way:

	[type-specifier] [object-name] = [value]

So for examples of all our basic types, we would have:

	int a = 5;
	string b = "hi";
	float c = 5.0;

Our other types are slightly more complicated to initialize. A `File` type, for example, requires that the right operand be an fopen command.

	File f = fopen("output.txt", "w");

Where the first parameter to fopen indicates the name of the file that is to be opened, and the second parameter indicated to CORaL whether the user intends to read from the file ("r"), write to the file ("w"), or perform both reading and writing operations ("rw");

`Table` types require that they be initialized when they are declared. They are the only type in CORaL where this is true. And this is also the only type that cannot be declared using the assignment operator. They can be declared as follows:

	Table Person {
		name: String
		primary_key(name);
	}

User-defined types are all `Tables` and are initialized in a special way. They can only be initialized by giving the variable the type of Table that you want, as follows:

	user_t Person p = Person(name="John");

### Statements ###

All statements in CORaL are executed and do not return values, but are rather executed for their effect. Most statements are exactly the same as you would expect in most other languages. The main difference that we will see here is in the database connection statements, that are entirely unique to CORaL. 

#### Database Statements ####

Database statements in CORaL are very simply, statements that are used to connect to the external database that you have already defined with the `#corddbconn` and `#enddbconn` and created database schemas for in the `#cordb` and `#enddb` block. If you have declared a connection and a schema block, it is not required to connect to or use the database. However, if you want to use your database, then the programmer must explicitly tell the program that they wish to connect to the database. This would be done with the following statements:

	// connection block and schema block here

	void main(){

		connectDB;

		// your program here

		closeDB;
	}

Attempting to use database built-in functions without connecting to a database, or without defining a specification will not work in the CORaL grammar. 

#### Expression Statement ####

The majority of statements in CORaL ail fall into this category. Expression statements include assignments and function calls. Expression statements can be any type of expression that is defined in the CORaL grammar previously. These can be literals, assignment statements, arithmetic operators, build-in functions, function calls, and many others. To view a full listing of possible types of expressions, see the grammar at the end of this section, or the `parser.mly` file in the appendix. 

#### Selection Statements ####

Selection statements are used for control flow within a function. In an `if` statement, the expression is evaluated, and the following statement is executed if the expression is true. Otherwise, the statement following the `else` will be evaluated, if an `else` is present. An `else` is always paired to the last `if` statement without a matched `else`.

#### Iteration Statements ####

Iteration statements are concerned with looping. There are two types: `while` and `for`.  
In a `while` statement, the statement is evaluated as long as the expression is true. In a `for` statement, the first expression is evaluated to initialize the loop. The second expression must be arithmetic; the loop is executed as long as the second expression is true. The third expression is evaluated after every iteration of the loop and used for re-initialization.  
In either iteration-statement, any expression may be omitted. These are not different than what you would expect from most other languages.

#### Jump Statements ####

There is only one jump statement in CORaL, the `return` statement. `return` statements are used by functions to return to the caller. If an expression is present, the value of the statement is also returned. This value will be of the same type specified in the function definition. If a return is provided with no expression or no return is provided at all, the value will be undefined. 

#### Built-in Function Statements ####

Something that is also unique to CORaL, would be the series of built-in functions. These functions were defined specifically to assist programmers in writing SQL queries in a non-confusing syntax. There are two main built-in functions and they are named `add` and `get`. The `add` function is used to add a newly defined row to the database that has already been defined, and it is done like the following:

	p.add();

Where p is the name of a user_t type of the Person table (from example shown above). This function will save the row to the Table Person.

The other built-in function is the `get` operation, which allows programmers to specify queries. It is called like follows:

	p.get(age > 21);

Assuming the Person table has been populated with a series of rows of People, this query will return a list of all people over the age of 21. Any number of variables can be specified in the `get` function. Assuming all rows are actually present in the database, we can create very complicated, interesting queries.

	p.get(lastName="John", age>21, zip=10027);


#### File Statements ####

In CORaL, file manipulation is built directly into the language, there is no standard library. As a result, file commands are built directly into the grammar as statements. Files are types, as described above, but there are also several built-in functions to manipulate files. These functions are `fopen`, `fprintf`, `freadLine`, `fclose`, and these naming conventions were chosen to remain close to C in syntax. Opening a file is a statement that can be called like the following:

	File f = fopen("output.txt", "w");

This syntax was described above in initialization, so we will not go into detail about it here. 

The next is `fprintf` which is used like the following. It takes the file pointer and then the string to be printed to the file.

	fprintf(f, "Hello World\n");

The next is `freadLine` which is used like the following. It is slightly different than the other built-in functions in that it must be assignment to something. It takes a file pointer and returns a string that is the next line to be read within that file. 

	string p = freadLine(f);

The final function is `fclose` which is very simple. It just takes the file pointer as a argument and closes the file.

	fclose(f);

### Database Connection ###

In order to use a database in CORaL, a connection must be made at the top of the program. The following is the grammar that specifies how to create a connection.

#### Connection Attributes ####

The attributes of a connection specify the connection details in order to connect to the specified database at the desired server. These attributes are necessary for a program to function correctly, as without it the program will not be aware of what database to access. 

#### Section ####

In order to define the section where the database connection details will be specified the following identifiers `#cordbconn`, `#enddbconn` will be used.  
The `#cordbconn` marks the beginning of the section and `#enddbconn` marks the end of the section where database connection details are specified.

### Database Schema ###

Throughout the discussion of our database schema, it is beneficial to the reader to have a basic understanding of SQL and ER Diagram vocabulary.

#### Table Attributes ####

The attributes of the table are equivalent to the columns of a table in a relational database. The attributes specify the type of the columns as well as their names. Apart from defining the columns of a table, one must specify the constraints on the table. This can be easily done using `primary key()` and `foreign key()`.

#### Table Body ####

The body of the table consists of the collection of attributes, along with their primary and foreign key declarations.

#### Section ####

In order to define the section where the database schema details will be specified the following preprocessor identifiers `#cordb` and `#enddb` are used.  
The `#cordb` marks the beginning of the section and `#enddb` marks the end of the section where database schema detailers are specified.

### Global Declarations ###

The global declarations are the top level of the grammar, and consist of global variables and functions. These are visible to all parts of the CORaL program.

#### Global Variables ####

Global variables can be declared after the database blocks, but before the function definitions. They are declared with the following syntax:

	global int myGlobalInt;

They can also be initialized during declaration, as follows:

	global int myString = "Hello";

Now, the variables `myGlobalInt` and `myString` can be accessed from within any function body in the rest of the program.

#### Function Definitions ####

A CORaL function definition will have the following structure

	[dtype] [identifier] ( [formals_opt] ) { [statement-list] }

The `dtype` specifies the return type of the function. Functions may return a value of type `int`, `float`, `string`, `Table`, or `user_t`. If a function is declared with a return type of `void`, it cannot return a value.

The formals_opt is a list of formal parameters for the function. A formal parameter is declared with: `dtype ID`, where the `dtype` is a type and `ID` is the name of the parameter. The parameter list is to be left empty if a function receives no formal parameters.

The body of a function is a list of statements, and must be written within brackets `{ }`.

#### Scope ####

Scope is defined as the region of the program text within which the identifier's characteristics are understood. In CORaL, scopes are determined at compile time. The same identifier may be used for different purposes as long as their uses fall into different namespaces. 

* The scope of a table is the entire program.
* The scope of a global variable is the entire program.
* The scope of a function is the entire program.
* The scope of an instance variable is the body of the function it is declared within.
* The scope of a formal parameter is the body of the function to which it belongs.

Functions have global scope, but they must be declared above the point at which they are called, and cannot be called recursively.

### Grammar ###

The grammar of our language is specified below. Syntax for understanding the description of the grammar can be found in the syntax section. 

	program			->	conn_block table_block global_decl_list fdef_list
	
	fdef_list		->	
					|	fdef_list fdef  
				
	fdef			->	dtype ID LPAREN formals_opt RPAREN LBRACKET var_decl_list stmt_list RBRACKET

	stmt_list		->  
					|	stmt_list  stmt

	stmt			->	expr SEMI
					|	error
					|	CONNECTDB SEMI
					|	CLOSEDB SEMI
					|	LBRACKET stmt_list RBRACKET
					|	RETURN expr SEMI
					|	IF LPAREN expr RPAREN stmt NOELSE
					|	IF LPAREN expr RPAREN stmt ELSE stmt
					|	WHILE LPAREN expr RPAREN stmt
					|	FOR LPAREN expr_opt SEMI expr_opt SEMI expr_opt RPAREN stmt

	expr			->	INTLITERAL
					|	STRINGLITERAL
					|	FPLITERAL
					|	ID ASSIGN expr
					|	ID PLEG expr
					|	ID MIEQ expr
					|	ID MUEQ expr
					|	ID DVEQ expr
					|	expr PLUS expr
					|	expr MINUS expr
					|	expr TIMES expr
					|	expr DIVIDE expr
					|	expr MOD expr
					|	expr EXP expr
					|	expr EQ expr
					|	expr NEQ expr
					|	expr LT expr
					|	expr LEQ expr
					|	expr GT expr
					|	expr GEQ expr
					|	expr OR expr
					|	expr AND expr
					|	ID
					|	NOT expr
					|	ID INCR
					|	ID DECR
					|	MINUS expr
					|	PLUS expr
					|	SIZEOF LPAREN expr RPAREN
					|	PRINT LPAREN actuals_opt RPAREN
					|	FPRINT LPAREN ID COMMA actuals_opt RPAREN
					|	FREAD LPAREN ID RPAREN
					|	CLOSE LPAREN ID RPAREN
					|	OPEN LPAREN STRINGLITERAL COMMA STRINGLITERAL RPAREN
					|	ID LPAREN actuals_opt RPAREN
					|	ID LSQUARE expr RSQUARE
					|	ID DOT ADD LPAREN RPAREN
					|	ID DOT GET LPAREN actuals_opt RPAREN
					|	ID DOT ID LPAREN actuals_opt RPAREN
					|	ID DOT ID
					|	LPAREN expr RPAREN

	expr_opt		->  
					|	expr

	formals_opt		->	
					|	formal_list

	formal_list		->	formal
					|	formal_list COMMA formal

	formal			-> dtype ID

	actuals_opt		->	
					|	actuals_list  

	actuals_list	->	expr  
					|	actuals_list COMMA expr

	global_decl_list->	global_decl_list global_decl

	global_decl		->	GLOBAL type ID ASSIGN expr SEMI
					|	GLOBAL type ID SEMI

	var_decl_list	->	  
					|	var_decl_list var_decl

	var_decl		->	
					|	dtype ID ASSIGN expr SEMI
					|	dtype ID ID SEMI
					|	dtype ID ASSIGn expr SEMI
					|	dtype ID ID SEMI

	dtype			->		
					|	VOID
					|	INT
					|	STRING
					|	TABLE
					|	FLOAT
					|	FILE
					|	USERTYPE

	conn_label		->	SERVER
					|	PORT
					|	USER
					|	PASS
					|	TYPE
					|	DBNAME

	conn_attribute	->	conn_label ASSIGN STRINGLITERAL SEMI

	conn_block		->	  
					|	CORDBCONN
						conn_attribute conn_attribute
						conn_attribute conn_attribute
						conn_attribute conn_attribute
						ENDDBCONN

	attribute_label	->	ID

	attribute		->	attribute_label COLON dtype SEMI

	attribue_group	->	attribute
					|	attribute_group attribute

	key_decls_list	->
					|   key_decls	  
					|	key_decls_list key_decls

	key_decls		->	PRIMARYKEY LPAREN attribute_label RPAREN SEMI

	table_label		->	ID

	table_body		->	attribute_group key_decls_list fdef_list

	table			->	TABLE table_label LBRACKET table_body RBRACKET SEMI

	tables_list		->	  
					|	tables_list table

	table_block		->	  
					|	CORDB tables_list ENDDB

## Project Plan [plan] ##

### Development Process ###

Our development was very much team-focused. While we did assign different components and sub-components to individual team members, we chose to do most of our development in a group setting so that we were more easily able to ask one another how the parts fit together and ensure compatibility across the components. In addition, this was greatly beneficial for debugging the compiler source code, because we chose to develop in OCaml, which is a language none of us had used before. Due to the fact that we were often in the same room together while working, we were able to quickly help each other with OCaml syntax, style, and errors.

However, this approach became difficult as the end of the semester neared, because all of our team members became extremely busy, so it was hard to coordinate meetings where all of us could join. The approach we took was essentially a week-long hackathon: everyone finished up most of their other responsibilities by the last day of classes so that we could spend the next week coding our compiler. At this point, we had implemented the basic shell of it, which included a near-complete lexer, about a third of our grammar, and a basic code generator. Still, the bulk of the work remained, which did cause a rather unpleasantly large amount of work to need to be completed in a small timeframe. This time pressure acted as a great source of motivation, though, and we managed to cultivate a very focused and energized experience during our development sessions, and ended up getting plenty of sleep throughout the week while still completing our compiler on time.

### Roles and Responsibilities ###

The assigned team member roles were as follows:

* **Brian:** Team Manager
* **Molly:** Language Guru
* **Luis:** System Architect
* **Miguel:** System Integrator
* **Shane:** System Tester

In the initial stages, Miguel and Luis assembled a functioning shell of our compiler after learning how the layout should be and how the various parts worked together. Luis coded the scanner, while Miguel coded small parts of the syntax analyzer and code generator. Molly was in charge of the grammar, and added the rest of that into the syntax analyzer. I assisted with the code generator and syntax analyzer before tackling the semantic analyzer. Meanwhile, Shane wrote various tests and a script to run suites of tests on the different parts of our language. All members also wrote several small test cases on their own.

Due to the fact that we did most of our development together, the roles and responsibilities were more fluid than they would have been had we developed in more isolated conditions. Team members would often assist other team members with their modules, and everyone ended up contributing to nearly all of the modules. In all, the work ended up being pretty evenly distributed.

### Implementation Style Sheet ###

The stylesheet we used during development, which has been included in our souce code, is reproduced here:

	# Team CORaL OCaml Style Sheet #

	# Pushing to git #
	
	** Do not break the git repo **
	The first rule about contributing to the git repo is that you do not break the git repo. All code must compile, and any prior functionality that was modified must be tested again before the changes can be committed.

	** Avoid merging when possible **
	Always pull before you commit. If there are conflicts, resolve them quickly and push your code. If you are going to work on a different branch, alert the other team members before you do.

	# Comments #

	** Place comments above the line that they refer to **

	(* sum a list of integers *)
	let sum = List.fold_left (+) 0

	** In matching cases, they may be placed to the left of the case **

	Match a with
	| SomeCase(x, y) -> (check_something x) (* checks in this case *)
	| OtherCase(x) -> (check_something_else x) (* checks another case *)

	** Avoid useless comments **
	Don't comment something unless it is performing a function that is not 
	immediately apparent. Do more than simply stating the obvious.

	# Naming conventions #

	** Function and variable names **

	Use lower case for the first character in a variable name. If a name is 
	composed of multiple words, use underscores, not camelcase.

	i.e. str_of_program

	** Use meaningful names **

	Longer names that make the value's meaning readily apparent are 
	preferable to shorter names. 

	# Indenting #

	** Long expressions **

	Break them up using newlines and indents to keep them around 80 
	characters, in the following manner

	let x = "long line " ^
			"is very long"

	** Matching expressions **

	Should be indented with a new case on each line, as follows

	match an_expr with
	| Case(y) -> ...
	| DifferentCase(m) -> ...

	# Pattern matching #

	** Do not leave any unmatched cases **

	The Ocaml compiler will warn you, so once it does, go back and 
	add them in. If you don't know what to do, flag it with a TODO comment.


	* Style guide adapted from *
	[Cornell OCaml Style Guide](http://www.cs.cornell.edu/courses/cs3110/2008fa/handouts/style.htm)

### Project Timeline ###

As explained above, the development of our compiler was heavily weighted toward the end of the semester. To wit, we include the graph of the team's commits to our git repo, as well as a chart of code additions versus deletions, below. ![commits][] ![add_del][]

[commits]: commits.png

[add_del]: add_del.png

Finally, to back up my earlier claim that our team got plenty of sleep during our week-long development coral-athon, below is the "git punchcard," which displays at which points during the day, and which days out of the week, our commits were made. As you can see, there are no commits made between the hours of 4am and 10am, which we consider to be a grand achievement. ![punch][]

[punch]: punch_card.png

### Project Log ###

February 12: We meet to discuss potential language ideas. A few are more "pet" languages, while the two we like the most are one that helps the user manipulate databases but looks like C, and an "easier vhdl" that makes writing hardware less miserable.

February 15: We meet with Jared during his office hours, and he tells us that the C-like language that manipulates databases sounds like the coolest idea. We decide to run with that one.

February 20: We meet to divide up the work for our white paper. We name our language CORaL (C-like Object-Relational Language), and come up with buzzwords.

March 3: We meet and begin discussing how to implement our language. Some work is preliminarily divided up. Miguel and Luis are to begin outlining the compiler architecture, and Brian is going to work on the language tutorial.

March 25: Now that the midterm and spring break are over, we start to focus more on our language. We meet to finish up the tutorial and write the language reference manual together.

April 10: Miguel and Luis have the basic architecture working. Our compiler can compile and run a "Hello world" test program, but not do much else.

April 20: Part of the grammar has been implemented by Molly, and Brian and Miguel have added the corresponding parts to the generator. Shane has started working on test programs.

May 1: We meet, but are focused now on the PLT final exam first.

May 6: The week-long CORal-athon begins! (and extends to May 12)

## Language Evolution [evol] ##

CORaL started out with the overall goal in mind of making it easy for low-level programmers to integrate databases into their projects. As a team consisting of mostly Computer Engineers, on the whole we are far more familiar with low-level languages like C than higher-level scripting languages that perhaps have more support for SQL integration. But more importantly, CORaL aims to make writing SQL directly inside your own code seamless and easy, a feature that seems lacking in this scope. As such, the market for CORaL is programmers who are very familiar with C, and have had little to no experience working with SQL schemas or any kind of external database. During the development of CORaL, this high-level goal kept consistent throughout. When deciding whether or not to make a change to our original grammar, it was necessary to first ask the question "Would this be intuitive to a C programmer?" Maintaining the "C-like" component of our language was of high importance to us throughout the process.

CORaL evolved significantly from that which we had originally proposed at the beginning of the semester. A lot of these changes also involved scaling back on components that we quickly realized were either unrealistic, or unnecessary for us to stay in like with our overall goals Much of our original grammar was based on the C grammar from the K&R reference manual. When starting actually implement the grammar, we found that much of our grammar could be simplified and many constructs or principles we used to ensure our grammar was unambiguous were not necessary with the compiler tools that we decided to use. 

Because of the dramatic differences that we began to notice at the beginning of implementation, when writing our grammar into our parser.mly file, we essentially began writing the grammar from scratch, rather than basing it off of the grammar in our original LRM. As such, it was crucial for every team member involved in writing the grammar to both understand the overall structure and goal of the grammar, and discuss with the team when making any radical changes. 

In order to get a full working compiler, we needed to scale back on a few components that we had originally promised. We completely eliminated the idea of having functions within our Tables, as well as inheritance on Tables. Of all the changes that we made, these two stand out as the most drastic changes that we made to our original design decisions. However, after lengthy implementation discussions we decided that the time it would have taken us to implement these features could have been better spent perfecting the more crucial aspects of CORaL. These features were not entirely eliminated from our grammar, but we did not have time to perform any of our semantic checks on said elements, including type-checking and checking against and adding to the Table symbol table. As a general rule, any features that we ended up deciding not the fully implement remained in our grammar and now just throw semantic errors.  

Of all compiler tools, that which is most important is the language your compiler is written in. For this, our team chose OCaml, a language which all members of the team were unfamiliar with, but which was recommended to us for it's ease-of-use and minimal code required when writing compilers. Of course, the other required compiler tools were just lex and yacc, to be used for lexing and parsing our source program. Lex was utilized in the scanner.mll file, and yacc was utilized in the parser.mly file; both can be viewed our source code, in the appendix of this document. OCaml has lex and yacc built in (OCamllex, OCamlyacc), so there was no integration required. 

The only unusual library that was required by our compiler was SQLAlchemy. Because CORaL is compiled into Python, we were able to use SQLAlchemy to do most of the heavy lifting on the backend. SQLAlchemy is a database toolkit and object-relational mapper for python. The CORaL compiler utilizes this when performing all of it's signature built-in functions that perform queries, inserts, or operations on Table objects within your database.  

Throughout the development process, it was relatively easy to maintain consistency between the language reference manual (LRM) and the compiler. Aside from the grammar, the content of the LRM was robust when originally written, and thus all development was based off of this content. Rather than requiring steps to keep them consistent, the compiler was based off of the LRM, so there was little to no need for consistency checks.

## Translator Architecture [arch] ##

### Overview ###

The CORaL translator takes a CORaL program (.cl) as an input and outputs a Python executable (clx). Our only intermediate representation is the AST. Our translator has a front-end and a back-end. The front-end is made up of the lexer and the parser, and it outputs the AST. The backend, composed by the semantic analyzer and code generator, takes the AST, checks it semantically and outputs the Python executable.  The coral.ml file orchestrates the whole translation process. 

![Translator Block Diagram][]  

[Translator Block Diagram]: ./architecture.png

### Front-End ###

#### Lexer (scanner.mll) ####

The lexer, an ocamllex program, is used to break down the source CORaL file into tokens or lexemes. This process removes the comments and whitespace from the program. The lexer also reports a failure for any illegal characters. The list of different tokens the lexer recognizes is in the Appendix.

#### Parser (parser.mly) ####

The parser, an ocamlyacc program, receives the token stream from the lexer and builds an AST using the CORaL grammar. The parser contains the official CORaL grammar. 

### Back-End ###

#### Semantic Analyzer (semantic.ml) ####

The semantic analyzer, an OCaml program, takes the AST from the front-end and traverses it doing various types of checks:  

* Checks if a function exists when it is called  
* Checks if a variable has been declared when it is used  
* Checks if the variable types match when a variable is operated on or assigned  
* Checks if the function has or needs a return value and checks its type  
* Checks if the actual arguments match the formal arguments of a function  
* Checks the database connection parameters  
* Checks the table types and functions  

#### Code Generator (generator.ml) ####

The code generator, an OCaml program, takes the AST, after is has been checked by the semantic analyzer, and translates it into a Python program with the database connections. This Python program can be executed from the command line as is. 

## Development and Run-Time Environment [dev] ##

We had the following programming and development environment:

* Languages: OCaml, OCamlyacc, OCamllex, Python
* Development: Sublime Text 2, GitHub, Google Drive, GNU Make

CORaL can be compiled and installed using a series of Makefile commands. The installer and the locations used follow the Unix conventions. The appropriate permissions are needed to install certain components of CORaL.

Here are the following commands which can be run from the top-level directory of the CORaL directory.

* `make all` : Compiles the source.
* `make install` : Compiles the source, installs dependencies and installs coralc into `/usr/local/bin`.
* `make backend` : Installs Python backend and dependencies.
* `make test` : Runs the test suite.
* `make backend_clean`: Cleans the backend install.
* `make clean` : Cleans all directories.

Top-level Makefile:

	SUBDIRS = src
	PYTHONBUILD = build dist
	all:
		@for i in $(SUBDIRS); do \
		echo "make all in $$i..."; \
		(cd $$i; $(MAKE) $(MFLAGS) all); done

	install: backend_clean backend clean
		@for i in $(SUBDIRS); do \
		echo "make all in $$i..."; \
		(cd $$i; $(MAKE) $(MFLAGS) install); done

	backend:
		echo "making Backend"
		cd dependencies; tar xvzf *; cd SQLAlchemy-0.8.1; python setup.py install
		python setup.py install

	backend_clean:
		rm -rf $(PYTHONBUILD)
		rm -rf /dependencies/SQLAlchemy-0.8.1

	test: test/test.py
		python test/test.py

	clean: backend_clean
		@for i in $(SUBDIRS); do \
		echo "Clearing in $$i..."; \
		(cd $$i; $(MAKE) $(MFLAGS) clean); done

CORaL Makefile:

	LEX = ocamllex
	YACC = ocamlyacc
	OCAML = ocamlc

	OBJS = parser.cmo scanner.cmo ast.cmo semantic.cmo generator.cmo coral.cmo

	OUTPUTS = *.cmo *.cmi *.mli *~ scanner.ml parser.ml parser.output
	BINDIR = ./build

	install: all
		cp coralc /usr/local/bin

	all: coralc
		chmod a+x coralc

	coralc : $(OBJS)
		$(OCAML) -o coralc $(OBJS)
		chmod +x coralc

	parser.ml parser.mli : parser.mly
		$(YACC) -v parser.mly

	scanner.ml : scanner.mll
		$(LEX) scanner.mll

	%.cmo : %.ml
		$(OCAML) -c $<

	%.cmi : %.mli
		$(OCAML) -c $<

	.PHONY : clean
	clean:
		rm -rf $(OUTPUTS)
		rm -rf $(BINDIR)
		rm -rf coralc


	ast.cmo:
	ast.cmx:
	generator.cmo: ast.cmo
	generator.cmx: ast.cmx
	coral.cmo: semantic.cmo scanner.cmo parser.cmi generator.cmo ast.cmo
	coral.cmx: semantic.cmx scanner.cmx parser.cmx generator.cmx ast.cmx
	parser.cmo: ast.cmo parser.cmi
	parser.cmx: ast.cmx parser.cmi
	scanner.cmo: parser.cmi
	scanner.cmx: parser.cmx
	parser.cmi: ast.cmo


CORaL Backend setup.py:

	from distutils.core import setup
	setup(name='CORaL Backend',
			version='1.0',
			description='CORaL Backend Utilities',
			packages=['coral_backend'],

			)
## Test Plan [test] ##

For testing, we used a combination of different methods. We had a main testing python script, and a test subdirectory which included a variety of tests for different functionality.
You can run either one test, or them all, allowing you to do easy regression testing.

Compliance Tests:
Which we used with Hello World once the basic features of our compiler were written.

Production Tests:
We did production tests (tests covering performance and quality control) manually via checking the system logs. If we found any tests, or group of tests were taking an inordinate amount of time, we would dig deeper to try and drill down the issue. Pushes of non-working code were not accepted.

Acceptance Tests:
Upon install, tests are performed to ensure the product behaves as expected.

Regression Tests:
Our main testing methodology went through the test files, which gave an indication for all the behaviour that was and was not supported. We included tests with a multitude of language features, as well as tests which are geared toward a singular purpose.

We have two stages of tests, one for file compilation, and another for runtime errors. These correspond to output files `filename.err` and `filename.out`.

An Example Test:

	#cordbconn
	server="";
	user="";
	password="memory";
	port="";
	DBName="";
	type="sqlite";
	#enddbconn

	#cordb
	#enddb

	void main() {	

		int i = 0;
	
		printf(i);
	
		/* this is a comment */
		printf(i);

		/* this is a multi line
		comment */

		// single line comment


		printf(i);
	}

Running this test program should output the following:

	000

A more complicated test is shown here:
	
	#cordbconn
	server="";
	user="";
	password="";
	port="";
	DBName="";
	type="sqlite";
	#enddbconn

	#cordb
	Table Person {
		firstName : string;
		lastName : string;
		age : int;
		primary_key(firstName);	
	};
	#enddb

	int main() {
		File fp;
		int i;
		int size;
		user_t Person u;
		user_t Person result;
		
		user_t Person molly = Person(firstName="molly", age=22);
		user_t Person miguel = Person(firstName="miguel", age=22);
		user_t Person shane = Person(firstName="shane", age=22);
		user_t Person brian = Person(firstName="brian", age=21);
	
		molly.add();
		miguel.add();
		shane.add();
		brian.add();

		connectDB;
 
		fp = fopen("output.txt", "w");
		fprintf(fp, "People over the age of 21\n");
		result = Person.get(age>21);
		size = sizeof(result);

		for(i=0; i < size; i++) {
			u = result[i];
			fprintf(fp, u.firstName + "\n");

		}
		fclose(fp);
		closeDB;
		return 0;
	}


The expected output is to be added to the file `output.txt` as specified in the fopen. However, with our current test suite, we could not test writing to files so we did a manual testing of all tests that included file manipulation. This test is still present in the test suite, but just prints to STDOUT in order to more properly test the database functionality. Below is the expected output (or what would be in `output.txt`) after the above program is run:

	molly
	miguel
	shane


## Conclusions [conc] ##

###CORaL Team Lessons###

* ***Work Together, Together*** :
	We chose to do a lot of the actual development work on our compiler with the whole team in the same room working together, and we found that this was an amazingly effective strategy. It lead to more communication, faster debugging, and overall a more solid integration of the components. It also increased accountability—everyone feels pressured to contribute when they're seated next to the people that they're supposed to be helping. We managed to be extremely efficient while not getting overly distracted, and are pleased with this strategy.

* ***Ask the Internet, But Don't Forget Your Team*** :
	We were implementing our compiler in OCaml, which is a language that was new to all of us. In addition, none of us had programmed in a functional language before. Thus, not only were we confronted by the task of writing a compiler, but the actual implementation was somewhat foreign to us. Thus, we ran into all sorts of OCaml syntax errors. However, we quickly learned that a lot of our problems were tricky, and that Stack Overflow wasn't too helpful with OCaml syntax errors. Our best resources therefore became each other, and it was often much quicker to have a teammate help you debug than to search aimlessly on the internet for the solution to your syntax error. Turns out Columbia students are pretty bright.

* ***Functional Languages Are Powerful Tools*** :
	Originally, we mostly decided to implement our compiler in OCaml just for the heck of it. We had heard from peers who took PLT with Prof. Edwards (and who had therefore used OCaml) that OCaml is great for compilers, and that could not have been more true. It took some getting used to the way of thinking about programming in a functional mindset, but we quickly learned just how powerful OCaml is. It allows us to write compicated recursive functions quickly and efficiently, and it amazed us how much we could do with so few lines of code. Not only this, but once you can get OCaml to compile, it generally works, which meant that we didn't need to do much debugging beyond sytax errors. We all think using OCaml was a great decision, and we recommend it to future teams wholeheartedly.

###Individual Lessons###

* ***Shane Chin*** :
	This project has taught me the importance of regression testing in software development; I had heard of the practice bieng used but rarely really understood the merit without the help of an incredibly difficult and large program. I learned the merit to reducing the scope of your project in areas in which it is too ambitious. 

	I learned the joys of working with a highly productive, punctual team, which was really willing to put in the work required. I look forward to trying to create my next language!

* ***Molly Karcher*** : 
	Throughout the duration of this project I learned first and foremost, the importance of flexibility in design. Our original design plan (at least as far as the grammar was concerned) ended up being pretty drastically different than originally planned, and the whole team had to be open to and understanding of a dynamically changing product. 

	Similarly, you learn the importance of maintaining good off-line documentation, or at the very least having at least one person in the group per moving part, that knows that part through and through. Keeping everyone in the group updated as to progress and where we were in development was a key challenge for us, and pretty much mandated that we develop while physically sitting next to each other. Though I definitely learned this through every other large-scale programming project I've been a part of, this project confirmed that above all, proximity to your fellow programmers is key. Remotely working, or working independently will slow down the development process with unnecessary confusion.

* ***Luis E. Pena*** :
	Before this project I had only worked in smaller groups. This project taught me that it is a lot harder than I previously thought to work in larger groups. It is more difficult to divide up the work and synchronize with each of the teammates. The upside of having more teammates is that the group is more resilient, and it does not lose inertia when teammates are not able to attend a coding meeting.  

	Working with OCaml was confusing at first, but we kept it and it was totally worth it. Adding features using OCaml was simple and quick. Our source code is short and elegant. I want to try using a functional programming language in future projects because functional languages require a completely different way of thinking.

* ***Miguel A. Yanez*** :
	This project has been one of the most challenging yet rewarding experiences during my time here at Columbia. Building a programming language that is elegant, and simple, yet functional is a very interesting problem. Through designing and implementing CORaL I have learned and grown to appreciate the details and complexity that bright minds like those of Brian Kerninghan and Dennis Ritchie faced when developing C.

	My role as integrator led me to be familiar with every working component of CORaL as I was responsible for making sure that the language as a whole held together. Using Git to manage everyones changes proved very helpful. We also used GitHub's issue tracking system, so that there was a central place where all the issues were kept. 

	Time management also proved to be quite effective as our meetings were always efficient and effective. Everyone's opinions were voiced and we handled disagreements in a respectful manner. Our iterative development style also proved quite useful for this in that if there were any changes to be made, it was easy to do so. 

	Overall this has been a great experience, and I look forward to implementing another programming language as a personal project.

* ***Brian Wagner*** :
	I would say that this project has been my favorite large-scale programming project while at Columbia. It was definitely the most rewarding, and I learned an extraordinary amount at the same time. Being able to define our own language from the ground-up, and then see that through to the implementation of its compiler provided a great sense of ownership over the project, and it's incredible to be able to point to a working programming language and know that it is partly "mine."

	Seeing how a compiler works, and how all the different components interact in order to translate a language, was a fascinating experience, and I think we made a good decision in choosing to implement the language in OCaml. This way, not only did we learn how a compiler works, we also learned how to program in a functional language, something that none of us had done before. I greatly enjoyed the challenge provided by learning a new language as you develop, and I have come away from this project with a strong interest in functional languages. I will definitely use OCaml again in the future.

	I also learned a lot about working on a team to develop software. I had never worked on a team of this size during a programming project before, so this was a new experience, especially since I served as the team leader. Our team decided to do most of our development in a group setting, and I learned that that is a powerful way to ensure that everyone is committed and doing his or her part. The environment created by having a full team in the same area working together allows for open communication, collaboration, and support, and is a great way to make progress, assuming distractions can be limited. Overall, we did a great job at this.

	Creating CORaL taught me a lot about functional languages and software development, and it also provided a new way of looking at existing programming languages. For example, partway through our project, we were trying to implement user-defined types, and realized that it was analogous to the way the C language uses structs, so we provided our own keyword, user_t, to serve as a sort of "struct" for CORaL.

	All in all, this project was difficult, but the rewards and amount learned were certainly worth it. I think I may even try to create some smaller esoteric languages in the future on my own time.

###Advice for Future Teams###

* ***Be Ambitious, But Not Too Ambitious*** :
	While we were coming up with the ideas for what we would like our language to do, we wanted to implement tons of fancy built-in features that would make programming simpler for the programmer, but much more difficult for ourselves. In the end, we had to scale back some of the features that were simply too unreasonably difficult for the scope of this project. (We're leaving them as TODO's on our git repo though :) ) It is important that your final language stays true to the goal it is aiming for, but avoid adding features that aren't needed and will eat up too much dev time.

* ***Use Meeting Time Efficiently*** :
	Only schedule team meetings when you have to have them, and make sure that you have a clear idea of what needs to get done before you leave the meeting. It's okay if the purpose of a meeting is only to update the members on the state of the project, but don't fill meetings with useless banter or unproductive discussions.

* ***Map out Your Development Plan*** :
	We did our fair share of procrastinating, but we were really only able to get away with it because we had all discussed beforehand our plan of setting aside a specific week for development. It is beyond crucial that you plan out a schedule of deliverables and deadlines for features and components. It's okay to spend some time at the end doing panicked debugging, but this will only work if the features have already been implemented, or you will inevitably introduce more bugs implementing the rest of the features.

* ***Make It Enjoyable*** :
	Cliche/stupid as it sounds, it's still important, and it is in fact possible. We did our best to create an environment conducive to teamwork during our dev-athon. Having a nice, open space with plenty of light and taking regular breaks to get food and fresh air was critical to the preservation of our collective sanity. We also made sure that we were all focused, but that the atmosphere was still light enough to make it kind of fun.

* ***Use OCaml (If you want)*** :
	Like we said above, we went with OCaml as our development language, even though none of us had used it (or any other functional language before) before. This turned out to be a great decision, and added to the amount we learned during the project. It will blow your minds how powerful OCaml is, and how much it can do in five lines when it would have taken you 50 in C. OCaml is also great because often if it compiles, it works. It does exactly what you think it will, assuming you unerstand it.

###Suggestions to Instructors###

* ***Theory vs Implementation*** :
	The lecture focuses heavily on theory, rather than implementation. It would be better to have a clearer connection between the two. When it came to being prepared for the final, the lectures definitely prepared us. But when it came to actually writing the compiler, we felt completely lost as to how to begin and ended up learning a lot of the implementation details from looking at Professor Edwards COMS W4115 slides from last semester. Solely based on lectures and homework assignments, we were ill-prepared to begin writing the compiler.

* ***Course Content*** :
	Lambda Calculus - We would like to see much more on usage, implementation, and interpretation of lambda calculus in the course, as well as its applications to functional programming. We felt lambda calculus was a bit brushed over, and we did not get a full understanding 

	Code optimization - This topic was covered rather heavily in lectures, and we believe that a lot of this content was superfluous, mostly because we did not need to do any code optimization when implementing our own compiler. Since we were just translating into a different language in our implementation, all of the code optimization steps that we had learned about in lectures were completely useless in this regard. Perhaps this topic could be shortened a little. 

* ***Project Check-ins*** :
	This suggestion is mostly just a way for the instructors to have more control over whether or not the students procrastinate their work or not. Our team still ended up procrastinating writing the entire compiler until a couple weeks before it was due. It would be at least a little motivating to do it earlier, if we were required to give deliverables to our assigned TA at different check-points throughout the semester. These could be instructor-defined, or you could allow teams to define their own deliverables, or milestones.  

## Appendix [appendix] ##

`scanner.mll`

	{
		open Parser

		let incrLineNum lexbuf =
			let pos = lexbuf.Lexing.lex_curr_p in
				lexbuf.Lexing.lex_curr_p <- { pos with
					Lexing.pos_lnum =
						pos.Lexing.pos_lnum + 1;

					Lexing.pos_bol =
						pos.Lexing.pos_cnum;
				}


	}


	let letter = ['a' - 'z' 'A' - 'Z' ' ' '0' - '9']
	let digit = ['0' - '9']
	let symbol = "\\n" | "\\t" | '.' | '*' | "\\" | '?' | '`' | '!' | '@' | '#' | '$' | '%' | '^' | '&' | '*' | '(' | ')' | '-' | '+' | '=' | '{' | '}' | '[' | ']' | '|' | ';' | '>' | '<' | ','
	let whitespace = [' ' '\t']



	rule token = parse
		 whitespace+				{ token lexbuf }
		| ['\n' '\r']				{ incrLineNum lexbuf; token lexbuf }
		| "/*"						{ comment lexbuf }
		| "//"						{ singleComment lexbuf }

		|	'+'						{ PLUS }
		|	'-'						{ MINUS }
		|	'*'						{ TIMES }
		|	'%'						{ MOD }
		|	'/'						{ DIVIDE }

		|	'('						{ LPAREN }
		|	')'						{ RPAREN }
		|	';'						{ SEMI }
		|	':'						{ COLON }
		|	'='						{ ASSIGN }
		|	'['						{ LSQUARE }
		|	']'						{ RSQUARE }
		|	'{'						{ LBRACKET }
		|	'}'						{ RBRACKET }
		|	'^'						{ CARAT }
		|	'.'						{ DOT }
		|	','						{ COMMA }

		|	'!'						{ NOT }
		|	'>'						{ GT }
		|	'<'						{ LT }
		|	">="					{ GEQ }
		|	"<="					{ LEQ }
		|	"!="					{ NEQ }
		|	"||"					{ OR }
		|	"&&"					{ AND }
		|	"=="					{ EQ }

		|	"**"					{ EXP }
		|	"++"					{ INCR }
		|	"--"					{ DECR }
		|	"+="					{ PLEQ }
		|	"-="					{ MIEQ }
		|	"*="					{ MUEQ }
		|	"/="					{ DVEQ }

		|	"else"					{ ELSE }
		|	"while"					{ WHILE }
		|	"int"					{ INT }
		|	"if"					{ IF }
		|	"for"					{ FOR }
		|	"return"				{ RETURN }
		|	"printf"				{ PRINT }
		|	"fprintf"				{ FPRINT }
		|	"void"					{ VOID }
		| 	"global"				{ GLOBAL }

		|	"Table"					{ TABLE }
		|	"#cordb"				{ CORDB }
		|	"#enddb"				{ ENDDB }
		|	"server"				{ SERVER }
		|	"port"					{ PORT }
		| 	"user"					{ USER }
		| 	"user_t"				{ USERTYPE }
		|	"password"				{ PASS }
		| 	"type"					{ TYPE }
		| 	"DBName"				{ DBNAME }
		|	"#cordbconn"			{ CORDBCONN }
		|	"#enddbconn"			{ ENDDBCONN }
		|	"primary_key"			{ PRIMARYKEY }
		| 	"foreign_key"			{ FOREIGNKEY }
		|	"string"				{ STRING }
		|	"float"					{ FLOAT }
		|	"add"					{ ADD }
		|	"get"					{ GET }
		| 	"connectDB"				{ CONNECTDB }
		|	"closeDB"				{ CLOSEDB }
		|	"fopen"					{ OPEN }
		|	"fclose"				{ CLOSE }
		|	"freadline"				{ FREAD }
		|	"File"					{ FILE }
		|	"sizeof"				{ SIZEOF }

		|	eof						{ EOF }
		| digit+ as lxm { INTLITERAL(int_of_string lxm) } (* integers *)
		| "\""(letter | digit | symbol)* "\"" as lxm { STRINGLITERAL(lxm) }
		| ['0'-'9']+'.'['0'-'9']* as lxm { FPLITERAL(float_of_string lxm) }
		| ['a'-'z' '_' 'A'-'Z']['a'-'z' 'A'-'Z' '_' '0'-'9']* as lxm { ID(lxm) }
		| _  as char				{
										let pos = lexbuf.Lexing.lex_curr_p in
										raise (Failure("Illegal character: "^ Char.escaped char ^ " in line #" ^ (string_of_int pos.Lexing.pos_lnum))) }

	and comment = parse
			"*/" { token lexbuf }
			| "\n" { incrLineNum lexbuf; comment lexbuf }
			| _	 { comment lexbuf }

	and singleComment = parse
			"\n" { incrLineNum lexbuf; token lexbuf }
			| _ { singleComment lexbuf }





`parser.mly`

	%{ open Ast
	    open Lexing
	    exception Error of string
	    let parse_error msg =
	        let start_pos = Parsing.rhs_start_pos 1 in
	            let lineNo = start_pos.pos_lnum in
	                try
	                raise(Error(""))
	                with _ ->
	                    print_endline ("There is a " ^ msg ^ " near line #" ^ string_of_int lineNo); exit 2


	%}

	%token PLUS MINUS TIMES MOD DIVIDE LPAREN RPAREN SEMI COLON ASSIGN
	%token LBRACKET RBRACKET CARAT DOT COMMA GT LT GEQ LEQ NEQ OR AND NOT
	%token EXP INCR DECR PLEQ MIEQ MUEQ DVEQ
	%token EQ WHILE INT FOR RETURN PRINT VOID BREAK CONTINUE
	%token IF ELSE
	%token STRING GLOBAL
	%token FPRINT FREAD USERTYPE SIZEOF
	%token FLOAT ADD GET CONNECTDB LSQUARE RSQUARE CLOSEDB OPEN CLOSE FILE
	%token <int> INTLITERAL
	%token <string> STRINGLITERAL
	%token <float> FPLITERAL
	%token <string> ID
	%token EOF ERR

	/*CORaL*/
	%token CORDB, ENDDB, TABLE, SERVER, PORT, USER, PASS, TYPE, DBNAME
	%token CORDBCONN, ENDDBCONN, FOREIGNKEY, PRIMARYKEY

	%nonassoc NOELSE
	%nonassoc ELSE
	%right ASSIGN
	%left PLEQ MIEQ MUEQ DVEQ
	%right EQUAL NOT
	%left DOT
	%left EQ NEQ LT GT LEQ GEQ
	%left PLUS MINUS DECR INCR
	%left TIMES DIVIDE MOD EXP
	%left AND OR

	%start	program
	%type <Ast.program> program

	%%

	program:
		conn_block table_block global_decl_list fdef_list 	{ {
								conn = $1;
	                            tables = $2;
	                            globals = List.rev $3;
								funcs = List.rev $4
			} }

	fdef_list:
						 { [] }
		| fdef_list fdef { $2 :: $1 }


	fdef:
		dtype ID LPAREN formals_opt RPAREN LBRACKET var_decl_list stmt_list RBRACKET
											{ {
												return_type = $1;
												fname	= $2;
												formals = $4;
												locals = List.rev $7 ;
												body	= List.rev $8	} }

	stmt_list:
		/* Nothing */						{ [] }
		| stmt_list stmt 					{ $2 :: $1 }


	stmt:
		expr SEMI							{ Expr ($1) }
		| error                            	{ Expr(Noexpr) }
	    | CONNECTDB SEMI                   	{ ConnectDB }
	    | CLOSEDB SEMI                      { CloseDB }
	    | LBRACKET stmt_list RBRACKET		{ Block(List.rev $2) }
		| RETURN expr SEMI 					{ Return($2) }
		| IF LPAREN expr RPAREN stmt %prec NOELSE		{ If($3, $5, Nostmt)}
		| IF LPAREN expr RPAREN stmt ELSE stmt 			{ If($3, $5, $7) }
		| WHILE LPAREN expr RPAREN stmt 				{ While($3, $5) }
		| FOR LPAREN expr_opt SEMI expr_opt SEMI expr_opt RPAREN stmt
														{ For($3, $5, $7, $9)}

	expr:
		  INTLITERAL					{ IntLiteral($1) }
		| STRINGLITERAL					{ StringLiteral($1) }
		| FPLITERAL						{ FPLiteral($1) }
		| ID ASSIGN expr 				{ Assign($1, Eql, $3) }
		| ID PLEQ expr 					{ Assign($1, Ple, $3) }
		| ID MIEQ expr 					{ Assign($1, Mie, $3) }
		| ID MUEQ expr 					{ Assign($1, Mue, $3) }
		| ID DVEQ expr 					{ Assign($1, Dve, $3) }
		| expr PLUS expr 				{ Binop($1, Add, $3) }
		| expr MINUS expr 				{ Binop($1, Sub, $3) }
		| expr TIMES expr 				{ Binop($1, Mult, $3) }
		| expr DIVIDE expr 				{ Binop($1, Div, $3) }
		| expr MOD expr 				{ Binop($1, Mod, $3) }
		| expr EXP expr 				{ Binop($1, Exp, $3) }
		| expr EQ expr 					{ Binop($1, Equal, $3) }
		| expr NEQ expr 				{ Binop($1, Neq, $3) }
		| expr LT expr 					{ Binop($1, Less, $3) }
		| expr LEQ expr 				{ Binop($1, Leq, $3) }
		| expr GT expr 					{ Binop($1, Greater, $3) }
		| expr GEQ expr 				{ Binop($1, Geq, $3) }
		| expr OR expr 					{ Binop($1, Or, $3)}
		| expr AND expr 				{ Binop($1, And, $3)}
		| ID							{ Id($1) }
		| NOT expr 						{ Notop($2) }
		| ID INCR 						{ Unop($1, Incr) }
		| ID DECR 						{ Unop($1, Decr) }
		| MINUS expr 					{ Neg($2)}
		| PLUS expr  					{ Pos($2)}
	    | SIZEOF LPAREN expr RPAREN     { SizeOf($3) }
		| PRINT LPAREN actuals_opt RPAREN		{ Print($3) }
	    | FPRINT LPAREN ID COMMA actuals_opt RPAREN 	{ FPrint($3, $5) }
	    | FREAD LPAREN  ID RPAREN             	{ FRead($3) }
	    | CLOSE LPAREN ID RPAREN              	{ Close($3) }
	    | OPEN LPAREN STRINGLITERAL COMMA STRINGLITERAL RPAREN	{ Open($3, $5) }
		| ID LPAREN actuals_opt RPAREN	{ Call($1, $3) }
	    | ID LSQUARE expr RSQUARE     	{ Array($1, $3) }
	    | ID DOT ADD LPAREN RPAREN 		{ AddTableCall($1) }
	    | ID DOT GET LPAREN actuals_opt RPAREN 	{ GetTableCall($1, $5) }
		| ID DOT ID LPAREN actuals_opt RPAREN	{ TableCall($1, $3, $5) }
		| ID DOT ID						{ TableAttr($1, $3) }
		| LPAREN expr RPAREN			{ Parens($2) }

	expr_opt:
						{ Noexpr }
		| expr 			{ $1 }

	formals_opt:
						{ [] }
		| formal_list	{ List.rev $1 }

	formal_list:
		 formal				{ [$1] }
		| formal_list COMMA formal { $3 :: $1 }

	formal:
		dtype ID { Formal ($1, $2) }

	actuals_opt:
						{ [] }
		| actuals_list 	{ List.rev $1 }

	actuals_list:
		expr 			{ [$1] }
		| actuals_list COMMA expr { $3 :: $1 }

	global_decl_list:
									 { [] }
		| global_decl_list global_decl { $2 :: $1 }

	global_decl:
		| GLOBAL dtype ID ASSIGN expr SEMI		{ GVarDecl($2, $3, $5) }
		| GLOBAL dtype ID SEMI					{ GVarDecl($2, $3, Noexpr) }

	var_decl_list:
								 { [] }
		| var_decl_list var_decl { $2 :: $1 }

	var_decl:
		| dtype ID ASSIGN expr SEMI		{ VarDecl($1, $2, $4) }
		| dtype ID SEMI					{ VarDecl($1, $2, Noexpr) }
	    | dtype ID ID ASSIGN expr SEMI  { UDecl($1, $2, $3, $5) }
	    | dtype ID ID SEMI              { UDecl($1, $2, $3, Noexpr) }

	dtype:
	    VOID   { VoidType }
	    | INT  { IntType }
	    | STRING { StringType }
	    | TABLE { TableType }
	    | FLOAT { FloatType }
	    | FILE  { FileType }
	    | USERTYPE { UserType }

	conn_label:
	    SERVER      { ServerConn }
	    | PORT      { PortConn }
	    | USER      { UserConn }
	    | PASS      { PassConn }
	    | TYPE      { TypeConn }
	    | DBNAME    { DBConn }

	conn_attribute:
	    conn_label ASSIGN STRINGLITERAL SEMI { ConnAttr($1, $3) }

	conn_block:
	                                { NoConnBlock }
	    | CORDBCONN
	    conn_attribute conn_attribute
	    conn_attribute conn_attribute
	    conn_attribute conn_attribute
	    ENDDBCONN                       { ConnBlock($2, $3, $4, $5, $6, $7) }

	attribute_label:
	    ID      { AttrLabel($1) }

	attribute:
	    attribute_label COLON dtype SEMI		{ Attr($1,$3) }

	attribute_group:
	     attribute               	{ [$1] }
	    | attribute_group attribute { $2 :: $1 }

	key_decls_list:
		| key_decls							{ [$1] }
		| key_decls_list key_decls 	{ $2 :: $1 }

	key_decls:
	    PRIMARYKEY LPAREN attribute_label RPAREN SEMI { PrimaryKey($3) }

	table_label:
		ID 		{ TableLabel($1) }

	table_body:
	    attribute_group key_decls_list fdef_list { TableBody($1,$2,$3) }

	table:
		TABLE table_label LBRACKET table_body RBRACKET	SEMI { {
							tbname = $2;
							tbbody = $4
		} }

	tables_list:
								  { [] }
		| tables_list table { $2 :: $1 }

	table_block:
	                                { NoTableBlock }
	    | CORDB tables_list ENDDB { TableBlock($2) }





`ast.ml`

	type op = (* Binary operators *)
	    Add
	    | Sub
	    | Mult
	    | Div
	    | Mod
	    | Equal
	    | Neq
	    | Less
	    | Leq
	    | Greater
	    | Geq
	    | And
	    | Or
	    | Exp

	type uop = (* ++ and -- operators *)
	    Incr
	    | Decr

	type asignmt = (* =, +=, -=, *=, /= *)
	    Eql
	    | Ple
	    | Mie
	    | Mue
	    | Dve

	type dtype =
	    VoidType
	    | IntType
	    | StringType
	    | TableType
	    | NoType
	    | FloatType
	    | FileType
	    | UserType


	type conn_label =
	    ServerConn
	    | PortConn
	    | UserConn
	    | PassConn
	    | TypeConn
	    | DBConn

	type conn_attribute =
	    ConnAttr of conn_label * string

	type conn_block =
	    ConnBlock of conn_attribute * conn_attribute * conn_attribute * conn_attribute * conn_attribute * conn_attribute
	    | NoConnBlock

	type attr_label =
	    AttrLabel of string

	type attribute =
	    Attr of attr_label * dtype

	type key_decls =
	    PrimaryKey of attr_label

	type table_label =
	    TableLabel of string

	type expr =
	    IntLiteral of int
	    | StringLiteral of string
	    | FPLiteral of float
		| Id of string
		| Call of string * expr list
	    | Binop of expr * op * expr
	    | Unop of string * uop
	    | Neg of expr
	    | Pos of expr
	    | Notop of expr
	    | Print of expr list
	    | FPrint of string * expr list
	    | FRead of string
	    | Assign of string * asignmt * expr
	    | Open of string * string
	    | Close of string
	    | AddTableCall of string
	    | GetTableCall of string * expr list
	    | TableCall of string * string * expr list
	    | TableAttr of string * string
	    | Parens of expr
	    | Array of string * expr
	    | SizeOf of expr
	    | Noexpr

	type var_decl =
	    VarDecl of dtype * string * expr
	    | UDecl of dtype * string * string * expr
	    | GVarDecl of dtype * string * expr

	type formal =
	    Formal of dtype * string

	type stmt =
	    Block of stmt list
		| Expr of expr
	    | Return of expr
	    | If of expr * stmt * stmt
	    | For of expr * expr * expr * stmt
	    | While of expr * stmt
	    | CloseDB
	    | ConnectDB
	    | Nostmt

	type func_def = {
	        return_type : dtype;
			fname	: string;
			formals	: formal list;
			locals	: var_decl list;
			body	: stmt list;
	}

	type table_body =
	    TableBody of attribute list * key_decls list * func_def list

	type table = {
	    tbname : table_label;
	    tbbody : table_body;
	}

	type table_block =
	    TableBlock of table list
	    | NoTableBlock

	type program = {
	            conn : conn_block;
	            tables : table_block;
	            globals : var_decl list;
	            funcs  : func_def list;
	}





`generator.ml`

	open Ast
	open Printf

	let tab lvl =
	  String.make lvl '\t'

	let rec str_of_type t =
	    match t with
	    | IntType -> "Integer"
	    | StringType -> "String"
	    | VoidType -> "Void"
	    | TableType -> "Table"
	    | FloatType -> "Float"
	    | FileType -> "File" (* should never come up in SQL query *)
	    | NoType -> "" (* should never actually happen *)
	    | UserType -> ""

	let rec str_of_asgn a =
	    match a with
	    | Eql -> " = "
	    | Ple -> " += "
	    | Mie -> " -= "
	    | Mue -> " *= "
	    | Dve -> " /= "

	let rec str_of_op o =
	    match o with
	    | Add -> " + "
	    | Sub -> " - "
	    | Mult -> " * "
	    | Div -> " / "
	    | Mod -> " % "
	    | Exp -> " ** "
	    | Equal -> " == "
	    | Neq -> " != "
	    | Less -> " < "
	    | Leq -> " <= "
	    | Greater -> " > "
	    | Geq -> " >= "
	    | Or -> " or "
	    | And -> " and "

	let rec str_of_uop u =
	    match u with
	    | Incr -> " +1 "
	    | Decr -> " -1 "

	let rec str_of_conn_label co =
	    match co with
	    | ServerConn -> "setServer"
	    | PortConn -> "setPort"
	    | UserConn -> "setUser"
	    | PassConn -> "setPass"
	    | TypeConn -> "setConnType"
	    | DBConn -> "setDBName"

	let rec str_of_conn_attr ca =
	    match ca with
	    | ConnAttr(cl, a) -> (str_of_conn_label cl) ^ "(" ^ a ^ ")"

	let rec str_of_conn_block cb =
	    match cb with
	    | ConnBlock(a1, a2, a3, a4, a5, a6) -> (str_of_conn_attr a1) ^
	        "\n" ^ (str_of_conn_attr a2) ^ "\n" ^ (str_of_conn_attr a3)
	        ^ "\n" ^ (str_of_conn_attr a4) ^ "\n" ^ (str_of_conn_attr a5)
	        ^ "\n" ^ (str_of_conn_attr a6) ^ "\n"
	    | NoConnBlock -> ""

	let rec str_of_attr_label al =
	    match al with
	    | AttrLabel(l) -> l

	let rec str_of_attr a =
	    match a with
	    | Attr(a, t) -> (str_of_attr_label a) ^ " = Column(" ^ (str_of_type t) ^ ")"

	let rec str_of_attr_group ag lvl =
	    (let l = "\n" ^ (tab (lvl)) in
	        (String.concat l (List.map str_of_attr ag)))

	let rec str_of_key k =
	    match k with
	    | PrimaryKey(al) -> "PrimaryKeyConstraint('" ^ (str_of_attr_label al) ^ "')"
	    (*| ForeignKey(al) -> "ForeignKey('" ^ (str_of_attr_label al) ^ "')" *)

	let rec str_of_query_filter q =
	    match q with
	    (* Get rid of quotes in a string *)
	    | StringLiteral(l) -> let len = (String.length l) in
	                            (String.sub l 1 (len-2) )
	    | IntLiteral(l) -> string_of_int(l)
	    | FPLiteral(l) -> string_of_float(l)
	    | Id(s) -> s
	    | Binop(a, op, b) -> (str_of_query_filter a) ^ (str_of_op op) ^ ":" ^ (str_of_query_filter a)
	    | Assign(l, asgn, r) -> l ^ "=" ^ ":" ^ l

	    | Call(s, expr) -> "" (* should not ever be called in this context *)
	    | Unop(s, uop) -> s ^ "=" ^ s ^ (str_of_uop uop)
	    | Neg(expr) -> "-" ^ (str_of_query_filter expr)
	    | Pos(expr) -> "+" ^ (str_of_query_filter expr)
	    | Notop(expr) -> "" (* the following few will never happen for the context of query filter*)
	    | Print(expr) -> ""  (* and just need definitions to eliminate compiler warnings *)
	    | FPrint(s, expr) -> ""
	    | FRead(s) -> ""
	    | Open(s, p) -> ""
	    | Close(s) -> ""
	    | AddTableCall(s) -> ""
	    | GetTableCall(s, expr) -> ""
	    | TableCall(s, p, expr) -> ""
	    | TableAttr(s, p) -> ""
	    | Parens(expr) -> ""
	    | Array(s, expr) -> ""
	    | SizeOf(e) -> ""
	    | Noexpr -> ""

	let rec str_of_query_params q =
	    match q with
	    | StringLiteral(l) -> l
	    | IntLiteral(l) -> string_of_int(l)
	    | FPLiteral(l) -> string_of_float(l)
	    | Id(s) -> s
	    | Binop(a, op, b) -> (str_of_query_params a) ^ "=" ^ (str_of_query_params b)

	    | Assign(l, asgn, r) -> l ^ "=" ^ (str_of_query_params r)
	    | Call(s, expr) -> "" (* should not ever be called in this context *)
	    | Unop(s, uop) -> s ^ "=" ^ s ^ (str_of_uop uop)
	    | Neg(expr) -> "-" ^ (str_of_query_params expr)
	    | Pos(expr) -> "+" ^ (str_of_query_params expr)
	    | Notop(expr) -> "" (* the following few will never happen for the context of query filter*)
	    | Print(expr) -> ""  (* and just need definitions to eliminate compiler warnings *)
	    | FPrint(s, expr) -> ""
	    | FRead(s) -> ""
	    | Open(s, p) -> ""
	    | Close(s) -> ""
	    | SizeOf(e) -> ""
	    | AddTableCall(s) -> ""
	    | GetTableCall(s, expr) -> ""
	    | TableCall(s, p, expr) -> ""
	    | TableAttr(s, p) -> ""
	    | Parens(expr) -> ""
	    | Array(s, expr) -> ""
	    | Noexpr -> ""

	let rec str_of_expr exp =
	    match exp with
	    | IntLiteral(l) -> string_of_int(l)
	    | StringLiteral(l) -> l
	    | FPLiteral(l) -> string_of_float(l)
	    | Id(s) -> s
	    | Call(f, e) -> f ^ "(" ^ (String.concat "," (List.map str_of_expr e)) ^ ")"
	    | TableAttr(t, a) -> t ^ "." ^ a
	    | Open(fp, rw) -> "open(" ^ fp ^ ", " ^ rw ^ ")"
	    | Close(e) -> e ^ ".close()"
	    | FPrint(fp, e) -> fp ^ ".write(" ^ (String.concat "," (List.map str_of_expr e)) ^ ")"
	    | FRead(fp) -> fp ^ ".readline()"
	    | SizeOf(e) -> "sizeof("^ (str_of_expr e) ^ ")"
	    | AddTableCall(f1) -> "controller.session.add(" ^ f1 ^ ")"
	    | GetTableCall(f1, e) -> "controller.session.query(" ^ f1 ^ ").filter(\"" ^ (String.concat " and " (List.map str_of_query_filter e)) ^ "\").params(" ^ (String.concat " , " (List.map str_of_query_params e)) ^ ")"
	    | TableCall(f1, f2, e) -> f1 ^ "." ^ f2 ^ "(" ^ (String.concat "," (List.map str_of_expr e)) ^ ")"
	    | Print(e) -> "print(" ^ (String.concat "," (List.map str_of_expr e)) ^ ", end='')"
	    | Binop(a, op, b) -> (str_of_expr a) ^ (str_of_op op) ^ (str_of_expr b)
	    | Unop(a, uop) -> a ^ "=" ^ a ^ (str_of_uop uop)
	    | Notop(e) -> "not " ^ (str_of_expr e)
	    | Neg(e) -> "-" ^ (str_of_expr e)
	    | Pos(e) -> "+" ^ (str_of_expr e)
	    | Assign(l, asgn, r) -> l ^ (str_of_asgn asgn) ^ (str_of_expr r)
	    | Parens(p) -> "(" ^ (str_of_expr p) ^ ")"
	    | Array(id, e) -> id ^ "[" ^ (str_of_expr e) ^ "]"
	    | Noexpr -> ""

	let rec str_of_var_decl vdec lvl =
	    match vdec with
	    | VarDecl(t, v, Noexpr) -> (tab lvl) ^ v ^ "= None"
	    | VarDecl(t, v, e) -> (tab lvl) ^ (str_of_expr (Assign(v, Eql, e)))
	    | UDecl(ut, tn, v, Noexpr) -> (tab lvl) ^ v ^ "= None"
	    | UDecl(ut, tn, v, e) -> (tab lvl) ^ (str_of_expr (Assign(v, Eql, e)))
	    | GVarDecl(t, v, Noexpr) -> (tab lvl) ^ "global " ^ v
	    | GVarDecl(t, v, e) -> (tab lvl) ^ "global " ^ v ^ "\n" ^ (tab lvl) ^ (str_of_expr (Assign(v, Eql, e)))

	let rec str_of_formal f =
	    match f with
	    | Formal(t, n) -> "" ^ n

	let rec str_of_stmt s lvl =
	    match s with
	    | Block(stmts) -> (let l = "\n" ^ (tab lvl) in
	                        (String.concat l (List.map (fun x-> str_of_stmt x (lvl+1)) (stmts))))
	    | Expr(expr) -> str_of_expr expr
	    | Return(expr) -> "return " ^ (str_of_expr expr)
	    | If(e, s, Nostmt) -> "if " ^ str_of_expr e ^ ":\n" ^ (tab (lvl+2)) ^ str_of_stmt s (lvl+2)
	    | If(e, s1, s2) -> "if (" ^ str_of_expr e ^ "):\n" ^ (tab (lvl+2)) ^ str_of_stmt s1 (lvl+2)
	                    ^ "\n" ^ (tab (lvl+1)) ^ "else:\n" ^ (tab (lvl+2)) ^ str_of_stmt s2 (lvl+2)

	    | While(expr, stmts) -> (let l = "\n" ^ (tab (lvl+2)) in
	                        "while " ^ (str_of_expr expr) ^ ":" ^
	                        l ^ (str_of_stmt stmts (lvl+2)) )
	    | For(expr1, expr2, expr3, stmts) -> (let l = "\n" ^ (tab (lvl+2)) in
	                        (str_of_expr expr1) ^ "\n" ^ (tab (lvl+1)) ^ "while " ^ (str_of_expr expr2) ^ ":" ^
	                        l ^ (str_of_stmt stmts (lvl+2)) ^
	                        "\n" ^ (tab (lvl+2)) ^ (str_of_expr expr3))
	    | ConnectDB -> "controller.Base.metadata.create_all(controller.engine)"
	    | CloseDB -> "controller.session.commit()"
	    | Nostmt -> ""

	let rec str_of_table_label tl =
	    match tl with
	    | TableLabel(l) -> "" ^ l

	let str_of_fdef fdef globals lvl =
	    (tab lvl) ^ "def " ^ fdef.fname ^ "(" ^
	            (String.concat "," (List.map str_of_formal fdef.formals)) ^ "):\n"

	    ^ (tab (lvl+1)) ^ (let l = "\n" ^ (tab (lvl+1)) in
	                            (String.concat l (List.map (fun x-> str_of_var_decl x (lvl)) fdef.locals)))
	                    ^ "\n"

	    ^ (tab (lvl+1)) ^ (let l = "\n" ^ (tab (lvl+1)) in
	                            (let ll = (String.concat l (List.map (fun x-> str_of_stmt x (lvl)) fdef.body)) in
	                                match ll with
	                                | "" -> "return"
	                                | _ -> ll))

	let rec str_of_table_body tbb lvl =
	    match tbb with
	    | TableBody(ag, kd, fd) -> (str_of_attr_group ag (lvl)) ^ "\n" ^ (tab lvl) ^ "__table_args__= ("
	            ^(String.concat ("\n"^(tab lvl)) (List.map str_of_key kd)) ^ ", {})\n"
	            ^ (String.concat "\n" (List.map (fun x-> str_of_fdef x [] (lvl)) fd))

	let rec str_of_table tb =
	    "class " ^ (str_of_table_label tb.tbname) ^ "(Base):\n" ^
	            (* cleanup these 1's later *)
	    (tab 1) ^
	                "__tablename__ = '" ^ "" ^ (str_of_table_label tb.tbname)^ "'" ^ "\n" ^ (tab 1) ^
	                (str_of_table_body tb.tbbody 1 )

	let rec str_of_table_block tb =
	    match tb with
	    | TableBlock(tables) -> (String.concat "\n" (List.map str_of_table tables))
	    | NoTableBlock -> ""

	let str_of_program program =
	        "#!/usr/bin/env python\n" ^
	        "from __future__ import print_function\n" ^
	        "import coral_backend\n" ^
	        "from coral_backend import *\n" ^
	        "from coral_backend.controller import *" ^
	        "\n\n" ^
	        (let l = (str_of_conn_block program.conn) in
	        match l with
	        | "" -> "conn_block = False\n\n"
	        | _ -> l ^ "conn_block = True\n\n" )
	        ^ "\n\n" ^
	         (str_of_table_block program.tables) ^ "\n\n"

	         ^ (let l = "\n" in
	        (String.concat l (List.map (fun x-> str_of_var_decl x 0) program.globals)) ^ "\n")

	        ^ (let l = "\n" in
	                (String.concat l
	                    (List.map (fun x-> str_of_fdef x program.globals 0) program.funcs))
	                    ^ "\n\nif __name__ == '__main__':\n\tif (conn_block):\n\t\tconnectDB()\n\tmain()"
	            )



`coral.ml`

	open Ast
	open Generator
	open Semantic
	open Parser
	open Scanner

	exception Silent of string

	let _ =


	   let source = open_in Sys.argv.(1) in
	   let lexbuf = Lexing.from_channel source in
	   let program = 
	  (*   try*)
	       Parser.program Scanner.token lexbuf 
	   (*  with _ ->
	       exit 2 *)
	   in
	   let _ = Semantic.check_program(program) in
	   let python_source_code = (str_of_program program) in
	   let file_name = (String.sub Sys.argv.(1) 0 (String.length Sys.argv.(1) - 3)) in
	   let dest = file_name ^".clx" in
	   let bin = open_out dest in
	   output_string bin python_source_code;
	   close_out bin;

	let file_name = (String.sub Sys.argv.(1) 0 (String.length Sys.argv.(1) - 3)) in
	let make_executable = Sys.command ("chmod a+x " ^ file_name ^ ".clx") in
	match make_executable with
	0 -> "Success!"
	| _ -> "Error";

