# Week 4 agenda 
1. Review everyone's hw from last week 
2. Partner debugging 
3. Collision detection using conservation of momentum 
4. Forking, upstream remotes, and merging 



## New vector methods cheat sheet: 
	
	.heading() - calculates the angle of rotation of a vector 

	.mag() - calculates the length of a vector (does not take into account direction)  

	.normalize() - calculates the direction of the vector without the magnitude

	.random2D() - generates the direction a random 2-dimensional vector 



## Forking a project  

1. Fork the project on github.com: 

	![](https://cdn.tutsplus.com/net/uploads/2013/08/github_header.png "")


2. Clone that forked repos:

	**git clone (the url to that repos)**


3. Add your upstream remote: 

	**cd (the folder of your local clone)**
	**git remote add upstream (the url of the ORIGINAL github repos)**

	**git fetch upstream**</br>
	**git merge upstream/master**


4. Adding a branch: 
	*In order to not mess up the orginal project and avoid merge conflicts, 
	it is good practice to create another branch for the updates you want to make*

	**git checkout -b (the name of your branch)**


5. Committing & pushing: 
	*Make sure your only committing and pushing to your branch* 

	**git commit -am "your commit message"
	git push origin (the name of your branch)**




## In class coding 
1. How can we add better collision to our hw?  



## Homework 
1. Implement a better collision throughout your breakaway game 
2. Github collaboration with a classmate 
	a. Create a central repository (this will have to exist on one persons local computer)
 	b. Fork the repository 
 	c. Clone that fork
 	d. Add an upstream remote to pull from the source 
 	e. Merge changes from the source locally 



# Homework challenge
1. Implement our collision calculation throughout an arrayList 