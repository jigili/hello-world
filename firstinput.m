
datetime.setDefaultFormats('default','yyyy-MM-dd')
H=holidays(datetime('1-Jan-2004','Locale','en_US'),datetime('30-dec-2004','Locale','en_US'));
H.Format='dd-MM-yyyy';
t4=datetime([2004,1,1]):hours(1):datetime([2004,12,31]);t4=t4';
t4.Format='dd-MM-yyyy';
t4=cellstr(t4);
H=cellstr(H);
for i1=1:8761
     for i2=1:10        
       if(  isequal(H{i2,1},t4{i1,1})==1 )   
           dataArray1(i1,1)=1;
       end
    end
end
for i=(size(dataArray1,1))+1:size(t4,1)
    dataArray1(i)=0;    
end
holiday=mat2cell(dataArray1,ones(1,size(dataArray1,1))); 
datetime.setDefaultFormats('default','yyyy-MM-dd HH:00:00+00:00')
t1=datetime([2004,1,1,0,0,0]);
t2=datetime([2004,12,30,23,0,0]);
t3=t1:hours(1):t2;
t3=t3';
dataArray={};
 % bsl_1 = dataArray{:, 1};
% bsl_2 = dataArray{:, 2};
% bsl_3 = dataArray{:, 3};
t=day(t3,'dayofweek');
for i=1:8760
    dataArray{i,1}=holiday{i,1};
    %weekday_0
    if t(i,1)==1
        dataArray{i,2}=1;
    else
        dataArray{i,2}=0;
    end
    %weekday_1
    if t(i,1)==2;
        dataArray{i,3}=1;
    else
        dataArray{i,3}=0;
    end
     %weekday_2
     if t(i,1)==3
        dataArray{i,4}=1;
    else
        dataArray{i,4}=0;
     end
    %weekday_3
    if t(i,1)==4
        dataArray{i,5}=1;
    else
        dataArray{i,5}=0;
    end
    %weekday_4
     if t(i,1)==5
        dataArray{i,6}=1;
    else
        dataArray{i,6}=0;
     end
     %weekday_5
    if t(i,1)==6
        dataArray{i,7}=1;
    else
        dataArray{i,7}=0;
    end
     %weekday_5
     if t(i,1)==7
        dataArray{i,8}=1;
    else
        dataArray{i,8}=0;
     end
       
end
%Determining the month numbers
 Months=month(t3);
for i2=1:12                
      for  i1=1:size(Months,1)
        if (Months(i1,1)==i2)
            dataArray{i1,i2+8}=1;
        else
            dataArray{i1,i2+8}=0;
        end
      end
end




A={};
for i1=1:size(dataArray,1)
    for i2=1:size(dataArray,2)
        A{i1,i2+3}=dataArray{:,i2} ;
    end
end  


