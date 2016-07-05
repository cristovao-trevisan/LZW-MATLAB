function [] = testFile(dataIn, titleName)
    %% rate vs table's size analisys
    rates = [];
    for tableSize = 2.^(11:16)
        [compressed_bits, rate] = compressionTestLZW(dataIn, tableSize);

        rates = [rates rate];
        ilzw = decompressionTestLZW(compressed_bits, tableSize);
        error = sum(abs(ilzw - dataIn)) > 0;
        
        if error
           disp('error compressing/decompressing')
        end
    end
    ptableSize = 11:10+length(rates);
    figure,
    plot(ptableSize, rates);
    title(titleName)
    xlabel 'Sequence Size(bits)'
    ylabel 'Compression Rate'
    disp([titleName ' compression rate: ' num2str(max(rates))])
    
    %% execution time vs size
    times = [];
    for s = length(dataIn)/5:length(dataIn)/5:length(dataIn)
        tic
        [compressed_bits, rate] = compressionTestLZW(dataIn(1:s), tableSize);
        ilzw = decompressionTestLZW(compressed_bits, tableSize);
        times = [times toc];
    end
    figure,
    plot(20:20:100, times);
    title (titleName)
    xlabel 'Percent of File Compressed'
    ylabel 'Execution Time (seconds)'
    
end