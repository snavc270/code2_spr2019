String txt = "The unicorn is a legendary creature that has been described since antiquity as a beast with a single large, pointed, spiraling horn projecting from its forehead. The unicorn was depicted in ancient seals of the Indus Valley Civilization and w"; 
int n = 3; //how many grams we are selecting


//switched to an array list for flexibility  

ArrayList<String> ngrams = new ArrayList<String>(); 
int gramCounter; 

void setup(){
  
  int nGramSize = txt.length()/n; //the size of our array should be our sentence length/ngram pieces
   //; //dont need to write a class to create an array list 
  
  
  
  
  //loop through our text 
  for(int i = 0; i<nGramSize; i++){
    String gram = txt.substring(i, i+n); //splicing our sentence
    if(!ngrams.contains(gram)){
 
      gramCounter = 1; 
    }else{
      gramCounter +=1; 
    }
    ngrams.add(gram); 
    
    print(gram, gramCounter, '\n'); 
  } 
}