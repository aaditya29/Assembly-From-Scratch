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
