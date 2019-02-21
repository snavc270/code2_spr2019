# Week 5 

### Agenda 
1. Review collision with arrays 
2. Basic vector calculations review
3. Switches 
4. State machines 
5. Collaborative git continued. 


## Switches (review)
Switches are a useful logic tool and work similar to and if else statement. They are more concise and easier to use if you have to switch between a lot of outcomes. 

#### [Syntax](https://processing.org/reference/switch.html "") 

int n;

switch(n){ 

	case 0: 

	break; 
	case 1: 

	break; 
	case 2: 

	break; 
	
	//can also set up a default state 
}



## State machines 
A state machine reads a series of inputs, and switch to a state depending on the input. There are different types of state machines, but we'll be dealing mainly with finite state machines. 

[](https://i0.wp.com/blog.markshead.com/wp-content/uploads/2011/02/simple-state-machine.png?zoom=2&resize=304%2C183&ssl=1) 

In this example, if we start on state s and have an input of a, it will change to state q, if we have an input of b, it will remain on state s, etc. 



## Collaborative git continued 
Branches are an important tool to work on certain aspects of a project without compromising your main branch. This can be especially useful when working on a shared code base with another person. 

1. git branch //lists all of the branches in your repos
2. git branch [the name of your branch] //creates a new branch
3. git checkout [the name of the branch you want to switch to] //switches to a different branch 
4. git commit -m " "
5. git push origin [the name of the branch you are pushing to]



## Homework 
1. Create a switch that changes scenes based on input (you can use multiple sketches that you've already programmed)
2. Create a state machine that changes the behavior of an object based on user input 
3. Create a branch on your git project with a partner. Commit a change to this branch 

## Challenges 
1. Use a state system to change the behavior of your paddle in your breakaway game 






