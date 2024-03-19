%Reads the image into the project.

img_dir = 'C:\Users\slang\Documents\Dataing\ComputerVision\archive\test\images\';

% This finds all the files in the directry specified of the filetype jpg
imagefiles = dir(fullfile(img_dir, '*.jpg')); 

% Number of files found
nfiles = length(imagefiles); 


