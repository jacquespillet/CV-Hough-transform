function H = hough_circles_acc(BW, radius)
  [width,height] = size(BW);
  H = zeros(width, height, 180);

  for x = 1:width
    for y = 1:height
      element = BW(x, y);
      if element != 0
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
  
  figure, imagesc(H(:, :, radius))
endfunction
