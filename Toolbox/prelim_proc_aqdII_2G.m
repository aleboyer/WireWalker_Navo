function prelim_proc_aqdII_2G(WWmeta)
% prelim processing of the AQDII data from

%load and transform aqdII data
disp(WWmeta.aqdpath)
f=dir([WWmeta.aqdpath '*.mat']);
fprintf('be carefull at the order of file in dir(%s*ad2cp*.mat) \n',WWmeta.aqdpath)
beg=zeros(1,length(f));
cell_Data=struct([]);
for l=1:length(f)
    load([WWmeta.aqdpath f(l).name])
    beg(l)=Data.Burst_Time(1);
    cell_Data{l}=Data;
    cell_Config{l}=Config;
end
[~,I]=sort(beg);
Fields=fields(Data);
AllData=[cell_Data{I}];

AllData1=struct();
for f=1:length(Fields)
    field=Fields{f};
    AllData1.(field)=vertcat(AllData(:).(field));
end
    
eval([WWmeta.name_aqd '=AllData1;']);
save([WWmeta.aqdpath WWmeta.name_aqd '.mat'],WWmeta.name_aqd, '-v7.3')
