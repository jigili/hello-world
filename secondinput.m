%% date coloumn
% the matrix consist of in consequence: day, hours, temp, load
datetime.setDefaultFormats('default','yyyy-MM-dd HH:00:00+00:00')
t1=datetime([2004,1,1,0,0,0]);
t2=datetime([2004,12,30,23,0,0]);
t3=t1:hours(1):t2;
for i=1:length(t3)
    A{i,1}=t3(1,i);
end

%% temperature extraction
%% Import data from text file.
% Script for importing data from the following text file:
%
%    E:\seminar project\Neural Network for prediction\arpf1h2004.txt
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2018/05/23 10:51:59

%% Initialize variables.
filename = 'E:\seminar\Neural Network for prediction\arpf1h2004.txt';
startRow = 2;

%% Format string for each line of text:
%   column13: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%*56s%6f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', '', 'WhiteSpace', '', 'EmptyValue' ,NaN,'HeaderLines' ,startRow-1, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
ATMP = dataArray{:, 1};


%% Clear temporary variables
clearvars filename startRow formatSpec fileID dataArray ans;
a=8760-size(ATMP,1);
b=8589-a;
B=ATMP(b+1:size(ATMP,1),1);
ATMP=[ATMP; B];
x=ATMP;
for i=1:size(x,1)
    if x(i)==999
        x(i)=randi([1 33]);
    end
end
ATMP=mat2cell(ATMP,ones(1,size(ATMP,1)));
for i=1:size(ATMP,1)
    A{i,3}=ATMP{i,:};
end
%% load extraction
%% Import data from text file.
% Script for importing data from the following text file:
%
%    E:\seminar project\Neural Network for prediction\USA_FL_Orlando.Intl.AP.722050_TMY3\RefBldgSuperMarketNew2004_v1.3_7.1_2A_USA_TX_HOUSTON.csv
%
% To extend the code to different selected data or a different text file,
% generate a function instead of a script.

% Auto-generated by MATLAB on 2018/05/23 10:46:46

%% Initialize variables.
filename = 'E:\seminar\Neural Network for prediction\USA_FL_Orlando.Intl.AP.722050_TMY3\RefBldgSuperMarketNew2004_v1.3_7.1_2A_USA_TX_HOUSTON.csv';
delimiter = ',';
startRow = 2;

%% Format string for each line of text:
%   column2: double (%f)
%	column3: double (%f)
%   column4: double (%f)
%	column5: double (%f)
%   column6: double (%f)
%	column7: double (%f)
%   column8: double (%f)
%	column9: double (%f)
%   column10: double (%f)
%	column11: double (%f)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%*s%f%f%f%f%f%f%f%f%f%f%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter, 'EmptyValue' ,NaN,'HeaderLines' ,startRow-1, 'ReturnOnError', false);

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
ElectricityFacilitykWHourly = dataArray{:, 1}; % summing part
FansElectricitykWHourly = dataArray{:, 2}; % summing part
CoolingElectricitykWHourly = dataArray{:, 3};   %summing part
HeatingElectricitykWHourly = dataArray{:, 4};   %summing part
InteriorLightsElectricitykWHourly = dataArray{:, 5};    %summing part
InteriorEquipmentElectricitykWHourly = dataArray{:, 6}; %summing part
GasFacilitykWHourly = dataArray{:, 7};
HeatingGaskWHourly = dataArray{:, 8};
InteriorEquipmentGaskWHourly = dataArray{:, 9};
WaterHeaterWaterSystemsGaskWHourly = dataArray{:, 10};
G=ElectricityFacilitykWHourly+FansElectricitykWHourly+CoolingElectricitykWHourly+...
HeatingElectricitykWHourly+InteriorLightsElectricitykWHourly+InteriorEquipmentElectricitykWHourly;
G=mat2cell(G,ones(1,size(G,1)));
for i=1:size(G,1)
    A{i,2}=G{i,:};
end
A=cell2table(A);
A.Properties.VariableNames = {'time' 'demand_load' 'temperature' 'holiday' 'weekday_0' 'weekday_1'...
    'weekday_2' 'weekday_3' 'weekday_4' 'weekday_5' 'weekday_6' 'month_1' 'month_2' 'month_3' 'month_4'...
    'month_5' 'month_6' 'month_7' 'month_8' 'month_9' 'month_10' 'month_11' 'month_12'};
writetable(A,'myData.csv','Delimiter',';','QuoteStrings',true)





%  fid = fopen('110416.csv','wt');
%  if fid>0
%      for k=1:size(A,1)
%          fprintf(fid,'%s,%f\n',A{k,:});
%      end
%      fclose(fid);
%  end
% 
% cHeader = {'ab' 'bcd' 'cdef' 'dav'}; %dummy header
% commaHeader = [cHeader;repmat({','},1,numel(cHeader))]; %insert commaas
% commaHeader = commaHeader(:)';
% textHeader = cell2mat(commaHeader); %cHeader in text with commas
% %write header to file
% fid = fopen('110416.csv','w'); 
% fprintf(fid,'%s\n',textHeader)
% fclose(fid)
% %write data to end of file
% A=mat2cell(A,[ones(size(A,1))]);
% dlmwrite('110416.csv',cell2mat(),'-append');
