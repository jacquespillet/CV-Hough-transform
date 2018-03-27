  function hough_lines_draw(img, outfile, peaks, rho, thetas)
    % Draw lines found in an image using Hough transform.
    %
    % img: Image on top of which to draw lines
    % outfile: Output image filename to save plot as
    % peaks: Qx2 matrix containing row, column indices of the Q peaks found in accumulator
    % rho: Vector of rho values, in pixels
    % theta: Vector of theta values, in degrees
    [width,height] = size(img); %Taille de l'image
    D = norm([width height]); %Distance maximale
    figure, imshow(img);
    hold on
    
    for i=1:size(peaks)(2);
      rho = double(peaks(1, i)) - D;
      theta = double(peaks(2, i) - 90);   
      
      if rho < 0
        x = - rho * cos(theta * pi / 180);
        y = -rho * sin(theta * pi / 180); 
      else 
        y = rho * sin(theta * pi / 180);
        x = rho * cos(theta * pi / 180);
      end
      
      
      
      
      x1 = (x-500 * (sin(theta * pi / 180)));
      y1 = (y+500 * (cos(theta * pi / 180)));
 
      x2 = (x+500 * (sin(theta * pi / 180)));
      y2 = (y-500 * (cos(theta * pi / 180)));
            
      plot([x1, x2], [y1, y2], 'Color', 'r', 'LineWidth', 2)      
    end
    
    % TODO: Your code here
endfunction
