String txt = "hello class welcome back to your fav coding class"; 
int n = 3; //how many grams we are selecting 
String ngrams []; 


void setup(){
  
  int nGramSize = txt.length()/n; //the size of our array should be our sentence length/ngram pieces
  ngrams = new String[nGramSize]; 
  
  //loop through our text 
  for(int i = 0; i<nGramSize; i++){
    String gram = txt.substring(i, i+3); //splicing our sentence
    ngrams[i] = gram; 
    
    println(ngrams[i]); 
  } 
}