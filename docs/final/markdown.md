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

In CORaL, new database object are always defined using the following syntx:

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

This manual describes the CORaL 1.0 language as established in May of 2013. It is modeled after the C Reference Manual included in Appendix A of *The C Programming Language* by Kernighan and Ritchie.

### Lexical Conventions ###

CORaL programs are translated in several phases. Translation begins with searching for the `#` character in order to look for the `#cordbconn` and `#coordb` tags, which will be used to connect and create the database objects. Distinguishing between expressions defined inside and outside of these database definition tags is a main component of the preprocessing of a program, before the program is broken down into a series of tokens.

#### Tokens ####

CORaL implements implements six kinds of tokens: identifiers, keywords, constants, operators, and separators. Anything characterized as "white space" (which includes blanks, tabs, and newlines) is ignored by the compiler. Tokens consist of the longest sequential string characters that could constitute a token.

#### Comments ####

Comments in CORaL can be done in two styles. The first is an inline comment, designated by `//`. The compiler ignores everything after `//` until the conclusion of the line. Comments can also be begun with `/*` and concluded with `*/`. This flavor of comment can span multiple lines.

#### Identifiers ####

An identifier is a sequence of letters and digits. Identifiers in CORaL have similar restrictions as those in C. The first character of an identifier must be a letter (the '`_`' character counts as a letter). The language is case-sensitive, so upper and lower case letters are considered different, and identifiers can have any length.

#### Keywords ####

CORaL reserves the following identifiers for use as keywords:  

	array		char		double		else		for

#### String Literals ####

A string literal is a sequence of characters surrounded by double quotes. An example would be `"this string"`. A string has type `string` and is initialized with the given characters. Adjacent string literals are concatenated into a simple string. String literals do not contain newline or double-quote characters; in order to represent them, one can use the following escape sequences:  

	newline					\n
	tab					\t
	single quote 					\'
	double quote					\"
	question mark					\?
	backslash					\\

### Syntax Notation ###

The syntax notation used in this manual indicates syntactic categories with *italic* type and literal words and characters with `console` type. Alternative categories are listed on separate lines. When describing the grammar of our language the *-->* symbol denotes the way that certain variables in the grammar are defined. The expression on the left hand side is the name of that expression and the right hand side shows the different definitions that a symbol can take on when it appears in a larger expression. The pipe | symbols represent "or" in this case. So for example, the grammar statement *S --> true* indicates that the expression *S* can take on either value *true* or value *false*.

### Meaning of Identifiers ###

The term identifier can refer to a function or an object (objects includes variables). Objects are locations in memory, and each object has a type which identifies how the object's data should be interpreted. Object names also have scopes, which are the regions of the program in which the object is know to the program.

#### Basic Types ####

The basic types in CORaL are `int`, `float`, `string`, and `void`. An `int` supports arithmetic operations; the `float` type is a single-precision floating point number; a `string` is a sequence of characters. The `void` type is an empty value used as the return value for a function that does not return anything. The `Table` type represents a table in the database

#### Derived Types####

The derived types in CORaL are built out of the basic types in the following ways:  

* *functions* that return an object of a given type
* *tables* containing objects

### Object and Lvalues ###

Objects, as stated above, are regions of storage tagged with an identifying name. *Lvalues* are expressions that refer to objects. Some operations will produce *lvalues*, and others operate on *lvalues*.

### Expressions ###

The priority sequence of expressions is the same as the are presented within these subsections, and within each subsection the operations all have equal preference.

#### Primary Expressions ####

Primary expressions are identifiers, constants, strings, or expressions that are encased in parentheses.  

#### Postfix Expressions ####

Like all primary expressions, postfix expressions are also grouped left to right. When the expression is followed by a `.`*identifier*, it means that a method is being called on the function represented by the postfix expression. The postfix expressions `++` and `--` are used to increment or decrement the value of the operand represented by the expression by a value of one. 

#### Unary Operators ####

Expressions with unary operators are grouped right-to-left which is the opposite of everything that has come thus far. The operators `+` and `-` are the only unary operators in the language.

#### Multiplicative Operators ####

All of the operators must be given arithmetic types, so only `int` or `float` will be accepted as valid inputs to the expression. The `%` operator must have `int` type. The `*` operator yields multiplication, the `/` operator yields the quotient, the `%` yields the remainder, and the `**` operator yields exponentiation. If the second operand of the `/` or the `%` operator is `0` then the result will be undefined.

#### Additive Operators ####

The additive operators in the language are `+` and `-` and are also grouped from left-to-right. All the operands given to these operators need to be of arithmetic type. The result of the `+` operator is the sum of the operands and the result of the `-` table is the difference of the operands.

#### Relational Operators ####

The relational operators are grouped from left-to-right, the same way that the additive and multiplicative operators are. The operators are `<`, `>`,`<=`, and `>=`. The `<` operator denotes "less than" and will return   
**REVIEW**

#### Equality Operators ####

**REVIEW**

#### Logical AND Operator ####

**REVIEW**

#### Logical OR Operator ####

**REVIEW**

#### Assignment Expressions ####

All of these expressions require an lvalue as left operand, and the lvalue must be modifiable: it must not have an incomplete type or be a function. The type of an assignment expression is that of the left operand, the value stored in the left operand after the assignment has taken place.

An expression of the form `T1 op= T2` is equivalent to `T1 = T1 op (T2)` except that `T1` is evaluated only once.  
The `=` assign,meant operator replaces the object referred to by the lvalue. Both operands must have the same type in order for the assignment to be executed properly.

### Declarations ###

Declarations determine the type and name of an identifier.

#### Type Specifiers ####

The type-specifiers assign a type to an object. They are: `void, int, string, float, and Table` Only one type-specifier is provided for a given declaration, unless they are used recursively to define an array.

#### Initialization ####

Objects can be initialized when declared in the following way

	[type-specifier] [object-name] = [value]

### Statements ###

All statements in CORaL are executed and do not return values, but are rather executed for their effects. The groups are listed below.

#### Expression Statement ####

The majority of statements in CORaL ail fall into this category. Expression statements include assignments and function calls. Expressions can be null in certain cases.

#### Selection Statements ####

Selection statements are used for control flow within a function. In an `if` statement, the expression is evaluated, and the following statement is executed if the expression is true. Otherwise, the statement following the `else` will be evaluated, if an `else` is present. An `else` is always paired to the last `if` statement without a matched `else`.

#### Iteration Statements ####

Iteration statements are concerned with looping. There are two types: `while` and `for`.  
In a `while` statement, the statement is evaluated as long as the expression is true. In a `for` statement, the first expression is evaluated to initialize the loop. The second expression must be arithmetic; the loop is executed as long as the second expression is true. The third expression is evaluated after every iteration of the loop and used for re-initialization.  
In either iteration-statement, any expression may be omitted.

#### Jump Statements ####

There is only one jump statement in CORaL, the `return` statement. `return` statements are used by functions to return to the caller. If an expression is present, the value of the statement is also returned. This value will be of the same type specified in the function definition. If a return is provided with no expression or no return is provided at all, the value will be undefined. 

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

The global declarations are the top level of the grammar.

#### Global Variables ####

Global variables can be declared after the database blocks, but before the function definitions.

#### Function Definitions ####

A CORaL function definition will have the following structure

	[type-specifier] [identifier] ([parameter-type-list]){[statement-list]}
Functions may return `void`, `int`, `float`, `string`, and `Table`. The parameter type list must declare the types of each parameter unless the only parameter is `void`, which signifies that the function accepts no parameters.

#### Scope ####

The source text for a program will be kept in one file that will be compiled at one time. Upon compilation time, the scope of the identifiers will be validated.

The lexical scope of an identifier is the region of the program text within which the identifier's characteristics are understood. The same identifier may be used for different purposes as long as their uses fall into different namespaces. The scope of a parameter of a function definition begins at the start of the block defining the function, and persists though the function until the function declaration ends at the end of its declarator, and persists to the end of the block. The scope of a table is the entirety of the program.

### Grammar ###

The grammar of our language is specified below. Syntax for understanding the description of the grammar can be found in the syntax section. 

	program		->	conn_block table_block global_decl_list fdef_list
	
	fdef_list	->	
				|	fdef_list fdef  
				
	fdef		->	dtype ID LPAREN formals_opt RPAREN LBRACKET var_decl_list stmt_list RBRACKET

	stmt_list	->  
				|	stmt_list  stmt

	stmt		->	expr SEMI
				|	error
				|	CONNECTDB SEMI
				|	CLOSEDB SEMI
				|	LBRACKET stmt_list RBRACKET
				|	RETURN expr SEMI
				|	IF LPAREN expr RPAREN stmt NOELSE
				|	IF LPAREN expr RPAREN stmt ELSE stmt
				|	WHILE LPAREN expr RPAREN stmt
				|	FOR LPAREN expr_opt SEMI expr_opt SEMI expr_opt RPAREN stmt

	expr		->	INTLITERAL
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

	expr_opt	->  
				|	expr

	formals_opt	->	
				|	formal_list

	formal_list	->	formal
				|	formal_list COMMA formal

	formal		-> dtype ID

	actuals_opt	->

## Project Plan [plan] ##

### Development Process ###

Our development was very much team-focused. While we did assign different components and sub-components to individual team members, we chose to do most of our development in a group setting so that we were more easily able to ask one another how the parts fit together and ensure compatibility across the components. In addition, this was greatly beneficial for debugging the compiler source code, because we chose to develop in OCaml, which is a language none of us had used before. Due to the fact that we were often in the same room together while working, we were able to quickly help each other with OCaml syntax, style, and errors.

However, this approach became difficult as the end of the semester neared, because all of our team members became extremely busy, so it was hard to coordinate meetings where all of us could join. The approach we took was essentially a week-long hackathon: everyone finished up most of their other responsibilities by the last day of classes so that we could spend the next week coding our compiler. At this point, we had implemented the basic shell of it, which included a near-complete lexer, about a third of our grammar, and a basic code generator. Still, the bulk of the work remained, which did cause a rather unpleasantly large amount of work to need to be completed in a small timeframe. This time pressure acted as a great source of motivation, though, and we managed to cultivate a very focused and energized experience during our development sessions, and ended up getting plenty of sleep throughout the week while still completing our compiler on time.

### Roles and Responsibilities ###

The assigned team member roles were as follows:

	Brian : Team Manager
	Molly : Language Guru
	Luis : System Architect
	Miguel : System Integrator
	Shane : System Tester

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
	Don't comment something unless it is performing a function that is not immediately apparent. Do more than simply stating the obvious.

	# Naming conventions #

	** Function and variable names **

	Use lower case for the first character in a variable name. If a name is composed of multiple words, use underscores, not camelcase.

	i.e. str_of_program

	** Use meaningful names **

	Longer names that make the value's meaning readily apparent are preferable to shorter names. 

	# Indenting #

	** Long expressions **

	Break them up using newlines and indents to keep them around 80 characters, in the following manner

	let x = "long line " ^
			"is very long"

	** Matching expressions **

	Should be indented with a new case on each line, as follows

	match an_expr with
	| Case(y) -> ...
	| DifferentCase(m) -> ...

	# Pattern matching #

	** Do not leave any unmatched cases **

	The Ocaml compiler will warn you, so once it does, go back and add them in. If you don't know what to do, flag it with a TODO comment.


	* Style guide adapted from *
	[Cornell OCaml Style Guide](http://www.cs.cornell.edu/courses/cs3110/2008fa/handouts/style.htm)

### Project Timeline ###

As explained above, the development of our compiler was heavily weighted toward the end of the semester. To wit, we include the graph of the team's commits to our git repo, as well as a chart of code additions versus deletions, below.

[commits]: commits.png

[add_del]: add_del.png

### Project Log ###

## Language Evolution [evol] ##

CORaL started out with the overall goal in mind of making it easy for low-level programmers to integrate databases into their projects. As a team consisting of mostly Computer Engineers, on the whole we are far more familiar with low-level languages like C than higher-level scripting languages that perhaps have more support for SQL integration. But more importantly, CORaL aims to make writing SQL directly inside your own code seamless and easy, a feature that seems lacking in this scope. As such, the market for CORaL is programmers who are very familiar with C, and have had little to no experience working with SQL schemas or any kind of external database. During the development of CORaL, this high-level goal kept consistent throughout. When deciding whether or not to make a change to our original grammar, it was necessary to first ask the question "Would this be intuitive to a C programmer?" Maintaining the "C-like" component of our language was of high importance to us throughout the process.

CORaL evolved significantly from that which we had originally proposed at the beginning of the semester. A lot of these changes also involved scaling back on components that we quickly realized were either unrealistic, or unnecessary for us to stay in like with our overall goals Much of our original grammar was based on the C grammar from the K&R reference manual. When starting actually implement the grammar, we found that much of our grammar could be simplified and many constructs or principles we used to ensure our grammar was unambiguous were not necessary with the compiler tools that we decided to use. 

Because of the dramatic differences that we began to notice at the beginning of implementation, when writing our grammar into our parser.mly file, we essentially began writing the grammar from scratch, rather than basing it off of the grammar in our original LRM. As such, it was crucial for every team member involved in writing the grammar to both understand the overall structure and goal of the grammar, and discuss with the team when making any radical changes. 

In order to get a full working compiler, we needed to scale back on a few components that we had originally promised. We completely eliminated the idea of having functions within our Tables, as well as inheritance on Tables. Of all the changes that we made, these two stand out as the most drastic changes that we made to our original design decisions. However, after lengthy implementation discussions we decided that the time it would have taken us to implement these features could have been better spent perfecting the more crucial aspects of CORaL. These features were not entirely eliminated from our grammar, but we did not have time to perform any of our semantic checks on said elements, including type-checking and checking against and adding to the Table symbol table. As a general rule, any features that we ended up deciding not the fully implement remained in our grammar and now just throw semantic errors.  

Of all compiler tools, that which is most important is the language your compiler is written in. For this, our team chose OCaml, a language which all members of the team were unfamiliar with, but which was recommended to us for it's ease-of-use and minimal code required when writing compilers. Of course, the other required compiler tools were just lex and yacc, to be used for lexing and parsing our source program. Lex was utilized in the scanner.mll file, and yacc was utilized in the parser.mly file; both can be viewed our source code, in the appendix of this document. OCaml has lex and yacc built in (OCamllex, OCamlyacc), so there was no integration required. 

The only unusual library that was required by our compiler was SQLAlchemy. Because CORaL is compiled into Python, we were able to use SQLAlchemy to do most of the heavy lifting on the backend. SQLAlchemy is a database toolkit and object-relational mapper for python. The CORaL compiler utilizes this when performing all of it's signature built-in functions that perform queries, inserts, or operations on Table objects within your database.  

Throughout the development process, it was relatively easy to maintain consistency between the language reference manual (LRM) and the compiler. Aside from the grammar, the content of the LRM was robust when originally written, and thus all development was based off of this content. Rather than requiring steps to keep them consistent, the compiler was based off of the LRM, so there was little to no need for consistency checks.

## Translator Architecture [arch] ##

bla ble bli

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

With expected outut:
	0
	0
	0


A more complicated test:
	#cordbconn

	server="";
	
user="";

	password="";

	port="";
	
DBName="";

	type="sqlite";
	
#enddbconn
	

#cordb
Table
	Person {

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


Expected value manually tested as test program doesn't support file output:

molly
miguel
shane



## Conclusions [conc] ##

###CORaL Team Lessons###

###Individual Lessons###

* ***Shane Chin*** :

	This project has taught me the importance of regression testing in software development; I had heard of the practice bieng used but rarely 

really understood the merit without the help of an incredibly difficult and large program. I learned the merit to reducing the scope of your project 

in areas in which it is too ambitious. 

	I learned the joys of working with a highly productive, punctual team, which was really willing to put in the work required. I look forward 

to trying to create my next language!


* ***Molly Karcher*** : 
	Throughout the duration of this project I learned first and foremost, the importance of flexibility in design. Our original design plan (at least as far as the grammar was concerned) ended up being pretty drastically different than originally planned, and the whole team had to be open to and understanding of a dynamically changing product. 

	Similarly, you learn the importance of maintaining good off-line documentation, or at the very least having at least one person in the group per moving part, that knows that part through and through. Keeping everyone in the group updated as to progress and where we were in development was a key challenge for us, and pretty much mandated that we develop while physically sitting next to each other. Though I definitely learned this through every other large-scale programming project I've been a part of, this project confirmed that above all, proximity to your fellow programmers is key. Remotely working, or working independently will slow down the development process with unnecessary confusion.

* ***Luis Pena*** :

* ***Miguel A. Yanez*** :
	This project has been one of the most challenging yet rewarding experiences during my time here at Columbia. Building a programming language that is elegant, and simple, yet functional is a very interesting problem. Through designing and implementing CORaL I have learned and grown to appreciate the details and complexity that bright minds like those of Brian Kerninghan and Dennis Ritchie faced when developing C.

	My role as integrator led me to be familiar with every working component of CORaL as I was responsible for making sure that the language as a whole held together. Using Git to manage everyones changes proved very helpful. We also used GitHub's issue tracking system, so that there was a central place where all the issues were kept. 

	Time management also proved to be quite effective as our meetings were always efficient and effective. Everyone's opinions were voiced and we handled disagreements in a respectful manner. Our iterative development style also proved quite useful for this in that if there were any changes to be made, it was easy to do so. 

	Overall this has been a great experience, and I look forward to implementing another programming language as a personal project.

* ***Brian Wagner*** :

###Advice for Future Teams###

###Suggestions to Instructors###

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
	    let parse_error msg =
	        let start_pos = Parsing.rhs_start_pos 1 in
	            let lineNo = start_pos.pos_lnum in
	                print_endline ("There is a " ^ msg ^ " near line #" ^ string_of_int lineNo)

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
		| GLOBAL dtype ID ASSIGN expr SEMI		{ VarDecl($2, $3, $5) }
		| GLOBAL dtype ID SEMI					{ VarDecl($2, $3, Noexpr) }

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
									{ [] }
		| key_decls_list key_decls 	{ $2 :: $1 }

	key_decls:
	    PRIMARYKEY LPAREN attribute_label RPAREN SEMI { PrimaryKey($3) }
	    | FOREIGNKEY LPAREN attribute_label RPAREN SEMI { ForeignKey($3) }

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
	    | ForeignKey of attr_label

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

`semantic.ml`
	
	open Ast

	(* make the symbol table *)
	type symbol_table = {
		parent : symbol_table option;
		mutable variables : var_decl list;
		mutable functions : func_def list;
		mutable table_list : table list;
		mutable table_attrs : (dtype * string) list;
	}

	(* local translation env *)
	type trans_environment = {
		scope : symbol_table;
		ret_type : dtype;
		in_loop : bool;
		in_query: bool;
		in_table : string;
	}

	(* helper funcs for printing error messages *)
	let rec string_of_coral_type t =
		match t with
	    VoidType -> "void"
	    | IntType -> "int"
	    | StringType -> "string"
	    | TableType -> "Table"
	    | FloatType -> "float"
	    | FileType -> "File"
	    | UserType -> "user_t"
	    | NoType -> "null_type" (* values which cannot be assigned *)

	let rec string_of_coral_op o =
		match o with
	    Add -> "+"
	    | Sub -> "-"
	    | Mult -> "*"
	    | Div -> "/"
	    | Mod -> "%"
	    | Equal -> "=="
	    | Neq -> "!="
	    | Less -> "<"
	    | Leq -> "<="
	    | Greater -> ">="
	    | Geq -> ">"
	    | And -> "&&"
	    | Or -> "||"
	    | Exp -> "**"

	(* check types *)
	exception Error of string
	exception Type_mismatch_error of string * string


	let check_type t1 t2 =
	    if (not(t1 = t2)) then
	        raise ( Type_mismatch_error((string_of_coral_type t1), (string_of_coral_type t2)))
	    else t1

	(* find functions in symbol table *)
	let rec function_exists fname scope =
		try
			let _ = List.find (fun func_def -> func_def.fname = fname) scope.functions in true
		with Not_found ->
			match scope.parent with
				Some(parent) -> function_exists fname parent
				| _ -> false

	let rec find_function fname scope =
		try
			List.find (fun func_def -> func_def.fname = fname) scope.functions
		with Not_found ->
			match scope.parent with
				Some(parent) -> find_function fname parent
				| _ -> raise (Failure ("function " ^ fname ^ " referenced but not declared"))

	(* find variables in symbol table *)
	let rec variable_exists vname scope =
		try
			let _ = List.find (fun v_decl ->
						match v_decl with
						| VarDecl(t, v, e) -> v = vname
						| UDecl(ut, tn, v, e) -> v = vname) scope.variables in true
		with Not_found ->
			match scope.parent with
				Some(parent) -> variable_exists vname parent
				| _ -> false

	let rec find_variable vname scope =
		try
			List.find (fun v_decl ->
					match v_decl with
					| VarDecl(t, v, e) -> v = vname
					| UDecl(ut, tn, v, e) -> v = vname) scope.variables
		with Not_found ->
			match scope.parent with
				Some(parent) -> find_variable vname parent
				| _ -> raise (Failure ("variable " ^ vname ^ " referenced but not declared"))

	let rec variable_type vdec =
		match vdec with
		| VarDecl(t, v, e) -> t
		| UDecl(ut, tn, v, e) -> ut

	(* find attributes in symbol table *)
	let rec attr_exists aname scope =
		try
			let _ = List.find (fun a_decl ->
						match a_decl with
						| (t, n) -> n = aname) scope.table_attrs in true
		with Not_found ->
			match scope.parent with
			Some(parent) -> attr_exists aname parent
			| _ -> false

	let rec find_attr aname scope =
		try
			List.find (fun a_decl ->
					match a_decl with
					| (t, n) -> n = aname) scope.table_attrs
		with Not_found ->
			match scope.parent with
			Some(parent) -> find_attr aname parent
			| _ -> raise (Error ("attribute " ^ aname ^ " referenced but not declared"))

	(* find tables in symbol table *)
	let rec get_table_name table =
		let t_label = table.tbname in
			match t_label with
			| TableLabel(l) -> l

	let rec table_exists tname scope =
		try
			let _ = List.find (fun table -> (get_table_name table) = tname) scope.table_list in true
		with Not_found ->
			match scope.parent with
				Some(parent) -> table_exists tname parent
				| _ -> false

	let rec find_table tname scope =
		try
			List.find (fun table -> (get_table_name table) = tname) scope.table_list
		with Not_found ->
			match scope.parent with
				Some(parent) -> find_table tname parent
				| _ -> raise (Failure ("Table " ^ tname ^ " referenced but not declared"))

	let rec attr_exists_in_table aname tname scope =
		let tbl = (find_table tname scope) in
		let t_bod = tbl.tbbody in
		
		match t_bod with
		| TableBody(ag, kd, fd) -> 	try
										let _ = List.find (fun att ->
														match att with
														| Attr(a_label, t) ->
																	match a_label with
																	| AttrLabel(n) -> n = aname) ag in true
									with Not_found -> false

	(* check db connection section *)
	let rec check_conn_label co =
	    match co with
	    | ServerConn -> co
	    | PortConn -> co
	    | UserConn -> co
	    | PassConn -> co
	    | TypeConn -> co
	    | DBConn -> co

	let rec check_conn_attr ca  =
	    match ca with
	    | ConnAttr(cl, a) -> try
	                            (check_conn_label cl)
	                        with _ ->
	                            raise(Error("ConnLabel Error"))

	let rec check_conn_block cb =
	    match cb with
	    | ConnBlock(a1, a2, a3, a4, a5, a6) ->
	        let _ = (check_conn_attr a1) in
	        let _ = (check_conn_attr a2) in
	        let _ = (check_conn_attr a3) in
	        let _ = (check_conn_attr a4) in
	        let _ = (check_conn_attr a5) in
	        let _ = (check_conn_attr a6) in
	        NoType
	    | NoConnBlock -> NoType

	let rec check_expr exp env =
	    match exp with
	    | IntLiteral(l) -> IntType
	    | StringLiteral(l) -> StringType
	    | FPLiteral(l) -> FloatType
		| Id(v) -> (variable_type (find_variable v env.scope))
		| Call(f, e) -> if (function_exists f env.scope) then
	    					let f1 = (find_function f env.scope) in
	    					let fmls = f1.formals in
	    					if ((List.length fmls) != (List.length e)) then
	    						raise (Error ("improper number of arguments to function " ^ f1.fname))
	    					else
	    						let _ = (List.map2 (fun x y -> check_actual x y env) fmls e) in
	    							NoType
	    				else
	    					if (table_exists f env.scope) then
	    						UserType
	    					else
	    						let _ = (find_function f env.scope) in
	    							NoType
		| TableAttr(t, a) ->	if ((variable_type (find_variable t env.scope)) == UserType) then
									NoType
								else
									raise (Error ("only user types have attributes"))
		| Open(fp, rw) -> 	if (not (rw = "\"r\"" || rw = "\"w\"" || rw = "\"rw\"")) then
									raise (Error ("second argument to open must be \"r\", \"w\", or \"rw\""))
							else
								FileType
		| Close(e) ->	if ((variable_type (find_variable e env.scope)) == FileType) then
							NoType
						else
							raise (Error ("argument of fclose() must have type File"))
		| FPrint(fp, e) -> 	if ((variable_type (find_variable fp env.scope)) == FileType) then
								NoType
							else
								raise (Error ("first argument of fprintf() must have type File"))
		| FRead(fp) ->	if ((variable_type (find_variable fp env.scope)) == FileType) then
							StringType
						else
							raise (Error ("argument of fread() must have type File"))
		| AddTableCall(f1) ->	if ((variable_type (find_variable f1 env.scope)) != UserType) then
									raise (Error ("the .add() function can only be called on variables of type user_t"))
								else
									NoType
		| GetTableCall(f1, e) ->	if (table_exists f1 env.scope) then
										let env' = { env with in_query = true;
										 			  in_table = f1; } in
										let _ = (List.map (fun x -> check_expr x env') e) in
											UserType
									else
										raise (Error ("the .get() function can only be called on Tables"))
		| TableCall(f1, f2, e) -> NoType (* not used *)
	    | Print(e) -> 	let _ = (List.map (fun x -> check_expr x env) e) in
	    					NoType
	    | Binop(a, op, b) -> (let t1 = (check_expr a env) in
	                         (let t2 = (check_expr b env) in
	                            if(t1=FloatType && t2=IntType) then
	                            	t1
	                            else
	                            	if(t1=IntType && t2=FloatType) then
	                            		t2
	                            	else
	                            		try (check_type t1 t2)
	                            		with Type_mismatch_error(e1, e2) ->
	                            			raise (Error ("operator " ^ (string_of_coral_op op) ^
	                            			" cannot be applied to arguments of type " ^ e1 ^ " and " ^ e2))
	                        ))
	    | Unop(a, uop) -> let t = (variable_type (find_variable a env.scope)) in
	    					if (t = IntType || t = FloatType) then
	    						t
	    					else
	    						raise (Error ("improper operator used on variable " ^ a))
		| Notop(e) -> (check_expr e env)
		| Neg(e) -> (check_expr e env)
		| Pos(e) -> (check_expr e env)
	    | Assign(l, asgn, r) -> if (env.in_query) then
	    							if (attr_exists_in_table l env.in_table env.scope) then
	    								(check_expr r env)
	    							else
	    								raise (Error ("cannot query for attribute " ^ l ^
	    								" because it is not defined in table " ^ env.in_table))
	    						else
	    							(let t1 = (variable_type (find_variable l env.scope)) in
	    							(let t2 = (check_expr r env) in
	    						 	if (t1 == FloatType && t2 == IntType) then
	    						 		t1
	    						 	else
	    						 		try (check_type t1 t2)
	    								with Type_mismatch_error(e1, e2) ->
	    									raise (Error ("cannot assign value of type " ^ e1 ^
	    									" to variable of type " ^ e2))
	    							))
	    | Parens(p) -> (check_expr p env)
	    | Array(id, e) -> 	if ((variable_type (find_variable id env.scope)) == UserType) then
	    						if ((check_expr e env) == IntType) then
	    							UserType
	    						else
	    							raise (Error ("argument to array must be an integer"))
	    					else
	    						raise (Error ("array notation can only be used on user types"))
	    | SizeOf(e) -> 	if ((check_expr e env) == UserType) then
	    					IntType
	    				else
	    					raise (Error ("sizeOf can only be used on a value of type user_t"))
	    | Noexpr -> NoType

	and check_actual formal actual env =
		match formal with
		| Formal(t, n) -> 	try (check_type t (check_expr actual env))
							with Type_mismatch_error(e1, e2) -> 
								raise (Error ("function expected value of type " ^ e1
								^ " as argument but received value of type " ^ e2))

	let rec check_var_decl vdec env =
	    match vdec with
	    | VarDecl(t, v, Noexpr) -> t
	    | VarDecl(t, v, e) -> 	(let t2 = (check_expr e env) in
	    						if (t == FloatType && t2 == IntType) then
	    							t
	    						else 
	    							try (check_type t (check_expr e env))
	    							with Type_mismatch_error(e1, e2) ->
	    								raise (Error ("cannot initialize variable " ^ v ^ " with type " ^
	    								e2 ^ " because it is declared as type " ^ e1))
	    						)
	    | UDecl(ut, tn, v, Noexpr) -> ut
	    | UDecl(ut, tn, v, e) ->	(let t2 = (check_expr e env) in
	    								try (check_type t2 UserType)
	    								with Type_mismatch_error(e1, e2) ->
	    									raise (Error ("cannot initialize variable " ^ v ^
	    									" with type " ^ e2 ^ " because it is declared as type " ^ e1))
	    							)

	let rec sys_check_var_decl vdec env =
		match vdec with
		| VarDecl(t, v, e) -> if (variable_exists v env.scope) then
								raise (Error ("variable " ^ v ^ " already declared"))
							  else
							  	let _ = (check_var_decl vdec env) in
							  	(* no error so add to symbol table *)
							  	let _ = env.scope.variables <- vdec::env.scope.variables in
							  		true
		| UDecl(ut, tn, v, e) ->	if (variable_exists v env.scope) then
										raise (Error ("variable " ^ v ^ " already declared"))
									else
										if (table_exists tn env.scope) then
											let _ = (check_var_decl vdec env) in
											(* no error caught so add to symbol table *)
											let _ = env.scope.variables <- VarDecl(ut, v, e)::env.scope.variables in
												true
										else
											raise (Error ("unable to declare user type for table " ^
											tn ^ " because table does not exist"))

	let rec check_formal f env =
	    match f with
	    | Formal(t, n) ->	if (variable_exists n env.scope) then
	    						raise (Error ("formal parameter with name " ^ n ^ " already declared"))
							else
								(* add formal to symbol table by making a new VarDecl out of it *)
								let _ = env.scope.variables <- VarDecl(t, n, Noexpr)::env.scope.variables in
									true

	let rec is_assign expr =
		match expr with
		| Assign(l, asgn, r) -> raise (Error ("cannot have assignment in loop condition"))
		| _ -> false

	let rec check_stmt s env =
	    match s with
	    | Block(stmts) -> 	let _ = (List.map (fun x -> check_stmt x env) stmts) in NoType
	    | Expr(expr) -> 	(check_expr expr env)
	    | Return(expr) -> 	if (check_expr expr env) == env.ret_type then
	    						env.ret_type
	    					else
	    						raise (Error ("invalid return type"))
	    | If(e, s, Nostmt) -> 	if (not (is_assign e)) then
	    							NoType
	    						else
	    							NoType
	    | If(e, s1, s2) -> 	if (not (is_assign e)) then
	    						NoType
	    					else
	    						NoType
	    | While(expr, stmts) ->	if (not (is_assign expr)) then
	    							NoType
	    						else
	    							NoType
	    | For(expr1, expr2, expr3, stmts) -> 	if (not (is_assign expr2)) then
	    											NoType
	    										else
	    											NoType
	    | ConnectDB -> NoType
	    | CloseDB -> NoType
	    | Nostmt -> NoType

	(* obsolete now that return type tracked in env *)
	let rec get_return fdef stmts env =
		let r_type = fdef.return_type in
		if r_type != VoidType then
			try
				List.find (fun s ->
								match s with
								| Return(expr) -> ((check_expr expr env) = r_type)
								| _ -> false ) stmts
			with Not_found ->
				raise (Error ("function " ^ fdef.fname ^ " declared with return type of " ^
				(string_of_coral_type r_type) ^ " but has no return statement"))
		else
			try
				List.find (fun s ->
								match s with
								| Return(expr) -> raise (Error ("function " ^ fdef.fname ^ " should not have return statement"))
								| _ -> false) stmts
			with Not_found -> Nostmt

	let rec check_fdef fdef env =
		let _ = (List.map (fun x -> check_formal x env) fdef.formals) in
			let _ = (List.map (fun x -> sys_check_var_decl x env) fdef.locals) in
				let _ = (List.map (fun x -> check_stmt x env) fdef.body) in
					(*let _ = (get_return fdef fdef.body env) in*)
						true

	let rec sys_check_fdef fdef env =
		let f_name = fdef.fname in

		if (function_exists f_name env.scope) then
			raise (Error ("function " ^ f_name ^ " redeclared"))
		else
			let scope' = { parent = Some(env.scope);
						   variables = [];
						   functions = [];
						   table_list = [];
						   table_attrs = [] } in

			let env' = { env with scope = scope';
						 ret_type = fdef.return_type } in
			
			let _ = (check_fdef fdef env') in
			(* no error thrown, add function to symbol table *)
			let _ = env.scope.functions <- fdef::env.scope.functions in
				true

	let rec attr_name a =
		match a with
		| AttrLabel(s) -> s

	let rec check_attr attr env = 
		match attr with
		| Attr(l, t) -> let name = (attr_name l) in
						if (attr_exists name env.scope) then
							raise (Error ("redeclaration of attribute " ^ name))
						else
							let _ = env.scope.table_attrs <- (t, name)::env.scope.table_attrs in
								true

	let rec check_key k_dec env =
		match k_dec with
		| PrimaryKey(label) -> 	let name = (attr_name label) in
								if (attr_exists name env.scope) then
									true
								else
									raise (Error ("primary key declared for non-existent attribute " ^ name))
		| _ -> false

	let rec check_table_body tbody env =
		match tbody with
		| TableBody(ag, kd, fd) -> 	let _ = (List.map (fun x -> check_attr x env) ag) in
										let _ = (List.map (fun x -> check_key x env) kd) in
											true

	let rec check_table table env =
		let t_name = (get_table_name table) in

		if (table_exists t_name env.scope) then
			raise (Error ("table " ^ t_name ^ " redeclared"))
		else
			let scope' = { parent = Some(env.scope);
						   variables = [];
						   functions = [];
						   table_list = [];
						   table_attrs = [] } in
			let env' = { env with scope = scope' } in

			let _ = (check_table_body table.tbbody env') in
			(* no error so add table to symbol table *)
			let _ = env.scope.table_list <- table::env.scope.table_list in
				true

	let rec check_table_block tblock env =
		match tblock with
		| TableBlock(tables) -> let _ = (List.map (fun x -> check_table x env) tables) in
									true
		| _ -> false

	let rec check_program (p:program) =

		let global_scope = {
			parent = None;
			variables = [];
			functions = [];
			table_list = [];
			table_attrs = [];
		} in

		let global_env = {
			scope = global_scope;
			ret_type = NoType;
			in_loop = false;
			in_query = false;
			in_table = "";
		} in

	    let _ = (check_conn_block p.conn) in
	    	let _ = check_table_block p.tables global_env in
	    		let _ = (List.map (fun x -> sys_check_var_decl x global_env) p.globals) in
	    			let _ = (List.map (fun x -> sys_check_fdef x global_env) p.funcs) in
	    				true

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
	    | Eql -> "="
	    | Ple -> "+="
	    | Mie -> "-="
	    | Mue -> "*="
	    | Dve -> "/="

	let rec str_of_op o =
	    match o with
	    | Add -> "+"
	    | Sub -> "-"
	    | Mult -> "*"
	    | Div -> "/"
	    | Mod -> "%"
	    | Exp -> "**"
	    | Equal -> "=="
	    | Neq -> "!="
	    | Less -> "<"
	    | Leq -> "<="
	    | Greater -> ">"
	    | Geq -> ">="
	    | Or -> "or"
	    | And -> "and"

	let rec str_of_uop u =
	    match u with
	    | Incr -> "+1"
	    | Decr -> "-1"

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
	    | ForeignKey(al) -> "ForeignKey('" ^ (str_of_attr_label al) ^ "')"

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
	                    (String.concat l
	                        (List.map
	                            (fun x-> "global " ^ (str_of_var_decl x (lvl)))
	                        globals)))
	                    ^ "\n"

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
