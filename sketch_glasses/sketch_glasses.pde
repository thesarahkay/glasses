import processing.pdf.*;

String csv[];
String data[][];
ArrayList<Square> squares;
int a = 0;
int b = 0;

void setup() {
  size(600, 600);
  background(255, 255, 255);
  noLoop();
  noStroke();

  squares = new ArrayList<Square>();

  // load each line of data into a string in an array
  csv = loadStrings("glasses_data.csv");

  // parse through each string, separating by comma, load into [][] array
  data = new String[csv.length][6];
  for (int i = 0; i < csv.length; i++) {
    data[i] = csv[i].split(",");
  }

  // bind data to squares
  for (int i = 0; i < data.length; i++) {
    String name = data[i][0];
    String vote = data[i][1];
    String gender = data[i][2];
    String rel = data[i][3];
    String age = data[i][4];
    String platform = data[i][5];

    if (platform.equals("F")) {
      squares.add(new Square(name, vote, gender, rel, age, platform, a));
      a++;
    } else if (platform.equals("I")) {
      squares.add(new Square(name, vote, gender, rel, age, platform, b));
      b++;
    }
  }
}

void draw() {
  beginRecord(PDF, "0.PDF");
  println("start");

  for (Square s : squares) {
    s.display();
  }
  fill(0, 0, 0);
  text("Facebook", 0, 50);
  text("Instagram", 0, 150);

  endRecord();
  println("done");
}