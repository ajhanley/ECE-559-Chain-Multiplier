Each folde holds its respetive set of components and algorithms for that part of the project. The fully operational system for passing test vectors and seeing oputput is in the EDA playground sources folder, and can be run here: https://www.edaplayground.com/x/gfSe
For each verilog component on eda, commented in the file is an example test bench, to give you a better idea of how each system should be setup.

The Python Folder contains the main.py program which lets you build test vectors by passing different strings of matrices to it.
The Test Vectors and Outputs folder holds all the test vectors and their respective results from EDA Playground.

The sources for Vivado foleder holds all the verilog files we used in vivado, and the VLSI_ChainDecider Folder holds the zipped vivadp project that has run synthesis and implementation, so reports are there too.