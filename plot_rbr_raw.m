% Created on Tue Jan 16 05:18:27 2018
% Plot RBR raw data. 
% Note: It has to be launch from the folder with Meta data structure 
% from process_navo was saved. default: root_script
% @author: aleboyer@ucsdu.edu


load('Meta_mission.mat','WWmeta');
load(fullfile(WWmeta.root_script,[WWmeta.name_rbr  '.mat']))

eval(['Data_struct=' WWmeta.name_rbr]);
Data_struct.info

disp('Choose a field to plot (time serie)')
disp('####')
disp(fields(Data_struct).')
F=input('Field:','s');

figure;
plot(Data_struct.time,Data_struct.(F),'linewidth',3);

if (F(1)=='v')
    str_title=Data_struct.info.(F);
else
    str_title=F;
end
title(str_title,'Fontsize',20)
datetick
xlabel(['Start Time:' datestr(Data_struct.time(1))],'Fontsize',20)
ylabel(str_title,'Fontsize',20)

