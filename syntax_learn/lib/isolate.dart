import 'dart:async';
import 'dart:isolate';

String testShared = 'null'; // 变量不共享

Future mainIsolate() async {
  // 创建一个接收端：用于接收sub传递的发送接口
  var receivePort = new ReceivePort();
  testShared = 'main';
  // 创建一个isolate绑定，并与发送端绑定，不共享内存
  // 创建一个isolate并执行函数
  await Isolate.spawn(echo, receivePort.sendPort);
  // 等待echo发送来第一个消息，这个消息是一个SendPort对象
  SendPort sendPort = await receivePort.first;
  print('from main:' + testShared);

  var msg = await sendReceive(sendPort, "foo");
  print('received $msg');
  msg = await sendReceive(sendPort, "bar");
  print('received $msg');
}

// the entry point for the isolate
echo(SendPort sendPort) async {
  // Open the ReceivePort for incoming messages.
  // 创建主通信接口
  var port = new ReceivePort();
  print("from echo:" + testShared);
  testShared = 'sub';
  // Notify any other isolates what port this isolate listens to.
  // 将主通信接口的发送端传递出去
  sendPort.send(port.sendPort);

  await for (var msg in port) {
    var data = msg[0];
    SendPort replyTo = msg[1];
    replyTo.send(data);
    if (data == "bar") port.close();
  }
}

/// sends a message on a port, receives the response,
/// and returns the message
/// 可以理解为创建一个socket短连接，等待接收报文
Future sendReceive(SendPort port, msg) {
  ReceivePort response = new ReceivePort();
  port.send([msg, response.sendPort]);
  return response.first;
}

testIsolate() {
  mainIsolate().timeout(Duration(seconds: 1));
}
