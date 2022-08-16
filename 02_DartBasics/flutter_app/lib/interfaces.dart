import 'dart:html';

abstract class Console {
  void logError(String errorData);
  void logSuccess() {
    print('Success!');
  }
}

class PhoneConsole extends Console {
  @override
  void logError(String errorData) {
    print('Error on phone');
  }
}

class WebConsole implements Console {
  @override
  void logError(String ErrorData) {
    print('Error ob Web');
  }

  @override
  void logSuccess(){
    print('Success ob Web!');
  }
}