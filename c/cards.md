---
name: C Flashcards
---

---

Give a local variable a local lifetime.

. . .

`auto`

---

Exit out of a compound statement.

. . .

`break`

---

A branch in a switch statement.

. . .

`case`

---

Character data type.

. . .

`char`

---

Make a variable unmodifiable.

. . .

`const`

---

Continue to the top of a loop.

. . .

`continue`

---

Default branch in a switch statement.

. . .

`default`

---

Start a do-while loop.

. . .

`do`

---

A double floating-point data type.

. . .

`double`

---

An else branch of an if-statement.

. . .

`else`

---

Define a set of int constants.

. . .

`enum`

---

Declare an identifier is defined externally.

. . .

`extern`

---

A floating-point data type.

. . .

`float`

---

Start a for-loop.

. . .

`for`

---

Jump to a label.

. . .

`goto`

---

Start an if-statement.

. . .

`if`

---

An integer data type.

. . .

`int`

---

A long integer data type.

. . .

`long`

---

Declare a variable to be stored in a CPU register.

. . .

`register`

---

Return from a function.

. . .

`return`

---

A short integer data type.

. . .

`short`

---

A signed modifier for integer data types.

. . .

`signed`

---

Determine the size of data.

. . .

`sizeof`

---

Preserve a variable's value after its scope exits.

. . .

`static`

---

Combine variables into a single record.

. . .

`struct`

---

Start a switch-statement.

. . .

`switch`

---

Create a new type.

. . .

`typedef`

---

Start a union statement.

. . .

`union`

---

An unsigned modifier for integer data types.

. . .

`unsigned`

---

Declare a data type empty.

. . .

`void`

---

Declare a variable might be modified elsewhere.

. . .

`volatile`

---

Start a while-loop.

. . .

`while`

---

What is the starting/entry point of a C application?
How does it look?

. . .

The `main` function.

```c
int main() {
  // some code
}
```

Or, more correctly (recent standard):

```c
int main(int argc, char *argv[]) {
  // some code
}
```

---

How is a variable declared?

. . .

`datatype variablename;`

```c
int a;
float b;
double number;
char letter;
```

---

How can the value of a variable be changed/stored?

. . .

Using the equal sign.

```c
int a; // declare only once
a = 1;
a = 2;
```

---

Which function prints to the output screen (stdout)?

. . .

`printf`

```c
printf("Hello World");
```

---

Why declare a function instead of just defining/implementing it?

. . .

The declaration lets the compiler know that the function exists somewhere.

If a function `calc_avg` is implemented below `main`, you can't use
`calc_avg` from `main` because the compiler reads code from top to bottom.
The compiler doesn't know that `calc_avg` exists yet.

The solution is to declare the function at the top, then implement `main`,
then implement `calc_avg`.

```c
// declare first, no implementation
float calc_avg(float values[], int qty);

int main() {
  float input[] = {0.1, 0.2, 0.5, 0.5};
  float avg = calc_avg(input, 4);
  printf("mean: %f\n", avg);
  return 0;
}

// actual implementation
float calc_avg(float values[], int qty) {
  // …
}
```

---

How do I assign a new value to a char array/buffer?

. . .

Use `strcpy(char *dest, char *src)`.
Make sure `dest` has enough space to contain the source string.

```c
char bufArray[251];
char *oriText = "the quick fox";
strcpy(bufArray, oriText);
```

---

What does the following code do?

```c
int x = 7;
int *intPtr;
intPtr = &x;
*intPtr += 2;
printf("one: %d %d", x, *intPtr);
```

. . .

- Line 1: `x` starts with value `7`.
- Lines 2-3: `intPtr` stores the memory address of variable `x`.
- Line 4: The value stored at the memory address pointed to by `intPtr`
  (which is where `x` lives) is incremented by `2`.
  This is equivalent to `x = 7 + 2`, because `*intPtr` is `x`.
- Line 5: Prints the value of `x` (`9`) and the value of the dereferenced
  `intPtr` pointing to `x`, so the same value is printed twice.

Output: `one: 9 9`

---

What are logical conditions? What are the basic operators?

. . .

Logical conditions are mathematical statements that resolve to a single
logical value of true (`1`) or false (`0`).
They are usually used with `if`, `for`, and `while`.

Common operators:

- AND: `&&`
- OR: `||`
- NOT: `!`
- equal: `==`
- not equal: `!=`
- more than: `>`
- less than: `<`
- more than or equal to: `>=`
- less than or equal to: `<=`

Examples:

```c
if (true || false) { … }
if (a == b) { … }
if (a != b) { … }
```

---

What is a struct?

. . .

A struct is a data structure / blueprint that arranges multiple variables
under one parent entity.
The struct members are usually positioned sequentially next to each other
in memory.

For example, you may create a struct called `Person`,
and declare `Name` and `Age` for it.

```c
struct Person {
  char Name[256];
  int Age;
};

struct Person myself; // uses Person as datatype
strcpy(myself.Name, "John");
myself.Age = 31;
```

---

What is a `typedef`?

. . .

A `typedef` allows you to define a synonym for an existing type.
It takes the form:

```c
typedef existing_datatype synonym;
```

Example:

```c
typedef int MyInteger;
typedef struct Person FBProfile;

MyInteger a = 5;

FBProfile guy;
strcpy(guy.Name, "Jack");
guy.Age = 15;
```

---

How do I read a file?

. . .

Include `stdio.h` and call `fopen` with the filename and read (`"r"`) mode
as parameters.
`fopen` returns a pointer to a `FILE` datatype.
Use this pointer to read or write.

Use `fgets` to read a line.
Use `feof` to check if the end of the file has been reached.

```c
FILE *filepointer = fopen("C:\\input.txt", "r");
char tmpBuffer[251];

while (!feof(filepointer)) { // loop while not end-of-file
  // read 250 chars into tmpBuffer, or until a newline or end-of-file
  fgets(tmpBuffer, 250, filepointer);
}

fclose(filepointer); // close the file nicely for other applications
```
