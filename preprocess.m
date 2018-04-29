%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               MLP Neural Network for Cancer Diagnosis                   %
%                                                                         %
%                Pre-Processing script by Aliya Rehman                    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This code is being submitted as a part of assessment for Knowledge      %
% Managament for Health Informatics Module in MSc. HEalth Informatics     %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc; clear all;close all; 

% Read the csv file created in Python with outliers removed
Data = readtable('BreastCancerData_NoOutliers.csv');

% Drop the index column and "id" attribute as it is not used in experiment
Data(:, 'Var1') = []
Data(:, 'id') = []

% Identify the "diagnosis" variable as a categorical variable
Data.diagnosis = categorical(Data.diagnosis)

% Change the malignant (M) and Benign (B) to 1 and 0 respectively
Labels = Data.diagnosis
LabelsStr = cellstr(Labels)
LabelsStr = strrep(LabelsStr, 'B', '0')
LabelsStr = strrep(LabelsStr, 'M', '1')
Data.diagnosis = str2double(LabelsStr)

% Create Features and Labels from cleaned dataset
Features = Data(:,[2:end]);
Labels = Data(:,1);

% Applying min-max scaling to the data to makes uniform ranges of features
%Number of observations
N=length(Features(:,1));
%Number of variables
M=length(Features(1,:));
% output array of normalised values, initilized with all 0s
norm=zeros(N,M);

% determine the maximum value of each colunm of an array
Max=max(Features);
% determine the minimum value of each colunm of an array
Min=min(Features);
%array that contains the different between the maximum and minimum value for each column
Difference=Max-Min;    
%subtract the minimum value for each column
norm=Features-repmat(Min,N,1);  
%Column by the difference between the maximum and minimum value 
norm=norm./repmat(Difference,N,1);

% Idetify normalized features as X and Labels as Y for training MLP 
X = norm; Y= Labels;


