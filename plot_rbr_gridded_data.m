% Created on Tue Jan 16 06:40:27 2018
% Plot RBR gridded data. 
% Note: It has to be launch from the folder where Meta data structure 
% from process_navo was saved. default: root_script
% @author: aleboyer@ucsdu.edu


load('Meta_mission.mat','WWmeta');
load([WWmeta.WWpath WWmeta.WW_name '_grid.mat'],'RBRgrid')

RBRgrid.info
disp('Choose a field to plot (Depth-time grid)')
disp('####')
disp(fields(RBRgrid).')
F=input('Field:','s');

figure;
pcolor(RBRgrid.time,RBRgrid.z,RBRgrid.(F));

if (F(1)=='v')
    str_title=Data_struct.info.(F);
else
    str_title=F;
end
title([WWmeta.WW_name '|' str_title],'Fontsize',20)
datetick
xlabel(['Start Time:' datestr(RBRgrid.time(1))],'Fontsize',20)
ylabel('Depth','Fontsize',20)
shading interp
colorbar
axis ij
