knearest.m

RegLS.m

showdata.m

showdigit.m

shufflerows.m

These are the utility functions that you will use in this mini project. To get help on how these scripts
work, use the inbuilt Matlab help facility, e.g.

help knearest

Use the help command to find out how they work, or look at the code itself – be sure to know what
arguments they take, and what they return, so you don’t overwhelm the TAs with trivial
information that you could see by just typing:

help showdigit

You will also find a single file with extension “.mat”: postaldata.mat
This is a data file, containing the data you will use for the project. If you have unzipped this, start
Matlab. Then, use the Matlab command line (not the Unix command line) to navigate to the
appropriate directory where these files are. Now type:

load postaldata

This will have loaded two variables into memory: data and labels. These are samples of some
US Postal Service handwritten digit data; the data matrix of 5,000 rows and 256 columns, that
contains the actual images, and the labels variable containing integers that state what digit is
drawn in each image.

As a starter, try the following:

load postaldata;

h = data(1123,:);

showdigit(h);

This has pulled out the 1123rd row, and all columns from the matrix. A number ‘3’ should be
displayed be on the screen. There are totally 500 examples of each of the digits 0-9. Try others for
yourself.
Since Matlab indexes arrays from 1 (I hope you all have realised that by now), then to get examples
of the digit ‘0’, you use array index 10, as follows:

showdigit( data(4950,:) ); 


Part 1: k-Nearest Neighbour - Training and Testing


a) Write a script that constructs a training dataset of just digits “3” and “8”. To start, pick 100 of
each randomly. Your matrix should end up as 2D, 200 rows by 256 columns. Remember to
include the true label for each digit, in another array, called mylabels (or whatever you
wish).

b) Use the k-NN rule to classify each of the digits in your training set, and report the classification
accuracy. Plot a graph to display the accuracy as you vary k (i.e., k on the x-axis, and accuracy
on the y-axis). What does k=1 mean? What does it happen when k gets bigger?

c) Now, plot a testing accuracy graph, again varying k. Use your original 200 training data points,
and pick another 200 appropriate digits for testing. This of course means you need to know the
difference between the training accuracy and testing accuracy.

d) Repeat the process for (c) many times. Do you get the same behaviour? If not, why not? Plot an
average accuracy, and standard deviation as error bars. Remember all graphs should have
axis labels and a title. If you don’t know what Matlab commands to use, try searching the
internet of Matlab’s help facility.

e) When you are comfortable with all this, extend the above to predict digits “3”, “6”, and “8”.
You can visualise some of your classifications using the showdata function provided. White
boxes are placed around digits that you have predicted incorrectly. What do you notice? Are
you always misclassifying examples of the ‘8’ digits? Or the ‘3’ digits? The simple accuracy
measure we adopted does not tell us which digits we commonly misclassify. This information
obviously might be useful to know – we wouldn’t want to use a k-NN rule that can never
recognise the number 8. A far more useful evaluation measure is to look at the confusion
matrix:
http://en.wikipedia.org/wiki/Confusion_matrix
Try building a confusion matrix for your classifications on the benchmark set.


Part 2: Regularised Least Squares – Training, Testing and Hyperparameter Selection


a) Implement a linear classifier for binary classification, based on the regularised least squares
method described in the lecture. Use the RegLS function provided to compute the
regularised least squares solution. Train the classifier using the training data you constructed
in part 1.a) with the hyperparameter λ set as zero. What does λ =0 mean? Compare the
training accuracy to a 2-class k-NN.

b) Pick another 200 digits for testing and repeat the process many times. What testing accuracy
do you achieve? Compare the performance to a 2-class k-NN, in terms of both time and space
complexity. How long does training take? How much memory is necessary? How accurate is
the classification?

c) Now, examine how the hyperparameter λ affects the behaviour of the linear classifier. Similar
to what you did in part 1.d), plot an average accuracy and standard deviation as error bars by
varying λ, e.g. from 10-5 to 1010 . When plotting the graph, you can have log10λ on the x-axis
and accuracy on the y-axis.

d) Try to select an appropriate setting for the hyperparameter λ. You can randomly split your
original 200 training data points into two partitions, i.e., 100 digits in each partition. Use one
partition to train the classifier and the other to examine the classification accuracy for different
values of λ. Select the hyperparameter value with the highest accuracy. Repeat this process
for multiple times. Do you select similar values for λ every time?

e) Decide a value for your λ based on what you have observed in d) and explain the reason.
Now, train the linear classifier with the selected λ using all the original 200 training data
points, and pick another 200 digits for testing. Compare the performance with your linear
classifier with fixed setting λ =0.


Part 3: Regularised Least Squares – Multi-class Classification


Now, we start to work on something a bit more challenging. Be creative, and design a multi-class
classifier based on regularised least squares. You can try to predict digits “3”, “6” and “8”, or even
all ten digits. What testing accuracy do you achieve? What value do you choose for λ after
performing the hyperparameter selection? Compare the performance of this classifier to that of a kNN
classifier.
