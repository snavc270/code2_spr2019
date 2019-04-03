// the input text that the markov chain will be based off of
String text = "  A HashMap stores a collection of objects, each referenced by a key. This is similar to an Array, only instead of accessing elements with a numeric index, a String is used. (If you are familiar with associative arrays from other languages, this is the same idea.) The above example covers basic use, but there's a more extensive example included with the Processing examples. In addition, for simple pairings of Strings and integers, Strings and floats, or Strings and Strings, you can now use the simpler IntDict, FloatDict, and StringDict classes.";

// the order of the n-grams
int order = 3;

// the markov chain
HashMap<String, ArrayList<String>> chain = new HashMap<String, ArrayList<String>>();

// the number of characters to generate
int generatedTextLength = 200;

// create the markov chain
void setup() {
  size(500, 500); 
  for (int i = 0; i < text.length() - order; i++) {
    String gram = text.substring(i, i + order);
    ArrayList<String> characters; 
    if (!chain.containsKey(gram)) {
      characters = new ArrayList<String>(); 
      chain.put(gram, characters);
    } else {
      characters = chain.get(gram); 
    }
    characters.add(text.substring(i+order, i+order+1)); 
  }
}
String result = " ";
void draw() { 
  background(0); 
  
  fill(255); 
  textAlign(CENTER); 
  text(result, width/4, height/4, width/2, height/4); 
}

// generate text when a mouse button is clicked
void mousePressed() {
    String
    currentGram = text.substring(0, order); 
    result = currentGram;
    
  for (int i = 0; i < generatedTextLength; i++) {
    if (chain.containsKey(currentGram)) {
      ArrayList<String> characters = chain.get(currentGram);
      result += characters.get(round(random(characters.size() - 1)));
      currentGram = result.substring(result.length() - order, result.length());
    }
  }
  print(result + "\n\n");
}