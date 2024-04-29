# How to Use ARM64 Assembly on Mac M1

> Here we would create a hello world application in ARM assembly for Apple silicon.

## Step 1:

We're going to make sure that we have xcode or command line tools installed on our machine.

```Shell
xcode-select --install
```

## Step 2:

Before we start writing some assembly code what we're going to do is create that exact same hello world application in C. The reason we're going to do it in C is because it's very close to the assembly and therefore the concepts that we're going to introduce as we write back code is going to be easier to translate if we understand what's happening in C first.

```Shell
touch hello.c
code .

```

And now we write a hello world program in C

```C
#include <stdio.h>

int main() {
    printf("Hello, World!\n");
    return 0;
}

```

If we want to compile this we can do this in multiple ways. If we want to use GCC then we can install that by doing

```Shell
brew install GCC
```

And then compile

```Shell
gcc hello.c -o hello
```

Where -o means that it's going to create an output file and that output file is going to be the same name of our executable so in this case it's going to be hello.<br>
Now we run it:

```Shell
./hello
```

Alternatively we can use the CLang too:

```Shell
clang hello.c -o hello
ls
./hello
```

Now we have the C compiler which can be clang or GCC and what it's going to do is actually compile our underline files hello.c and then it's going to do that compilation and then it's going to create what's known as an intermediate object file.

We need to be able to link inbuilt system libraries together and that's where a Linker comes in place. The Linker is gonna take any libraries that we need to link them together so that when we're referencing any sort of global or external functions and it's going to build together and then we're going to have that outputted executable.<br>
So if we didn't have this sort of linking step in between we wouldn't know where those system libraries are and we won't be able to use this sort of standard uh Linux output calls or Unix output calls.

In order to generate that object file we will do following steps:

```Shell
clang hello.c -c -o hello.o
```

$WHERE$

- `clang` is invoked to compile the hello.c source file.
- The -c option tells clang to generate an object file (hello.o) from hello.c.
- The -o hello.o option specifies that the output object file should be named hello.o.
