#OCaml Style Sheet#

##File Submission##
***Code Must Compile***
Any code you submit must compile under OCaml without errors or warnings.  If it does not compile, we will not grade it.  That means you will not receive any points for that problem.  There is no excuse for it to not compile.  Never submit anything that you have changed, no matter how small the change, without checking that it still compiles.  You should treat compiler warnings as errors.

##Comments##
***Comments Go Above the Code They Reference***
    
    (* Sums a list of integers *)
    let sum = List.fold_left (+) 0