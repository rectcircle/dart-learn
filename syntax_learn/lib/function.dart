import 'package:meta/meta.dart';

/// 动态类型：不写类型
isNull(obj) {
  return obj == null;
}

/// 声明类型
bool isNotNull(Object obj) {
  return obj != null;
}

/// 箭头函数：只支持一条表达式
bool isZero(num n) => n == 0;

/// 可选命名参数
void enableFlags(int a, {@required bold, hidden = false}) {
  print(a);
  print(bold);
  print(hidden);
}

/// 可选位置参数
String say(String from, String msg, [String device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

void doStuff(
    {List<int> list = const [1, 2, 3],
    Map<String, String> gifts = const {
      'first': 'paper',
      'second': 'cotton',
      'third': 'leather'
    }}) {
  print('list:  $list');
  print('gifts: $gifts');
}

var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';

foo() {}

testFunction() {
  enableFlags(0);
  enableFlags(1, bold: false);
  enableFlags(2, bold: true, hidden: false);

  print(say("tom", "hi"));
  print(say("小明", "你好", 'Android'));

  doStuff();

  () {
    print("匿名函数");
  }();

  assert(foo() == null);

}
