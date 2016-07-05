% set the environment

close all;
clear all;
clc;

%% signature image
disp '<--Testing signature image'
test_img = imread('signature_file.png');
bytes = test_img(:);
bytes = char(bytes);

testFile(bytes, 'Signature');
disp 'Finished signature image test-->'
%% common image
disp '<--Testing generic image'
test_img = imread('cameraman.tif');
bytes = test_img(:);
bytes = char(bytes);

testFile(bytes, 'Generic Image');
disp 'Finished generic test-->'
%% english text
disp '<--Testing english text'
testFile(englishText, 'English Text');
disp 'Finished english text test-->'
%% portuguese text
disp '<--Testing portuguese text'
testFile(portugueseText, 'Portuguese Text');
disp 'Finished portuguese text test-->'
%% Java code
disp '<--Testing Java code'
testFile(javaCode, 'Java Code');
disp 'Finished Java code test-->'
%% C code
disp '<--Testing C code'
testFile(cCode, 'C Code');
disp 'Finished C code test-->'