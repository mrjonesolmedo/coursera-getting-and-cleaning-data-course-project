# Getting and Cleaning Data Project

This repository includes submission materials for the Coursera JHU Getting and Cleaning Data project.

The script `run_analysis.R` gets smartphone sensor data and cleans it according to the following steps:
1. Download data if doesn't exist locally
2. Unzip data if hasn't been previously unzipped
3. Read data files
4. Merges the training and the test sets to create one data set
5. Extracts only the measurements on the mean and standard deviation for each measurement
6. Resolves the activity for each measurement according to the activity name
7. Refactors the variables names to be legible
8. Creates a tall and skinny dataset that displays the mean signal value for each participant and activity combination

The output of the script is the file `tidy_data.txt`.