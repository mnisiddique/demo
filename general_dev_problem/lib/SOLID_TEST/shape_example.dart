abstract class Shape {
  int getArea();
}

class Rectangle extends Shape {
  final int _height;
  final int _width;

  Rectangle({required int height, required int width})
      : _height = height,
        _width = width;
  @override
  int getArea() {
    return _height * _width;
  }
}

class Square extends Rectangle {
  final int side;
  Square({
    required this.side,
  }) : super(height: side, width: side);

  @override
  int getArea() {
    return side * side;
  }
}

void printArea(Shape shape) {
  // ignore: avoid_print
  print("${shape.runtimeType}'s area: ${shape.getArea()}");
}

void main() {
  Shape rect = Rectangle(height: 10, width: 20);
  Shape square = Square(side: 52);

  printArea(rect);
  printArea(square);
}

// To run this file
// dart run shape_example.dart