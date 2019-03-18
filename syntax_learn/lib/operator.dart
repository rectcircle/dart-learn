class Person {
  String name;
  Person(this.name);

  void say1() {
    print('say1');
  }

  void say2() {
    print('say2');
  }
}

testOperator() {
  assert(5 / 2 == 2.5); // Result is a double
  assert(5 ~/ 2 == 2); // Result is an int 整除

  assert('5/2 = ${5 ~/ 2} r ${5 % 2}' == '5/2 = 2 r 1');

  // Type test operators 类型操作
  bool c = true;
  if (c is bool) {
    // 类型检查
    c = false;
    print(c);
  }
  dynamic emp = Person('Tim');
  dynamic o;

  (emp as Person).name = 'Bob';
  // (o as Person).name = 'Bob'; // 报错
  (o as Person)?.name = 'Bob';

  // 如果o是null，将2赋值给o
  o ??= 2;
  print(o);
  // 如果o不是null，将忽略复制
  o ??= 3;
  print(o);
  // Assign value to o
  o = 1;
  print(o);

  print(null ?? 'null');
  print(1 ?? 'not null');
}
