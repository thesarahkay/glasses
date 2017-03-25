class Square {
  //properties
  String _name, _vote, _gender, _rel, _age, _platform;
  int y = 0; 
  int _x;
  int scaler = 13;
  int rows = 3;
  int y_group;
  int rect_width = 10;

  //single constructor funtion
  Square(String name, String vote, String gender, String rel, String age, 
    String platform, int x) {
    _name = name;
    _vote = vote;
    _gender = gender;
    _rel = rel;
    _age = age;
    _platform = platform;
    _x = x;
  }

  // methods
  void display() {

    // group assignment
    if (_platform.equals("I")) {
      y_group = 100;
    } else {
      y_group = 0;
    }


    // color assignment
    if (_vote.equals("A")) {
      fill(0, 255, 0);
    } else if (_vote.equals("B")) {
      fill(0, 0, 255);
    } else {
      fill(255, 0, 0);
    }

    // position maths

    // y: find if should remain in same col, then scale, then see if is in first group or second
    y = ((_x % rows) * scaler + y_group);

    // x: find if should remain in same row, then scale
    _x /= rows;
    _x *= scaler;

    rect(_x, y, rect_width, rect_width);
  }
}