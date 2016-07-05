function [ text ] = portugueseText()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    fileID = fopen('portugueseText.txt','r');
    text = fscanf(fileID, '%c')';
end

