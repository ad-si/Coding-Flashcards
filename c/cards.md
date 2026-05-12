---
name: C Flashcards
---

---

Infer a variable's type from its initializer (C23).
Previously a no-op storage-class specifier for automatic lifetime.

. . .

`auto`

```c
auto x = 5;       // C23: x is int
auto y = 3.14;    // C23: y is double
```

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

Hint that a variable should be stored in a CPU register.
Vestigial: modern compilers ignore this and decide register allocation
themselves. Its only remaining effect is forbidding `&` on the variable.

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
int main(void) {
  // some code
}
```

Or, when accepting command-line arguments:

```c
int main(int argc, char *argv[]) {
  // some code
}
```

Note: write `(void)` rather than `()` for the no-argument form.
In C17 and earlier, `()` means "unspecified parameters", not "no
parameters". C23 finally makes them equivalent, but `(void)` is portable
across all standards.

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

For integers where the exact width matters, prefer the fixed-width
types from `<stdint.h>` (covered in a later card).

---

When should I use `<stdint.h>` types like `int32_t` instead of `int` / `long`?

. . .

The plain types (`int`, `long`, `long long`) have implementation-defined
widths. On most 64-bit Unix systems `long` is 64 bits; on 64-bit Windows
it's 32 bits. Use the fixed-width types when that difference matters:

- Binary protocols, file formats, wire formats
- Hardware registers, memory-mapped I/O
- Hashing, checksums, anywhere overflow semantics depend on exact width
- Cross-platform code that must behave identically everywhere

```c
#include <stdint.h>

int32_t  signed_32bit;
uint64_t unsigned_64bit;

// "at least N bits" — smallest type with ≥ N bits
int_least16_t at_least_16;

// "fastest type with ≥ N bits" — often wider than asked, picked for speed
int_fast32_t fast_counter;
```

Don't reach for them for ordinary loop counters or arithmetic — plain
`int` is idiomatic and matches stdlib APIs. Overusing `uint32_t` is
noise; using it for an array index on a 64-bit system is worse than
`size_t` because it forces a truncation.

---

What type should I use for sizes, array indices, and the result of `sizeof`?

. . .

`size_t` (from `<stddef.h>`, also pulled in by `<stdio.h>`, `<stdlib.h>`,
`<string.h>`). It's an unsigned type wide enough to represent the size
of any object the platform supports — 32 bits on 32-bit systems, 64 bits
on 64-bit systems.

```c
#include <stddef.h>
#include <string.h>

size_t len = strlen("hello");   // strlen returns size_t
size_t n = sizeof(int);         // sizeof yields size_t

int arr[100];
for (size_t i = 0; i < sizeof(arr) / sizeof(arr[0]); i++) {
  arr[i] = 0;
}
```

Related:

- `ptrdiff_t` — signed type for the difference between two pointers
- `ssize_t` — POSIX signed counterpart to `size_t` (e.g. `read`, `write`
  return values)

Don't substitute `int`, `unsigned`, or `uint64_t` here — APIs like
`strlen`, `memcpy`, `fread` already use `size_t`, and mismatches cause
warnings or silent truncation.

---

How do I `printf` / `scanf` a fixed-width integer type portably?

. . .

You can't hardcode `%d` or `%lld` — the right specifier depends on
what `int64_t` actually maps to on the target platform.

`<inttypes.h>` provides format-string macros: `PRI` for printf, `SCN`
for scanf, followed by the conversion letter (`d`, `i`, `u`, `x`, `o`)
and the width.

```c
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>

int64_t  big   = 1234567890123;
uint32_t small = 42;

printf("big = %" PRId64 ", small = %" PRIu32 "\n", big, small);

uint64_t parsed;
scanf("%" SCNu64, &parsed);
```

The macros are string literals, so adjacent-string-literal concatenation
glues them into the format string at compile time. Common ones:

- `PRId32`, `PRIu32`, `PRIx64`, `PRIo16`
- `SCNd32`, `SCNu64`

Including `<inttypes.h>` also includes `<stdint.h>`, so you don't need
both.

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
printf("Hello World\n");
```

Include the trailing `\n` — without it, output may not be flushed
before the program exits (stdout is line-buffered when attached to a
terminal).

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

Prefer a bounded copy. `strcpy` doesn't check that `dest` has enough
space and is a frequent source of buffer overflows — static analyzers
and security guidelines (CERT, MISRA) flag unchecked uses.

Safer options:

```c
char bufArray[256];
const char *oriText = "the quick fox";

// snprintf is portable and always null-terminates:
snprintf(bufArray, sizeof(bufArray), "%s", oriText);

// strlcpy (BSD, glibc 2.38+) also truncates safely:
strlcpy(bufArray, oriText, sizeof(bufArray));
```

Avoid `strncpy` for this — it doesn't guarantee null-termination
and pads with zeros up to the size limit.

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
#include <stdbool.h>  // needed for true/false/bool pre-C23
                      // (C23 makes them keywords)

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
snprintf(myself.Name, sizeof(myself.Name), "%s", "John");
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
snprintf(guy.Name, sizeof(guy.Name), "%s", "Jack");
guy.Age = 15;
```

---

How do I read a file?

. . .

Include `stdio.h` and call `fopen` with the filename and read (`"r"`) mode
as parameters.
`fopen` returns a pointer to a `FILE` datatype, or `NULL` on failure.

Loop on the return value of `fgets` — don't loop on `!feof(...)`.
`feof` only becomes true *after* a failed read, so `while (!feof(fp))`
runs the body one extra time with stale data. Checking `fgets` directly
handles both EOF and read errors.

```c
FILE *filepointer = fopen("/tmp/input.txt", "r");
if (filepointer == NULL) {
  perror("fopen");
  return 1;
}

char tmpBuffer[256];

// fgets returns NULL on EOF or error
while (fgets(tmpBuffer, sizeof(tmpBuffer), filepointer) != NULL) {
  // process tmpBuffer
}

fclose(filepointer); // close the file nicely for other applications
```
