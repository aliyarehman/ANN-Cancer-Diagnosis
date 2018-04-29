# ANN-Cancer-Diagnosis

This Github repo contains the preprocessing scripts used for data cleaning and pre-processing for training MLP and Cancer diagnosis.

The repo contains following files:

**BreastCancerData.csv* :** This is the original diagnostics dataset downloaded from UCI machine learning repository

**BreatCancerDataset_NoOutliers.ipynb :** This file contains the jupyter notebook script used to remove outliers from the dataset. Python is preferred in this case as numPy SciPy and PAndas libraries allow easy manipulation of data and achieve the required objective in a simple way 

**BreatCancerData_NoOutliers.csv :** This is the clean dataset with Nan values removed and all rows containing outliers have also been removed from the original dataset.

**preprocess.m :** Remaining preprocessing is perfomed in MATLAB and this script removes un-necessary features i.e. "id", changes the diagnosis variable into a categorical type changing M = Malignant to 1 and B = Benign to 0 and normalizes all attribute values between 0 and 1 using statistical normalization method. 

The X and Y datasets generated at the result of preprocess.m have been used for training the neural network provided in the final report. 

Kindly email the author in case of any queries.

