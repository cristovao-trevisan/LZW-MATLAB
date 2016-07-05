function [dataOut, rate] = compressionTestLZW (dataIn, maxTableSize)
    num_bytes = length(dataIn);
    % initialize table
    table = containers.Map({char(0)}, {0});
    for i=1:255
       table(char(i)) = i;
    end

    % initialize variables

    w = '';
    counter = 256;
    lzw_output = [];

    % lzw compression algorithm
    for i=1:num_bytes
        k = dataIn(i);
        if table.isKey([w, k])
           w = [w, k];
        else
            table([w, k]) = counter;
            lzw_output  = [lzw_output table(w)];
            counter = counter + 1;
            w = char(k);
            % restart table if it's full
            if counter == maxTableSize
                counter = 256;
                table = containers.Map({char(0)}, {0});
                for a=1:255
                   table(char(a)) = a;
                end
            end
        end
    end
    lzw_output  = [lzw_output table(w)];
    num_compressed_bytes = length(lzw_output);
    
    
    dataOut = [];
    counter = 1;
    for i = 1:num_compressed_bytes
        d = max(9,ceil(log2(mod(i-1, maxTableSize-256)+256)));
        dataOut(counter:counter+d-1) = dec2bin(lzw_output(i), d) - '0';
        counter = counter + d;
    end
    
    rate = num_bytes*8/length(dataOut);
end