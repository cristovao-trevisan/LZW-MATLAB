function [dataOut] = decompressionTestLZW (dataIn, maxTableSize)

    extended_bytes = (zeros(1, floor(length(dataIn)/8)));
    % bits to bytes
    counter = 0;
    i=1;
    while counter < length(dataIn)
        d = max(9,ceil(log2(mod(i-1, maxTableSize-256)+256)));
        extended_bytes(i) = (sum(dataIn(counter+(1:d)).*(2.^((d-1):-1:0))));
        counter = counter + d;
        i = i+1;
    end
    extended_bytes = extended_bytes(1:i-1);

    % extended_bytes = lzw_output;
    % initialize table
    table_i = containers.Map({0}, {char(0)});
    for i=1:255
       table_i(i) = char(i);
    end

    % initialize variables
    w = '';
    counter = 256;
    w0 = extended_bytes(1);
    dataOut = [table_i(w0)];
    e = w0;

    % decompression algorithm
    for i=2:length(extended_bytes)
        w = extended_bytes(i);
        if table_i.isKey(w)
            e = table_i(w);
        else
            e = [table_i(w0), e(1)];
        end
        dataOut = [dataOut e];
        table_i(counter) = [table_i(w0), e(1)];
        counter = counter+1;
        % restart table if it's full
        if counter == maxTableSize
           counter  = 256; 
           table_i = containers.Map({0}, {char(0)});
            for a=1:255
               table_i(a) = char(a);
            end
        end
        w0 = w;
    end

    dataOut = dataOut';
end