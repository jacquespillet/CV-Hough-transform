function [H, theta, rho] = hough_lines_acc(BW, varargin)
    [width,height] = size(BW); %Taille de l'image
    D = norm([width height]); %Distance maximale
    
    theta = (0:0.01:pi); %Tableau des angles
    numThetas = numel(theta); %Nombre d'élements dans theta
    
    distances = (0:1:D);
    numDistances = numel(distances);
    
    thetasResult = {};
    distancesResult = {};
    
    A = zeros(numDistances*2, 180);
    
    for x = 1:width
      for y = 1:height
        element = BW(x, y);
        if element != 0
          for teta=1:180
            distance = D + x * cos(teta * pi / 180) - y * sin(teta * pi / 180);
            if distance >0
              A(ceil(distance), teta) += 1;
            end
          end
        end  
      end
    end
    H=A;
    rho = distances;
    %% TODO: Your code here
endfunction
