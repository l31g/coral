# Team CORaL OCaml Style Sheet #

## Pushing to git ##
	
** Do not break the git repo **

The first rule about contributing to the git repo is that you do not break the git repo. All code must compile, and any prior functionality that was modified must be tested again before the changes can be committed.

** Avoid merging when possible **
	
Always pull before you commit. If there are conflicts, resolve them quickly and push your code. If you are going to work on a different branch, alert the other team members before you do.

## Comments ##

** Place comments above the line that they refer to **

	(* sum a list of integers *)
	let sum = List.fold_left (+) 0

** In matching cases, they may be placed to the left of the case **

	Match a with
	| SomeCase(x, y) -> (check_something x) (* checks in this case *)
	| OtherCase(x) -> (check_something_else x) (* checks another case *)

** Avoid useless comments **

Don't comment something unless it is performing a function that is not immediately apparent. Do more than simply stating the obvious.

## Naming conventions ##

** Function and variable names **

Use lower case for the first character in a variable name. If a name is composed of multiple words, use underscores, not camelcase, for example:

	str_of_program

** Use meaningful names **

Longer names that make the value's meaning readily apparent are preferable to shorter names. 

## Indenting ##

** Long expressions **

Break them up using newlines and indents to keep them around 80 characters, in the following manner

	let x = "long line " ^
			"is very long"

** Matching expressions **

Should be indented with a new case on each line, as follows:

	match an_expr with
	| Case(y) -> ...
	| DifferentCase(m) -> ...

## Pattern matching ##

** Do not leave any unmatched cases **

The Ocaml compiler will warn you, so once it does, go back and add them in. If you don't know what to do, flag it with a TODO comment.


* Style guide adapted from *
[Cornell OCaml Style Guide](http://www.cs.cornell.edu/courses/cs3110/2008fa/handouts/style.htm)