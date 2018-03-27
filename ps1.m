% ps1
pkg load image;  % Octave only

%% 1-a
%img = imread('input/ps1-input0.png');  % already grayscale
%img_edges = edge(img, 'canny');

%imwrite(img_edges, fullfile('output', 'ps1-1-a-1.png'));  % save as output/ps1-1-a-1.png

%% 2-a
%[H, theta, rho] = hough_lines_acc(img_edges);  % defined in hough_lines_acc.m
%[H2, theta] = houghtf(img_edges);
%figure, imagesc(H);
%figure, imagesc(H2);

%% 2-b
%peaks = hough_peaks(H, 8)  % defined in hough_peaks.m
%figure, imagesc(H);
%hough_lines_draw(img_edges, 'output', peaks, rho, theta);


%3-a
%noise_img = imread('input/ps1-input0-noise.png');
%h = fspecial('gaussian', 20, 5);
%filtered = imfilter(noise_img, h);

%3-b
%noise_edges = edge(noise_img, 'canny');
%filtered_edges = edge(filtered, 'canny');

%3-c
%[H, theta, rho] = hough_lines_acc(filtered_edges);  
%peaks = hough_peaks(H, 8);
%hough_lines_draw(filtered_edges, 'output', peaks, rho, theta);

%4-a
%img3 = rgb2gray(imread('input/ps1-input1.png'));
%h = fspecial('gaussian', 20, 5);
%filtered_img3 = imfilter(img3, h);
%4-b
%img3_edges = edge(filtered_img3, 'canny');
%figure, imshow(img3_edges);
%[H, theta, rho] = hough_lines_acc(img3_edges);  
%figure, imagesc(H);

%figure, imagesc(H);
%peaks = hough_peaks(H, 8)
%hough_lines_draw(img3, 'output', peaks, rho, theta);

%5-a
%img3 = rgb2gray(imread('input/ps1-input1.png'));
%h = fspecial('gaussian', 20, 5);
%filtered_img3 = imfilter(img3, h);
%img3_edges = edge(filtered_img3, 'canny');
%figure, imshow(img3_edges);
%H = hough_circles_acc(img3_edges, 20);
%peaks = hough_peaks(H(:, :, 20), 8)

%5-b
img3 = rgb2gray(imread('input/ps1-input1.png'));
h = fspecial('gaussian', 20, 5);
filtered_img3 = imfilter(img3, h);
img3_edges = edge(filtered_img3, 'canny');
[centers, radiuses] = find_circles(img3_edges, [20 50]);