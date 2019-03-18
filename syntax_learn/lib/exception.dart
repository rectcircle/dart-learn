testException() {
  try {
    throw FormatException('Expected at least 1 section');
  } catch (e) {
    print(e);
  }

  try {
    throw 'Out of llamas!';
  } catch (e) {
    print(e);
  }

  try {
    throw Exception();
  } on UnimplementedError {
    print('UnimplementedError');
  } on FormatException {
    print('FormatException');
  } on Exception catch (e) {
    print(e);
  }

  try {
    throw UnimplementedError("未实现的方法");
  } catch (e, s) {
    print('Exception details:\n $e');
    print('Stack trace:\n $s');
    // rethrow; // Allow callers to see the exception.
  } finally {
    print("finally");
  }
}
