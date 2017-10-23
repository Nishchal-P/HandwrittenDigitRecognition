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
