import 'package:syntax_learn/asynchrony.dart';
import 'package:syntax_learn/export.dart';
import 'package:syntax_learn/generics.dart';
import 'package:syntax_learn/isolate.dart';
import 'package:syntax_learn/metadata.dart';
import 'package:syntax_learn/part.dart';
import 'package:syntax_learn/typedef.dart';
import 'package:syntax_learn/variable.dart';
import 'package:syntax_learn/function.dart';
import 'package:syntax_learn/operator.dart';
import 'package:syntax_learn/cotrolflow.dart';
import 'package:syntax_learn/exception.dart';
import 'package:syntax_learn/class.dart';
// import 'dart:html';

// Define a function.
printInteger(int aNumber) {
  print('The number is $aNumber.'); // Print to console.
}

// This is where the app starts executing.
main(List<String> arguments) {
  print(arguments);
  var number = 42; // Declare and initialize a variable.
  printInteger(number); // Call a function.
  printInteger(add(1, 2));
  printInteger(min3(1, 2, 3));
  testVariable();
  testFunction();
  testOperator();
  testControlFlow();
  testException();
  testClass();
  testGenerics();
  testAsync();
  testIsolate();
  testTypedef();
  testMetadata();
}
