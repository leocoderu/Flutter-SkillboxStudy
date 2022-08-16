void divideNumbers(int a, int b){
  if (b == 0) {
    throw ArgumentError();
  }
}


void divideNumbers2(int a, int b){
  if (b == 0) {
    throw 'Oops!';    // Bad practice
  }
}