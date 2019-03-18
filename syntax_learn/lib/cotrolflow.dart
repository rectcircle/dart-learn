

testControlFlow(){
  for (var i = 0; i < 5; i++) {
    print('!');
  }

  for (var item in [1, 2, 3]) {
    print(item);
  }

  var command = 'CLOSED';
  switch (command) {
    case 'CLOSED': // Empty case falls through.
    case 'NOW_CLOSED':
      // Runs for both CLOSED and NOW_CLOSED.
      print('switch');
      break;
  }

  switch (command) {
    case 'CLOSED':
      print('CLOSE');
      continue nowClosed;
    // Continues executing at the nowClosed label.

    nowClosed:
    case 'NOW_CLOSED':
      // Runs for both CLOSED and NOW_CLOSED.
      print('NOW_CLOSED');
      break;
  } 
}