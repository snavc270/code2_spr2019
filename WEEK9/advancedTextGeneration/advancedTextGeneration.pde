///from stack overflow page https://stackoverflow.com/questions/27922290/markov-text-generating
// required imports for Processing
import java.util.Hashtable;
import java.util.Vector;


String inputFile = "text.txt";
Markov markovChain;


void setup() {
  markovChain = new Markov();

  // load text
  String[] input = loadStrings(inputFile);
  for (String line : input) {
    markovChain.addWords(line);
  }

  // generate a sentence!
  String sentence = markovChain.generateSentence();
  println(sentence);
}


class Markov {
  Hashtable<String, Vector<String>> markovChain = new Hashtable<String, Vector<String>>();

  Markov() {
    markovChain.put("_start", new Vector<String>());
    markovChain.put("_end", new Vector<String>());
  }

  void addWords(String line) {
    String[] words = line.split(" ");
    for (int i=0; i<words.length; i++) {
      if (i == 0) {
        Vector<String> startWords = markovChain.get("_start");
        startWords.add(words[i]);
        Vector<String> suffix = markovChain.get(words[i]);
        if (suffix == null) {
          suffix = new Vector<String>();
          suffix.add(words[i+1]);
          markovChain.put(words[i], suffix);
        }
      } else if (i == words.length-1) {
        Vector<String> endWords = markovChain.get("_end");
        endWords.add(words[i]);
      } else {
        Vector<String> suffix = markovChain.get(words[i]);
        if (suffix == null) {
          suffix = new Vector<String>();
          suffix.add(words[i+1]);
          markovChain.put(words[i], suffix);
        } else {
          suffix.add(words[i+1]);
          markovChain.put(words[i], suffix);
        }
      }
    }
  }

  String generateSentence() {
    String newPhrase= "";
    String nextWord = "";
    Vector<String> startWords = markovChain.get("_start");
    int startWordsLen = startWords.size();
    nextWord = startWords.get(int(random(startWordsLen)));
    newPhrase += " " + nextWord;
    while (nextWord.charAt (nextWord.length()-1) != '.') {
      Vector<String> wordSelection = markovChain.get(nextWord);
      int wordSelectionLen = wordSelection.size();
      nextWord = wordSelection.get(int(random(wordSelectionLen)));
      newPhrase += " " + nextWord;
    }
    return newPhrase.toString();
  }
} 