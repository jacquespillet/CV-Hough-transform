function [centers, radii] = find_circles(BW, radius_range)
  [width,height] = size(BW);
  H = zeros(width, height, 180);

  for x = 1:width
    for y = 1:height
      element = BW(x, y);
      if element != 0
        for(radius = radius_range(1):1:radius_range(2))
          for theta=1:180
            a = x - radius * cos(theta) + radius*2;
            b = y + radius * sin(theta) + radius*2;
            if a > 0 && b > 0 && a < width && b < height 
              H(floor(a), floor(b), radius) += 1;
            end
          end
        end
      end
    end
  end
  
  
  numpeaks = 10;
  
  [width, height, depth] = size(H)
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
 peaks = [maxX; maxY]
endfunction
