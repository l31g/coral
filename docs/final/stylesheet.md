#OCaml Style Sheet#

##File Submission##
***Code Must Compile***
Any code you submit must compile under OCaml without errors or warnings. 

##Comments##
***Comments Go Above the Code They Reference***
    
    (* Sums a list of integers *)
    let sum = List.fold_left (+) 0

***Avoid Useless Comments***
Avoid comments that merely repeat the code they reference or state the obvious.  

##Naming and Declarations##
***Naming Conventions***
 The best way to tell at a glance something about the type of a variable is if there is a naming convention. The following is the naming convention we chose to follow:

Variables: Symbolic or initial lower case. Spaces between characters use `_`. 

* Example: `str_of_program`

***Use Meaningful Names***
Another way of conveying information is to use meaningful variable names that reflect their intended use.  Choose words or combinations of words describing the value.  Variable names may be one letter in short let blocks.

##Indenting##
***Long expressions***
Expressions that are over the line limit can be broken up and the parts aligned as in the following example:

    let x = "Long line..." ^
            "Long line #2"

***Match expressions***
These should be indented as follows:
    
    match expr with
    pattern1 -> ...
    | pattern2 -> ...

##Pattern Matching##
***No Incomplete Pattern Matches***
Incomplete pattern matches are flagged with compiler warnings. Thus, if your program exhibits this behavior, please fix it before committing.



*Source:* 
[Cornell OCaml Style Guide](http://www.cs.cornell.edu/courses/cs3110/2008fa/handouts/style.htm)