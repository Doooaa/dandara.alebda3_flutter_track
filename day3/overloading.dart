class Point {
  int x, y;

  Point(this.x, this.y);

  Point operator +(Point other) {
    return Point(this.x + other.x, this.y + other.y);
  }
  Point operator -(Point other) {
    return Point(x - other.x, y - other.y);
  }
}

void main() {
  Point p1 = Point(2, 3);
  Point p2 = Point(4, 5);
  Point result = p1 + p2;
  Point result2 = p1 - p2;

  print(result.x); // Output: 6
  print(result.y); // Output: 8
  print(result2.x); // Output: 6
  print(result2.y); // Output: 8
}