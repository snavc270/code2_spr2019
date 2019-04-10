String current = "A";

int count = 0;
 
void setup() {
  println("Generation " + count + ": " + current);
}
 
void draw() {
}
 
void mousePressed() {
  String next = "";

  for (int i = 0; i < current.length(); i++) {
    char c = current.charAt(i);
    if (c == 'A') {
      next += "AB";
    }  else if (c == 'B') {
      next += "A";
    }
  }
  current = next;
  count++;
  println("Generation " + count + ": " + current);
}