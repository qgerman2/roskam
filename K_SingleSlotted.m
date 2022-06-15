function K = K_SingleSlotted()
%IMPORTFILE Import data from a text file
%  VARNAME1 = IMPORTFILE(FILENAME) reads data from text file FILENAME
%  for the default selection.  Returns the data as column vectors.
%
%  VARNAME1 = IMPORTFILE(FILE, DATALINES) reads data for the specified
%  row interval(s) of text file FILENAME. Specify DATALINES as a
%  positive scalar integer or a N-by-2 array of positive scalar integers
%  for dis-contiguous row intervals.
%
%  Example:
filename = "K_SingleSlotted.txt";
dataLines = [1, Inf];
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 14-Jun-2022 20:49:56

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [1, Inf];
end

%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 2);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = ";";

% Specify column names and types
opts.VariableNames = ["VarName1", "VarName2"];
opts.VariableTypes = ["double", "double"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Specify variable properties
opts = setvaropts(opts, ["VarName1", "VarName2"], "TrimNonNumeric", true);
opts = setvaropts(opts, ["VarName1", "VarName2"], "DecimalSeparator", ",");
opts = setvaropts(opts, ["VarName1", "VarName2"], "ThousandsSeparator", ".");

% Import the data
tbl = readtable(filename, opts);

%% Convert to output type
X = tbl.VarName1;
Y = tbl.VarName2;
K = spline(X, Y);
end