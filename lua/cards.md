---
name: Lua Flashcards
---

---

Value meaning "undefined" or "non existent"

. . .

`nil`

---

Exponentiation (aka power) operator

. . .

`^`

---

modulo operator

. . .

`%`

---

Define a Lua function for $f(x) = x^2 + 3$.

. . .

```lua
function f(x)
  return x^2 + 3
end
```

---

Print the current version of Lua.

. . .

`print(_VERSION)`

---

Print all global variables.

. . .

```lua
for k, v in pairs(_G) do
  print(k, v)
end
```

---

Import a module named `util`.

. . .

`require("util")`

or

`require "util"`

---

When can `()` in function calls be omitted?

. . .

When the function takes a single argument of type string or table.

Thus: `f "str"` or `f {...}` would be valid in that case, etc.

---

How can you get the type of value `v`?

. . .

`type(v)`

---

What kind of strings does Lua use? Why?

. . .

**Interned strings**, because it enables `==` and `~=` to be as fast as
comparing integers (like enums in C) once at least one instance of the string
has been created and saves memory.

---

Place all vararg arguments of a function into a table.

. . .

`{...}`

or

`table.pack(...)`

---

If `v` is an undefined variable, what is its value?

. . .

`nil`

---

Evaluate whether `a` is not equal to `b`.

. . .

`a ~= b`

---

Write 255 in hex.

. . .

`0xFF`

or

`0xff`

---

Evaluate `"10" + 20`.

. . .

`30`

---

Inside a function, how would you set argument `x` to default to `0`?

. . .

`x = x or 0`

or

`if x == nil then x = 0 end`

---

Swap the values of `x` and `y` with each other.

. . .

`x, y = y, x`

---

Generate a random integer between 1 and 2 inclusive.

. . .

`math.random(1, 2)`

---

Generate a random integer between 1 and 10 inclusive
without specifying the lower bound.

. . .

`math.random(10)`

---

Append an element `e` to the end of the array part of table `t`.

. . .

`table.insert(t, e)`

or

`t[#t + 1] = e`

---

Give a workaround for enabling returning from anywhere in a function.

. . .

`do return end`

---

What is `v:func(a, b)` shorthand for?

. . .

`v.func(v, a, b)`

---

What does Lua use for namespaces and modules?

. . .

Tables.

---

Get the amount of time elapsed since the program started.

. . .

`os.clock()`

---

Is Lua duck typed?

. . .

Yes.

No pre-existing relation needs to be specified for "polymorphism" to work.

---

Write a function `makeAdd5` that returns a function
that adds 5 to its input.

. . .

```lua
function makeAdd5()
  return function(n) return n + 5 end
end
```

---

What is the value of `1/2`?

`0` or `0.5`

. . .

`0.5`

---

Print the current date.

. . .

`print(os.date())`

---

`not nil`

. . .

`true`

---

Single-line comment

. . .

```lua
-- This is a single-line comment
```

---

Multi-line comment

. . .

```lua
--[[ This is a
multi-line comment ]]
```

---

Multi-line nested comment

. . .

```lua
--[[ This is a multi-line
[=[ nested comment ]=]. The
number of = is used to emulate nesting. ]]
```

---

Assign `16` to global variable `gv`.

. . .

`gv = 16`

---

General form of "if … else if … else …" branch

. . .

```lua
if condition1() then
  action1()
elseif condition2() then
  action2()
else
  action3()
end
```

---

General form of "repeat until" loop

. . .

```lua
repeat
  action()
until condition()
```

---

Difference between `print` and `io.write`

. . .

`print` inserts tabs between each argument and a newline at the end,
whereas `io.write` only prints exactly what is given to it
(no implicit separators nor newline).

Thus, `print` is more commonly used for debugging,
whereas `io.write` is more commonly used for precise user-facing text output.

---

What value in Lua is closest to C's concept of a null pointer?

. . .

`nil`

---

What value in Lua is the most natural representation of nothingness?

. . .

`nil` probably, and perhaps also `{}` to an extent.

---

Concatenate strings `str1` and `str2`.

. . .

`str1 .. str2`

---

How are boolean literals written?

. . .

`true` or `false`

---

What's another way to write this function?

```lua
function f()
  action()
end
```

. . .

```lua
f = function()
  action()
end
```

---

Does Lua have first-class functions?

. . .

Yes.

Functions can be freely passed around and stored,
just like numbers or other kinds of objects.

---

Assign `x, y, z` to `1, 2, 3` respectively.

. . .

`x, y, z = 1, 2, 3`

---

Does Lua support multiple return values in functions?

. . .

Yes.

Just list them separated by commas after a `return` keyword.

---

```lua
a, b = 1
print(a, b)
```

. . .

```
1    nil
```

---

Does Lua require semicolons at the end of every statement?

. . .

No, but they can be used if desired.

This is seldomly done.

---

Another way of writing `require "ModuleName"`

. . .

`require("ModuleName")`

---

What units do trigonometric functions in the `math` module use?

. . .

Radians.

---

Access the 1st element of array `someArray`.

. . .

`someArray[1]`

---

In what contexts are 1-based indices more natural than 0-based indices?

. . .

Any context dealing with discrete elements, especially when refering to them
naturally as a human would (e.g. counting "first", "second", "third", etc),
will typically fit one-based indices better.

Zero-based indices in contrast fit best when dealing with *offsets* such as
the memory offsets of pointers (pointer arithmetic) and some mathematical
transformations.

---

What kind of data structure are Lua tables?

. . .

Hashmap tables (aka "dictionaries") and/or arrays.

---

Can Lua tables contain values of different types?

. . .

Yes, Lua tables can contain any types mixed together.
Tables are not homogenous.

---

Create a table that uses all forms of key-value syntax inside `{}`.

. . .

```lua
tbl = {
  1,
  b = 2,
  ["c"] = 3,
}
```

General form:

```lua
tbl = {
  expression,
  idName = expression,
  [expression] = expression,
}
```

---

What's another way to write `tbl.fieldName`?

. . .

`tbl["fieldName"]`

---

What is the most general-purpose table access syntax?

. . .

`tbl[expression]`

This is the only table access syntax that allows evaluation of an arbitrary
expression for the key before accessing the corresponding value.

---

What's another way to write `tbl["fieldName"]`?

. . .

`tbl.fieldName`

---

Add a new field to table `tbl` with key `"customType"` and value `"node"`.

. . .

`tbl.customType = "node"`

or

`tbl["customType"] = "node"`

---

What kinds of Lua values can be used as table keys?

. . .

Any value except `nil`.

---

What kinds of Lua values can be used as table element *values*?

("values" as in the value associated with each key-value pair)

. . .

Any value except `nil`.

---

What types of keys can be associated with the array part of a table?

. . .

Integer keys that are `>= 1`.

---

How can you emulate pointers (like from C) but directly in Lua code?

For example, how could you pass `x` to a function and have `x`'s value
persistently changed by that function?

. . .

Wrap the value that you want to be changeable (i.e. that you want to point to)
in a table and then access it with `[1]`.

For example:

```lua
function setZero(ptr)
  ptr[1] = 0
end

x = {6}
setZero(x)
assert(x[1] == 0)
```

---

Iterator for just the array part of table `tbl`

. . .

`ipairs(tbl)`

---

Iterator for all key-value pairs in table `tbl`

. . .

`pairs(tbl)`

---

List all 8 types in Lua 5.1.

. . .

- nil
- boolean
- number
- string
- table
- function
- thread
- userdata

---

Use metatables to overload the behavior of two tables `a` and `b`
such that `a + b` always returns 0.

. . .

```lua
ZeroAdd = {}
function ZeroAdd.__add(a, b)
  return 0
end

a = {}
b = {}

setmetatable(a, ZeroAdd)
setmetatable(b, ZeroAdd)

print(a + b)
-- Same as `print(ZeroAdd.__add(a, b))`
-- prints 0
```

---

`print(1)`

. . .

`1`

---

`print(0)`

. . .

`0`

---

`print({})`

. . .

This prints something like:

`table: 0xdeadbeef`

In otherwords, it prints the memory address of the table pointer
(unless this is actually some kind of integer id index and not a direct
memory address... not sure).

---

`print(coroutine.create(function() end))`

. . .

`thread: 0xdeadbeef`

---

`print(6.28)`

. . .

`6.28`

---

In a function declared using `:` method shorthand notation,
how do you refer to the table that is implicitly passed in as the first
argument?

. . .

Use the implicitly defined `self` variable inside the function.

(`self` is passed in as the first parameter/argument but isn't
visible in the declaration.)

---

Does Lua have compound assignment operators?

(e.g. `+=, -=, *=, /=`)

. . .

No.

Thus, you must write `a = a + b` instead of `a += b` for example.

---

Is Lua's "OOP" model class-based or prototype-based?

. . .

Prototype-based.

---

How are multiple levels of "inheritance" implemented in Lua?

. . .

Create multiple tables, each of which has its metatable set to its intended
parent table, thus creating the intended inheritance chain.

Note that `__index` must also be set for each inheritable table,
unless you only want to implement *operator overloading*
(and not any other kind of parent field access)
in all of the "classes" in the "inheritance" chain.

---

How fast is Lua compared to other dynamically typed
interpreted/"scripting" languages?

. . .

Very fast and very small too.
It is one of the most efficient embeddable programming languages,
especially if you use LuaJIT.

---

What's the difference between `require` and `dofile`?

. . .

Both load Lua files, but whereas `require` only runs the file the first time
the file is loaded by Lua, the `dofile` command always runs all of the code
in the file regardless of whether the file has been loaded before by Lua.

Generally, `require` is used for modules whereas `dofile` is used for running
arbitrary code from a file (such as for reloadable user-created scripts and
data files that may change after program startup for example).

---

What are the three forms of string literals?

. . .

Single quoted, double quoted, and long/raw/multi-line strings:

```lua
'single quoted'
"double quoted"
[[long/raw string that can
span multiple lines]]
```

---

What does this print?

```lua
--------------------
-- ModuleName.lua --
--------------------
print "ModuleName has loaded."
```

```lua
------------------
-- UserFile.lua --
------------------
local a = require "ModuleName"
local b = require "ModuleName"
```

. . .

`ModuleName has loaded.`

(The text is only printed once.)

---

What does this print?

```lua
--------------------
-- ModuleName.lua --
--------------------
print "ModuleName has loaded."
```

```lua
------------------
-- UserFile.lua --
------------------
local a = dofile "ModuleName"
local b = dofile "ModuleName"
```

. . .

```
ModuleName has loaded.
ModuleName has loaded.
```

(The text is printed twice.)

---

What does `loadstring` do?

. . .

`loadstring` takes an arbitrary chunk of Lua code contained in a string
and returns it as a reusable function.

The code is processed as if the code is in a separate file in the global
namespace and thus the code won't see variables local to the `loadstring`
call's context/environment unless you make that happen explicitly.

Reusing the returned function is much more efficient than loading the code
repeatedly, due to redundant preprocessing/compilation.

`loadstring` is expensive (like all code loading functions).

---

List the 8 standard library tables
(and optionally their purposes too).

. . .

```lua
coroutine  -- resumable function returns
package    -- advanced module management
string     -- text manipulation
table      -- array manipulation (not hash)
math       -- mathematics and random numbers
io         -- console and file reading/writing
os         -- time, OS commands, adv. file manip.
debug      -- Lua introspection, rule breaking
-- There's also the "basic" module for built-ins,
-- but there's no corresponding named table.
```

---

What is the type string that represents a coroutine?

. . .

`"thread"`

(Having it be "coroutine" would make more sense,
considering that Lua coroutines are not true parallel threads
and don't run in parallel.
Coroutines just make it easier to write code that has "parallel logic"
but in a single-threaded context that has much less cost per thread
than true OS threads do.)

---

```lua
tbl = {}
tbl[0] = "something"
print(#tbl)
```

. . .

`0`

Lua indices start at 1 and thus an element placed at index 0
will be placed in the hash part of the table, not the array part.

---

Does a multi-return function call always expand to all its return values?

. . .

No. In many contexts a multi-return function call returns only the first
value.

Multi-return function calls typically can only expand fully
(i.e. return all values) when located at the "end" of an expression.

---

Which is the correct "not equal" operator?

`!=`    or    `~=`

. . .

`~=`

---

Do Lua boolean logic operators do short circuiting?

. . .

Yes, the condition expressions stop being evaluated as soon as possible
(reading from left to right).

This is especially useful for checking references for `nil`
before accessing their fields or calling them in later conditions
in a condition expression.

---

Does the `not` operator always return a boolean?

. . .

Yes.

Unlike `and` and `or`, the `not` operator has no reason to return some other
object and it's also not clear what non-boolean value it could or should
return.

---

What types support the `#` operator?

. . .

Tables and strings.

---

Does applying `#` to a string return the number of Unicode characters
or the number of bytes?

. . .

The number of bytes.

---

How do holes (`nil` values) in the "array" part of a table influence `#`?

. . .

Such holes will result in "unexpected" array length values.

If an array contains keys or values that are `nil`, then at some point the
keys/values will no longer be a part of the real array and won't be considered
part of the length. Thus, in your program you can't treat arrays as if they
allow holes. Doing so results in logical errors.

---

Can non-OOP functions in Lua use the `:` method syntax notation?

. . .

Yes.

`:` can be used on functions that are not "classes" or "class-derived"
objects.

However, the `:` method syntax implies that the function is a member of a
table and is accessed that way. Thus, you should account for the potential
costs of storing a function pointer on the associated table. In contrast,
a normal independent function doesn't require itself to be added to any
tables of its arguments.

Also, Uniform Function Call Syntax (UFCS) in contrast doesn't have this
weakness, but Lua doesn't have UFCS.

---

When can the `()` of a function call be omitted?

. . .

When the function's arguments consist of exactly one string
or exactly one table.

This is very useful for shorthand and also plays a big role in making Lua
feel good when used as a makeshift data file format.

It can also be useful for creating string-based DSLs and emulating named
arguments by sending a table to a function instead of an argument list.

---

```lua
for iterVar = start, end, step do
  action()
end
```

How many times are `start`, `end`, and `step` evaluated during the loop?

. . .

All of them are evaluated just once, before the loop begins.

---

Alternative way to write `#str`

. . .

`str:len()`

or

`string.len(str)`

---

What capitalization convention does Lua's standard library use?

. . .

slurredlowercase

(in contrast to camelCase, PascalCase, snake_case, etc)

Many user libraries use different conventions though, for better readability.

---

Is Lua "class based" or "object based"?

. . .

Object based.

---

If a metatable changes later on,
do the changes still influence its children tables' behaviors?

. . .

Yes (when the use of the child table requires accessing its metatable).

("Class"-like relationships in Lua are just a convention and not a rigid
blueprint. Any Lua table can change. Parent/meta tables aren't any different
in that respect.)

---

Do metatables create true new types in Lua?

. . .

No. Only the built-in types are truly distinct types in Lua.

However, you can emulate whatever type system you want by adding corresponding
data and functions to do so.

For example, you could have a `customType` field on your objects' tables
that is set to a string indicating which custom type each object is.

Alternatively, you could store objects of a specific type always in a
specific table, so that type membership is implicit in that and hence
has no per object waste.

(String comparison isn't a huge performance problem. Comparing strings
using `==` and `~=` has the same performance overhead as simple integer
comparisons, due to interned strings.)

---

What C function is most similar to Lua's `os.date` function?

. . .

`strftime`

---

What is used to create "multiple entry" functions in Lua?

. . .

Coroutines.

---

How can semicolons improve readability of Lua code?

. . .

Semicolons are interchangeable with commas in table element lists,
and thus semicolons can be used to visually separate groups of table elements
(e.g. rows of a matrix).
