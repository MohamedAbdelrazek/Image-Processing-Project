function snap = Browse_image()
[baseFileName, folder] = uigetfile('*.*','Select An Image');
fullFileName = [folder baseFileName];
snap = imread(fullFileName);
end

