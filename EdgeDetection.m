

% Initialize a list to store the image data
images = cell(1, nfiles);

% Read each image and store it in the list
for ii = 1:nfiles
    currentfilename = fullfile(img_dir, imagefiles(ii).name);
     
    
    currentimage = imread(currentfilename);



     % Convert the image to grayscale if it's color
    if size(currentimage, 3) == 3
        currentimage = rgb2gray(currentimage);
    end
   

    
    
    % Perform histogram equalization
    equalized_image = histeq(currentimage);  
 
    
    % Apply Canny edge detection
    edges = edge(equalized_image, 'Canny', [0.1 0.3]); % You can adjust the thresholds as needed
    
    % Display the original image and the edges
    figure;
    subplot(1, 2, 1);
    imshow(image_matrix);
    title('Histogram equalized image');
    axis off;
    
    subplot(1, 2, 2);
    imshow(edges);
    title('Edges (Canny)');
    axis off;
    
    % Save the edge-detected image
    imwrite(edges, 'xray_edges.jpg');
    
    disp('Edge-detected image saved as xray_edges.jpg');

 
  
    

    images{ii} = currentimage;
end

