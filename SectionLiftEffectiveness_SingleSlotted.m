function SLE_SingleSlotted = SectionLiftEffectiveness_SingleSlotted()
    %IMPORTFILE Import data from a text file
    %  [X, Y, X1, Y1, X2, Y2, X3, Y3, X4, Y4] = IMPORTFILE(FILENAME) reads
    %  data from text file FILENAME for the default selection.  Returns the
    %  data as column vectors.
    %
    %  [X, Y, X1, Y1, X2, Y2, X3, Y3, X4, Y4] = IMPORTFILE(FILE, DATALINES)
    %  reads data for the specified row interval(s) of text file FILENAME.
    %  Specify DATALINES as a positive scalar integer or a N-by-2 array of
    %  positive scalar integers for dis-contiguous row intervals.
    %
    %  Example:
    filename = "SectionLiftEffectiveness_SingleSlotted.csv";
    dataLines = [3, Inf];
    %
    %  See also READTABLE.
    %
    % Auto-generated by MATLAB on 14-Jun-2022 20:32:57
    
    %% Input handling
    
    % If dataLines is not specified, define defaults
    if nargin < 2
        dataLines = [3, Inf];
    end
    
    %% Set up the Import Options and import the data
    opts = delimitedTextImportOptions("NumVariables", 10);
    
    % Specify range and delimiter
    opts.DataLines = dataLines;
    opts.Delimiter = ",";
    
    % Specify column names and types
    opts.VariableNames = ["X", "Y", "X1", "Y1", "X2", "Y2", "X3", "Y3", "X4", "Y4"];
    opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "double", "double", "double", "double"];
    
    % Specify file level properties
    opts.ExtraColumnsRule = "ignore";
    opts.EmptyLineRule = "read";
    
    % Import the data
    tbl = readtable(filename, opts);
    
    %% Convert to output type
    X{1} = tbl.X;
    Y{1} = tbl.Y;
    X{2} = tbl.X1;
    Y{2} = tbl.Y1;
    X{3} = tbl.X2;
    Y{3} = tbl.Y2;
    X{4} = tbl.X3;
    Y{4} = tbl.Y3;
    X{5} = tbl.X4;
    Y{5} = tbl.Y4;
    
    for i = 1:5
        SLE_SingleSlotted{i} = spline(X{i}(~isnan(X{i})),Y{i}(~isnan(Y{i})));
    end
end