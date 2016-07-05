function [ text ] = javaCode( input_args )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    fileID = fopen('NeuralNetwork.java','r');
    text = fscanf(fileID, '%c')';

end

