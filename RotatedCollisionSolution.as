import flash.display.DisplayObject;
import flash.geom.Rectangle;
import flash.geom.Matrix;

function checkCollision(obj1:DisplayObject, obj2:DisplayObject):Boolean {
  var rect1:Rectangle = getRect(obj1);
  var rect2:Rectangle = getRect(obj2);

  return rect1.intersects(rect2);
}

function getRect(obj:DisplayObject):Rectangle {
  var bounds:Rectangle = obj.getBounds(obj.parent);
  var matrix:Matrix = obj.transform.matrix;
  var points:Array = [
    new Point(bounds.x, bounds.y),
    new Point(bounds.x + bounds.width, bounds.y),
    new Point(bounds.x + bounds.width, bounds.y + bounds.height),
    new Point(bounds.x, bounds.y + bounds.height)
  ];
  for each (var p:Point in points) {
    var p2:Point = matrix.transformPoint(p);
  }
  // Find min/max of transformed points to get real bounds after rotation.
  //Implementation of finding min/max of transformed points is omitted for brevity
  //A more efficient way would be to use a rotated rectangle calculation library
  //Or use a different collision detection method.
  return new Rectangle(0,0,100,100); //Replace with min/max calculation
}