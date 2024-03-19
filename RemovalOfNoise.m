

% Initialize a list to store the image data
images = cell(1, nfiles);

% Read each image and store it in the list
for ii = 1:nfiles
    currentfilename = fullfile(img_dir, imagefiles(ii).name);
    currentimage = imread(currentfilename);
    

    

    % This converts the image to double, so that we can easily perform
    % mathematical operations on the image.
    img_double = im2double(currentimage);
    
    % Applies bilateral filter
    sigma_spatial = 2; % Spatial standard deviation
    sigma_intensity = 0.2; % Intensity standard deviation
    filtered_img = imbilatfilt(img_double, sigma_intensity,  sigma_spatial);
    
    % Calculate PSNR
    psnr_value = psnr(filtered_img, img_double);
    fprintf('PSNR after bilateral filtering: %.2f dB\n', psnr_value);

    

    images{ii} = currentimage;
end






