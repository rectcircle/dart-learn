Future<String> lookUpVersion() async => '1.0.0';

Future<void> asyncFunction() async {
  print(await lookUpVersion());
  try {
    var version = await lookUpVersion();
  } catch (e) {
    // React to inability to look up the version
  }

  var s = Stream.fromIterable([1, 2, 3]);
  await for (var v in s) {
    // Executes each time the stream emits a value.
    if (v==3){
      break;
    }
    print(v);
  }
}

testAsync() {
  var f = asyncFunction();
}
