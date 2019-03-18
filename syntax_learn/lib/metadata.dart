import 'dart:mirrors';

class Todo {
  final String who;
  final String what;

  const Todo(this.who, this.what);

  @override
  String toString() {
    return '[TODO]' + who + ":" + what;
  }
}

@Todo('seth', 'make this do something')
void doSomething() {
  print('do something');
}

@Todo('my', 'haha')
class AAA {
  @Todo('xx', 'xx')
  func() {}
}

testMetadata() {
  ClosureMirror closureMirror = reflect(doSomething);
  print(closureMirror.function.metadata.first.reflectee);

  InstanceMirror instanceMirror = reflect(AAA());
  print(instanceMirror.type.metadata.first.reflectee);

  ClassMirror classMirror = reflectClass(AAA);
  print(classMirror.metadata.first.reflectee);

  print(classMirror.declarations[#func].metadata.first.reflectee);
}
