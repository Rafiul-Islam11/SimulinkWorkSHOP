clearvars; clc;

%% IMPORT SOUND
[fileN, pathN] = uigetfile('*');
filePath = convertCharsToStrings(pathN) + convertCharsToStrings(fileN);
image = imread(filePath);


%% Pixels Positions
% At X direction
XposSTART = 100;
XposEND = 100;
% At Y direction
YposSTART = 100;
YposEND = 100;


%% RGB Average on those selected Pixels
R = mean(image(XposSTART:XposEND,YposSTART:YposEND,1), 'all');
G = mean(image(XposSTART:XposEND,YposSTART:YposEND,2), 'all');
B = mean(image(XposSTART:XposEND,YposSTART:YposEND,3), 'all');


% Clear tmp variables
clear XposSTART XposEND YposSTART YposEND fileN...
    pathN filePath