import 'dart:math';

class Point {
  num x; // Declare instance variable x, initially null.
  num y; // Declare y, initially null.
  num z = 0; // Declare z, initially 0.
  num distanceFromOrigin;

  // Point():this.origin();

  // Point(num x, num y) {
  //   // There's a better way to do this, stay tuned.
  //   this.x = x;
  //   this.y = y;
  // }

  Point(this.x, this.y) : distanceFromOrigin = sqrt(x * x + y * y);

  Point.origin() {
    // this 只能放在构造函数列表
    x = 0;
    y = 0;
  }

  Point.NaN() : this(num.parse('NaN'), num.parse('NaN'));

  // Delegates to the main constructor.
  Point.alongXAxis(num x) : this(x, 0);

  num distanceTo(Point other) {
    var dx = x - other.x;
    var dy = y - other.y;
    return sqrt(dx * dx + dy * dy);
  }

  static num distanceBetween(Point a, Point b) {
    var dx = a.x - b.x;
    var dy = a.y - b.y;
    return sqrt(dx * dx + dy * dy);
  }
}

class ImmutablePoint {
  static final ImmutablePoint origin = const ImmutablePoint(0, 0);

  final num x, y;

  const ImmutablePoint(this.x, this.y);
}

class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}

void f() {}

class Rectangle {
  num left, top, width, height;

  Rectangle(this.left, this.top, this.width, this.height);

  // Define two calculated properties: right and bottom.
  num get right => left + width;
  set right(num value) => left = value - width;
  num get bottom => top + height;
  set bottom(num value) => top = value - height;
}

abstract class Doer {
  // Define instance variables and methods...

  void doSomething(); // Define an abstract method.
}

class EffectiveDoer extends Doer {
  @override
  void doSomething() {
    // Provide an implementation, so the method is not abstract here...
  }
}

// A person. The implicit interface contains greet().
class Person1 {
  // In the interface, but visible only in this library.
  final _name;

  // Not in the interface, since this is a constructor.
  Person1(this._name);

  // In the interface.
  String greet(String who) => 'Hello, $who. I am $_name.';
}

// An implementation of the Person interface.
class Impostor implements Person1 {
  get _name => '';

  String greet(String who) => 'Hi $who. Do you know who I am?';
}

String greetBob(Person1 person) => person.greet('Bob');

class Vector {
  final int x, y;

  Vector(this.x, this.y);

  Vector operator +(Vector v) => Vector(x + v.x, y + v.y);
  Vector operator -(Vector v) => Vector(x - v.x, y - v.y);

  bool operator ==(v) => v is Vector && x == v.x && y == v.y;
  // Operator == and hashCode not shown. For details, see note below.
  // ···
}

class AA {
  // Unless you override noSuchMethod, using a
  // non-existent member results in a NoSuchMethodError.
  @override
  void noSuchMethod(Invocation invocation) {
    print('You tried to use a non-existent member: ' +
        '${invocation.memberName}');
  }
}

enum Color { red, green, blue }

abstract class Super {
  void method() {
    print("Super");
  }
}

class MySuper implements Super {
  void method() {
    print("MySuper");
  }
}

mixin Mixin on Super {
  void method() {
    super.method();
    print("Sub");
  }
}

class Client extends MySuper with Mixin {}

abstract class P {
  void method() {
    print("P");
  }
}

class C extends P {
  void method() {
    super.method();
    print("C");
  }
}

mixin A on P {
  void method() {
    super.method();
    print("A");
  }
}

mixin B on P {
  void method() {
    super.method();
    print("B");
  }
}

class AB extends C with A, B {
} //相当于 AB extends (B extends (A extends (C extends P)))

class BA extends C with B, A {
} //相当于 BA extends (A extends (B extends (C extends P)))

class Queue {
  static const initialCapacity = 16;
  // ···
}

class WannabeFunction {
  call(String a, String b, String c) => '$a $b $c!';
}

testClass() {
  var point = Point(0, 9);
  point.x = 4; // Use the setter method for x.
  print(Point.origin());

  var constPoint = ImmutablePoint(1, 1);
  var a = const ImmutablePoint(1, 1);
  var b = const ImmutablePoint(1, 1);
  print(identical(constPoint, b)); // They are the same instance!
  print(identical(a, b)); // They are the same instance!

  const pointAndLine = const {
    'point': const [const ImmutablePoint(0, 0)],
    'line': const [const ImmutablePoint(1, 10), const ImmutablePoint(-2, 11)],
  };

  // 和上面等价
  const pointAndLine1 = {
    'point': [ImmutablePoint(0, 0)],
    'line': [ImmutablePoint(1, 10), ImmutablePoint(-2, 11)],
  };

  var pointAndLine2 = {
    'point': [Point(0, 0)],
    'line': [ImmutablePoint(1, 10), ImmutablePoint(-2, 11)],
  };

  var pointAndLine3 = const {
    'point': [ImmutablePoint(0, 0)],
    'line': [ImmutablePoint(1, 10), ImmutablePoint(-2, 11)],
  };

  var logger = Logger('UI');
  logger.log('Button clicked');

  print(greetBob(Person1('Kathy')));
  print(greetBob(Impostor()));

  final v = Vector(2, 3);
  final w = Vector(2, 2);

  print(v + w == Vector(4, 5));
  print(v - w == Vector(0, 1));

  assert(Color.red.index == 0);
  assert(Color.green.index == 1);
  assert(Color.blue.index == 2);

  List<Color> colors = Color.values;
  assert(colors[2] == Color.blue);
  Client().method();
  print("===AB===");
  AB().method();
  print("===BA===");
  BA().method();

  var wf = new WannabeFunction();
  var out = wf("Hi","there,","gang");
  print('$out');
}
