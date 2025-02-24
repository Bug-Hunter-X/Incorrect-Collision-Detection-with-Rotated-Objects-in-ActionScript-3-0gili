# ActionScript 3 Collision Detection Bug

This repository demonstrates a common bug in ActionScript 3 collision detection when dealing with rotated objects. The `getBounds()` method, when used naively, doesn't account for object rotation, leading to inaccurate collision results.

## Bug Description

The `checkCollision` function uses `getBounds()` to get the bounding rectangle of two display objects. However, if either object is rotated, `getBounds()` returns the bounding rectangle of the object *before* rotation.  This results in incorrect collision detection.

## Solution

The solution uses the `getRect()` method from the `geom` package (or a similar approach depending on the needed precision) to accurately calculate the bounding rectangle of a rotated object. This correctly accounts for the rotation transformation and provides accurate collision detection.