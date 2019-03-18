import 'package:syntax_learn/export.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    num sum;
    int a = 1, b = 2;

    setUp(() {
      sum = a + b;
    });

    test('First Test', () {
      expect(add(a, b), sum);
    });
  });
}
