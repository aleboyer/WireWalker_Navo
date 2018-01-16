% Process Wirewalker data

% NOTE: The paths below aka /User/drew/Google Drive/... must be manually
% changed in order for this processing to work. Please edit this with the
% machine you intend to do the data processing with onboard, and practice
% with the data collected during the San Diego training cruise.

% Please contact Drew Lucas ajlucas@ucsd.edu, 858-886-6505, or Arnaud
% LeBoyer aleboyer@ucsd.edu if you have questions.
%%
%Code to add the necessary paths to the processing scripts. 
%
%of the processing software folder
addpath(fullfile(cd,'Toolbox/'))
addpath(fullfile(cd,'Toolbox/rsktools'))
addpath(fullfile(cd,'Toolbox/seawater'))


%% USER PART (define by user)

WWmeta.rbrpath='/Users/drew/Google Drive/NAVO/NAVO_SIO_training/rbr/'; % path for raw WW data
WWmeta.aqdpath='/Users/drew/Google Drive/NAVO/NAVO_SIO_training/aqd/'; % path for raw Nortek Signature data
WWmeta.name_rbr='NAVO_rbr'; % Name of the rbr
WWmeta.name_aqd='NAVO_aqd'; % Name of the Nortek Signature
WWmeta.root_script='/Users/drew/Google Drive/WireWalker1-master/'; % root
WWmeta.WWpath='/Users/drew/Google Drive/NAVO/NAVO_SIO_training/L1/'; %path to the processed data
WWmeta.WW_name='NAVO1'; % "name" of the Wirewalker (use NAVO1 and NAVO2)
WWmeta %display what has been entered

save([WWmeta.root_script 'Meta_mission.mat'],'WWmeta');

cd(WWmeta.root_script) %change directory to the location...

%% process rbr
process_rbr(WWmeta) % running the processing scripts to read the raw data, store as matlab files
create_profiles_rbr(WWmeta) % select only the upcasts, store each one individually in the 
%...profiles.mat file in the .WWpath folder
create_grid_rbr(WWmeta) % grid the Wirewalker data to a depth and time grid.
%... Depth bins are 0.25 m by default. Time is the center time point of each profile. 
%...Note that this means that time is NOT even spaced in this approach to gridding.

%% process aqd

% SIO is still working on this. We will improve these scripts after the
% first test. Please allow SIO to process current meter data.

% process_aqd_2G(WWmeta)
% create_profiles_aqd_2G(WWmeta)
% create_grid_aqd_2G(WWmeta)
% 
% 
