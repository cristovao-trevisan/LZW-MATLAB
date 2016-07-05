function [ text ] = cCode(  )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    fileID = fopen('main.c','r');
    text = fscanf(fileID, '%c')';

end

