---
name: Godot and GDScript Flashcards
---

---

Which keyword is used for variables?

. . .

The `var` keyword.

```gdscript
var health = 100
```

---

Which keyword is used for constants?

. . .

The `const` keyword.

```gdscript
const INITIAL_HEIGHT = "300"
```

---

What's the relationship between classes and files?

. . .

Each file is implicitly a class.

An optional class name can be added to the file like this:

```gdscript
class_name MyClass
```

---


What are the main data types in GDScript?

. . .

- `bool` (`true` / `false`)
- `int` (whole numbers stored as 64-bit integers)
- `float` (decimal numbers stored as 64-bit floats)
- `String` (text)
- `enum`
- Arrays
- Dictionaries

---

How do you write single-line comments in GDScript?

. . .

```gdscript
# With a single hash symbol
# at the beginning of the line
```

---

How do you write multi-line comments in GDScript?

. . .

```gdscript
"""
Multi-line comments
are written
With triple quoted strings
"""
```

---

How do you write documentation comments in GDScript?

. . .

```gdscript
## By using two hash symbols
```

---

How do you write arrays in GDScript?
What features do they have?

. . .

```gdscript
var user = ["john", 175, true]
```

- Can store multiple values of different types
- Indexed starting from `0`
- Can be resized dynamically

---

How do you only store one type of value in an array?

. . .

By using packed arrays:

```gdscript
var fruits = PackedStringArray(["apple", "banana", "cherry"])
```

---

How do you write dictionaries (aka maps) in GDScript?

. . .

```gdscript
var person = {
  "name" : "John",
  "size" : 175,
}
```

---

Define a data type to store a player's t-shirt size.

. . .

```gdscript
enum TShirtSize {
    SMALL,
    MEDIUM,
    LARGE
}
```

---

Write code to print some text depending on a player's t-shirt size.

. . .

```gdscript
match t_shirt_size:
    TShirtSize.SMALL:
        print("A small shirt")
    TShirtSize.MEDIUM:
        print("A medium shirt")
    _:
        print("Too large")
```

---

Which Vector data types are available in GDScript?

. . .

- `Vector2(3, 4)` (2D vector)
- `Vector3(3, 4, 2)` (3D vector)

---

Write a class constructor that prints a message when a new object is created.

. . .

```gdscript
func _init():
    print("A new object was created")
```

---

What does the `print()` function do?

. . .

It displays text or values in the Godot editor's output console.

---

Explain the if statement.

. . .

Used for decision-making. Code inside an if block runs only if a certain condition is true.

---

What's the syntax for an `if` statement?

. . .

```gdscript
if condition:
    # Code to run if condition is true
elif another_condition:
    # Code to run if another_condition is true
else:
    # Code to run if none of the above conditions are true
```

---

How do you create a loop with the `for` keyword?

. . .


```gdscript
for i in range(5):
    print(i)
```

---

What's the syntax for `while` loops?

. . .

```gdscript
while condition:
    # Code to run while condition is true
```

---

What's the `return` keyword used for?

. . .

To send a value back from a function when it finishes running.

---

Define a function `add2` that adds two numbers together.

. . .

```gdscript
func add2(a: int, b: int) -> int:
    return a + b
```

---

What is the `extends` keyword for?

. . .

It is used for inheritance.
It lets a script gain properties and behavior
from a parent class/script.

---

How do you create a custom signal in GDScript?

. . .


Use `signal my_signal` inside a script to define a new signal.

---


Which function is automatically called when a node
and its children enters the scene tree?

. . .

The `_ready()` function?

```gdscript
func _ready():
  # Do stuff when the node enters the scene tree
  pass
```

---

Which function is called when an object gets initialized?

. . .

The `_init` function.
This is also called the object's constructor.

```gdscript
func _init():
  # Initialize object's internal stuff here
  pass
```

---

Which function is called once per frame?

. . .

The `_process()` function.

```gdscript
func _process(delta):
  # Do stuff every frame
  pass
```

---

Which function is called once per physics frame with a constant time delta?

. . .

```gdscript
func _physics_process(delta):
  # Simple movement using vector addition and multiplication.
  var direction = Vector2.RIGHT
  var speed = 100.0
  self.global_position += direction * speed * delta
```

---

Explain the `yield()` keyword.

. . .


It pauses a function temporaril.
It's used with signals or special Godot functions.

---

What is `onready var`?

. . .

It declares a variable and automatically assigns it a node within the scene
when the scene is ready.

---

How do you access a node in your scene tree from code?

. . .

Using `get_node()` and providing the path to the node.

---

What's the difference between `$NodePath` and `get_node("NodePath")`?

. . .

`$NodePath` is faster and safer,
but changes to the scene structure would need code editing.

---

How do you make variables visible in the Godot editor?

. . .

By using the `export` keyword.

```gdscript
@export var height: float
```

---

How do you define a inner class in GDScript?

. . .

```gdscript
class InnerClass:
  extends Object

  func hello():
    print("Hello from inner class!")
```

---

What is the fundamental unit of a scene in Godot?

. . .

A `Node`.

---

How do you explicitly define types in GDScript?

. . .

```gdscript
var x: int = 3
const y: float = 4.2
var z := 1.0  # Infer type based on default value
var nums: Array[int] = [1, 2, 3]

enum Color { RED, GREEN, BLUE }
var c: Color = Color.RED

func add2(n1: int, n2: int) -> int:
  return n1 + n2
```

---

What is Godot's base building block?

. . .

`Node`

It can be nested in other Nodes to create a tree, or hierarchy.
Those trees are called scenes, and they can be instantiated in bigger scenes
to make up your entire Godot game.

---

What is the simplest 2D object in Godot?

. . .

`Node2D`

It supports 2D transform, a Z-index, and basic visibility settings, but no real display.
All other 2D nodes inherit from it.

---

What is the base UI element?

. . .

`Control`

It has a 2D transform, but you can auto-set its bounds and position
using anchors for responsive UI design.
All other UI nodes inherit from it.

---

What is the simplest 3D object in Godot?

. . .

`Node3D`

It supports 3D transform and basic visibility settings, but no actual display.
All other 3D nodes inherit from it.

---

A simple 2D image display.

. . .

`Sprite2D`

It can use several kinds of texture resources.
E.g. basic image, atlas region, single spritesheet frame, …

---

A frame-by-frame 2D animation display.

. . .

`AnimatedSprite2D`

It uses a `SpriteFrames` resource and can hold multiple anims
that each have a series of images and a FPS rate to control the speed.

---

A closed shape defined by a set of points

. . .

`Polygon2D`

Can be filled with colors or textures.

---

A 3D primitive mesh or custom model display.

. . .

`MeshInstance3D`

It uses a `Mesh` resource to know what geometry to render.
This resource can be shared between multiple `MeshInstance3D` nodes.

Although when you want to show the same mesh thousands of times,
consider using a `MultiMeshInstance3D` instead.

---

A grid-based map of small 2D sprites

. . .

`TileMap`

From a `TileSet` resource.
Useful for designing 2D levels quickly.

---

A 3D grid-based map of small 3D blocks.

. . .

`GridMap`

It's similar to a `TileMap`, but in 3D.
It can be a good way to design 3D levels quickly.
