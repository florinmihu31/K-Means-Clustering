% computes the NC centroids corresponding to the given points using K-Means
function centroids = clustering_pc(points, NC)
	centroids = [];
	% TODO K-Means code 
	% initializarea maximelor si minimelor
  minimum = min(points);
  maximum = max(points);
  % initializarea centroizilor
  centroids = ones(NC, 3) .* rand(NC, 3);
  for i = 1 : length(centroids(:,1))
    centroids(i, :) = centroids(i, :) .* (maximum .- minimum);
    centroids(i, :) = centroids(i, :) + minimum;
  endfor
  difference = 1.;
  while difference > 0
    atr = [];
    % gasirea distantei minime
    for dis = 1 : length(points(:, 1));
      minimumDiff = (points(dis, :) .- centroids(1,:));
      minimumDiff = minimumDiff * minimumDiff';
      curAtr = 1;
      % atribuirea in functie de distanta fata de centroizi
      for c = 2 : NC;
        diffC = (points(dis, :) .- centroids(c, :));
        diffC = diffC * diffC';
        if minimumDiff >= diffC
          curAtr = c;
          minimumDiff = diffC;
        endif
      endfor
      atr = [atr; curAtr];
    endfor
    % salvarea vechiului centroid
    old = centroids;
    % refacerea noilor puncte
    centroids = zeros(NC, 3);
    pts = zeros(NC, 1);
    for dis = 1: length(atr);
      centroids(atr(dis), :) = centroids(atr(dis), :) + points(dis, :);
      pts(atr(dis), 1) ++;
    endfor
    for c = 1: NC;
      if pts(c, 1) != 0 
        centroids(c , :) = centroids(c, :) / pts(c, 1);
      else
        % reinitializarea noului centroid
        centroids(c, :) = (rand(1, 3) .* (maximum .- minimum)) + minimum;
      end
    endfor
    difference = sum (sum((centroids .- old) .^2));
  endwhile
end