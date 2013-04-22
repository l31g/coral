CORaL
=====

Here's version 0.2.

Stuff is starting to look more and more pro. Basically, I've wanted to mask the fact that our code translates to Python and made it even more C like.

Here's how it works:

1. Build the compiler:

    make coralc

2. The compiler is now in build/coralc. Run the following test:

    .build/coralc ../test/hello_world.cl

3. This outputs a hello_world.clx executable. (Open up the source and see that its Python...YAY)

4. To execute, like C, do:

    ./hello_world.clx
