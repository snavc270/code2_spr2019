#AGENDA
1. Review homework assignment
2. Randomness
3. Gaussian distribution
4. Noise 


### Random 
We've been using a pseudorandom number generator. Random is not really random because it is determined by it's initial seed value (set of rules for calculating so can't return a truly random value).

### Gaussian distribution 
AKA a normal distribution. It is a bell-shaped frequency curve. Which means, most of your data is clustered around the mean. The further a data point is away from the mean, the less likely it is to occur. 

If we call randomGaussian() it returns values with a probability based on a gaussian distribution.

![](https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Empirical_Rule.PNG/350px-Empirical_Rule.PNG "")

If you want more [info](https://www.khanacademy.org/math/statistics-probability/modeling-distributions-of-data/more-on-normal-distributions/v/introduction-to-the-normal-distribution) 

### Perlin Noise 
Returns more organic randomness. A random number is related to the random number before it and after it over time. Only returns a value from 0<->1. We can combine this with a map function to map a noise to a larger range. 

[The Nature of Code](https://www.youtube.com/watch?v=8ZEMLCnn8v0) 


Homework: 
1. Model a natural system in Processing using random, randomGaussian, or noise. 

