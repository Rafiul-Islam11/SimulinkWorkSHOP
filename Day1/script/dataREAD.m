clearvars; clc;

%% IMPORT SOUND
[fileN, pathN] = uigetfile('*');
filePath = convertCharsToStrings(pathN) + convertCharsToStrings(fileN);


%% Data import parameters
opts = spreadsheetImportOptions("NumVariables", 3);
opts.DataRange = 'A2:C1001';
opts.VariableTypes = ["double", "double", "double"];

opts.Sheet = 'Sheet1';
tb1 = readtable(filePath, opts, "UseExcel", false);


%% Convert to output type
T = rmmissing(table2array(tb1(:,1)));
S1 = rmmissing(table2array(tb1(:,2)));
S2 = rmmissing(table2array(tb1(:,3)));


% Clear tmp variables
clear opts fileN pathN filePath tb1


%% Display
plot(T, [S1, S2]);
xlabel("Time (s)");
ylabel("Amplitude");
legend('T', 'S1', 'S2');