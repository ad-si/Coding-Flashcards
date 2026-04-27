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

---

What renders your scene and defines how everything is framed?

. . .

`Camera2D` / `Camera3D`

Also defines which nodes should be ignored by using cull masks.

You can only have one camera per viewport.

---

A sun-like 2D light that illuminates the scene globally

. . .

`DirectionalLight2D`

Can create shadows at a given angle for all `LightOccluder2D` nodes.

---

A positional 2D light source.

. . .

`PointLight2D`

Its shape is defined by a 2D texture,
and it usually illuminates and casts shadows
for just the objects that are near it.

---

A scene contiguration node to define detault lighting parameters,

. . .

`WorldEnvironment`

Includes post-processing effects (Glow, Tonemapping, …)
and how to draw the background (solid color or skybox).

---

A sun-like 3D light that illuminates the scene globally
and can create shadows at a given angle.

. . .

`DirectionalLight3D`

---

A positional 3D light source that illuminates close objects in all directions.

. . .

`OmniLight3D`

It typically affects a small sphere around its location, similar to a lightbulb.

---

A physical body that detects collisions but doesn’t move.

. . .

`StaticBody2D` / `StaticBody3D`

It can block other physical objects, so it’s very nice for environment props.

---

A physical body that responds to forces.

. . .

`RigidBody2D` / `RigidBody3D`

Its movement is auto-computed by the engine,
and for example it’s subjected to gravity by default.

---

A trigger zone that can detect other physical bodies
or areas that enter or exit.

. . .

`Area2D` / `Area3D`

---

A physical body that needs to be moved "manually" in your code.

. . .

`CharacterBody2D` / `CharacterBody3D`

It has plenty of built-ins to set up control settings
and it can auto-detect collisions.

---

A util node that defines the physical shape of a Godot body or area node.

. . .

`CollisionShape2D` / `CollisionShape3D`

It is required for any of those physical objects
to actually exist in the physics system!

Although more complex convex or concave colliders based on meshes are possible,
it’s usually more performant to use multiple simpler shapes
(e.g. boxes) to approximate complex geometries.

---

A finite ray that starts at a given position and goes in a given direction
to detect physical objects in the scene on its way.

. . .

`RayCast2D` / `RayCast3D`

It can be useful if a physical object needs to be clicked
or something in front of the player must be detected.

---

A traversable region that agents can use for pathfinding.

. . .

`NavigationRegion2D` / `NavigationRegion3D`

It needs to be baked in the editor or via code
before you can compute a path for your agents.

---

An "intelligent brain" that can compute paths
(based on the reference NavigationRegion node)
while avoiding static and dynamic obstacles.

. . .

`NavigationAgent2D` / `NavigationAgent3D`

---

A container that places children in columns.

. . .

`HBoxContainer`

---

A container that places children in rows.

. . .

`VBoxContainer`

---

A container that places children in a grid.

. . .

`GridContainer`

---

A container that can add padding around
its children (top, right, bottom and/or left).

. . .

`MarginContainer`

---

A container that can be stylized to wrap the children
with a custom background, shadow, border, …

. . .

`PanelContainer`

---

A plain text display.

. . .

`Label`

It can be stylized globally (= all characters at once)
and the content can be aligned in various ways.

---

An interactable element that you can hover,
click, focus or disable.

. . .

`Button`

You can define its style for each of those states,
and it can contain a text and/or an icon.

---

A UI image display.

. . .

`TextureRect`

It can stretch to its bounds in different ways.
(scale, tiling, keep aspect, …)

---

A solid color rectangle display.

. . .

`ColorRect`

It’s always filled with that color -
if you want to make a border, consider using a `Panel` node instead!

---

An additional viewport for a camera to render onto that isn't auto-displayed.

. . .

`SubViewport`

It stores the render buffer but can't show it on its own.

---

A special UI element that can display a `SubViewport` by blitting the render
buffer inside this viewport on the screen like an image.

. . .

`SubViewportContainer`

It will get updated live, as the render in the `SubViewport`'s camera changes.
You can e.g. use this node combo to create a split-screen or a minimap.

---

A set of `Bone2D`s or `Bone3D`s that rigs a 2D/3D model
(you give it a skeleton) and can then be animated over time.

. . .

`Skeleton2D` / `Skeleton3D`

3D animations are fairly common in the world of video games -
they allow you to move and deform your associated mesh in advanced ways
typically to create neat character movement.

2D animation is not as typical.
In Godot, it allows you to create puppet-like anims where each
piece of your 2D model is moved independently
and deforms the associated sprite more or less.

---

A node that can animate virtually any property
on any node in the same scene over time with keyframes, easing, and curves.

. . .

`AnimationPlayer`

---

An advanced animator that can blend or transition between several animations
from an `AnimationPlayer` node.
E.g. using a state machine, 1D/2D mix values, ….

. . .

`AnimationTree`

---

A user-defined curve made of 2D or 3D points.

. . .

`Path2D` / `Path3D`

You can adapt the curvature of the path using in- and out-handles on each point.

---

An anchor that snaps to its parent Path2D or Path3D node and can be placed along
this reference path at an absolute or normalized distance from the start.

. . .

`PathFollow2D/3D`

---

A basic global audio source that emits in the whole scene without any notion of
space or localization.

. . .

`AudioStreamPlayer`

---

A spatialized 2D audio source that is positioned
at a specific (X, Y) 2D location in the scene.

. . .

`AudioStreamPlayer2D`

The volume and pan will thus depend on its position relative to
the current audio listener.

By default, the audio listener in a 2D scene is at the center of the screen
(so, for example, the sound of a spatialized 2D audio source on the left of the
screen will come from the left ear in your headphones).
But you can change this by adding an `AudioListener2D` node in your scene
at a custom position.

---

A spatialized 3D audio source that is positioned
at a specific (X, Y, Z) 3D location in the scene.

. . .

`AudioStreamPlayer3D`

The volume and pan will thus depend on its position
relative to the current audio listener.

By default, the audio listener in a 3D scene is on the active camera.
But you can change this by adding an `AudioListener3D` node in your scene
at a custom position.

---

A particle emitter that can create instances according to parameters
like lifetime, scale, velocity, color, …

. . .

`CPUParticles2D/3D`

It runs on the CPU and therefore not super performant,
but can work on virtually any platform.

---

A particle emitter that runs on the GPU.

. . .

`GPUParticles2D/3D`

This means it is more efficient than on the CPU,
but can't work on all platforms.
In particular, some mobile or web configs might not support this.

---

A basic timer node that can be started and stopped at any time, has a given
runtime and emits a timeout signal when this time has elapsed.

. . .

`Timer`

The timer can be a one-shot (e.g. to delay some action) or repeat endlessly.
