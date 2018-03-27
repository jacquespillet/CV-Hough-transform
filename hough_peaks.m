function peaks = hough_peaks(H, varargin)
    % Find peaks in a Hough accumulator array.
    %
    % Threshold (optional): Threshold at which values of H are considered to be peaks
    % NHoodSize (optional): Size of the suppression neighborhood, [M N]
    %
    % Please see the Matlab documentation for houghpeaks():
    % http://www.mathworks.com/help/images/ref/houghpeaks.html
    % Your code should imitate the matlab implementation.

    %% Parse input arguments
    %p = inputParser;
    %p = p.addOptional('numpeaks', 1, @isnumeric);
    %p = p.addParamValue('Threshold', 0.5 * max(H(:)));
    %p = p.addParamValue('NHoodSize', floor(size(H) / 100.0) * 2 + 1);  % odd values >= size(H)/50
    %p = p.parse(varargin{:});

    numpeaks = 10;
    threshold = 0.5 * max(H(:));
    nHoodSize = floor(size(H) / 100.0) * 2 + 1;

    [width, height] = size(H);
    maxs = zeros(1, numpeaks, 'uint32');
    maxX = zeros(1, numpeaks, 'uint32');
    maxY = zeros(1, numpeaks, 'uint32');
        
    [sortedValues,sortIndex] = sort(H(:),'descend');  
    maxIndex = sortIndex(1:numpeaks);
       
    
    s = [width,height];
    for i=1:numpeaks
      [I,J] = ind2sub(s,sortIndex(i));
      maxX(i) = I;
      maxY(i) = J;
      maxs(i) = H(I, J);    
    end
   peaks = [maxX; maxY];
   
endfunction
