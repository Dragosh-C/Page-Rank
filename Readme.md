
# Iterative
For the iterative algorithm, I first read the data from
file then I created the adjacency matrix. To create
matrix M I divided each element by 1 to the sum of all
elements on the column. Then I used the given algorithm
to link [1] to calculate the vector R.

# Algebraic
For algebra I used the same algorithm as above for
to find M, and then I calculated the inverse using Gram-Schmidt
modified and solving the triangular system. After I used
formula for determining pagerank.

# Pagerank
First, I called the two rank determination functions
then I wrote them in a file, and then I found the last ones
two elements from the file to calculate the degree of membership.

After that I sorted the positions in such a way that the vector is
sorted descending.

In the Belonging function, I first checked who it is
find out x(i) and for each case I replaced with the appropriate value.
So that the function ax+b is continuous on that interval
I solved a system of 2 equations replacing x with val1 and
val2 and then I calculated the x.
Then in the Pagerank function I displayed that ranking.


[1] http://en.wikipedia.org/wiki/PageRank
