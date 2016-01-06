# FEM1D


### Instructions
Execute the FEM1D.m file and follow the command line prompts.


### Description
The code was developed as part of the course project for my elective undergrad course "AE675: Introduction to Finite Element Methods" in Spring 2011.

There are no descriptive comments in the code added, but the code should be fairly easy to understand.

Flowchart.pdf contains breif description of each subroutines.

A sample run of the code with all the inputs is included in the file 'sampleRun.txt'.

This MATLAB code solves ONE DIMENSIONAL finite element problem (axial bar problem). The code prompts user of input during runtime. The code can handle cases where E, A, and f are functions of x (piecewise functions can also be defined). Point loads can also be specified. Three types of boundary conditions can be solved for at each end of the bar. The user can also specify the number of elements in each segment and the order of the polynomial basis function to use. If the exact solution to the problem is know, the code can perform few simple comparitive study as well.
