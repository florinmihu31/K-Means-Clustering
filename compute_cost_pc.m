% computes a clustering solution total cost
function cost = compute_cost_pc(points, centroids)
	cost = 0; 
	% TODO compute clustering solution cost
  % salvarea marimilor matricelor
  [linCentr colCentr] = size(centroids);
  [linPts colPts] = size(points);
  % parcurgerea matricelor si determinarea distantei minime a fiecarui punct
  for ptsIdx = 1 : linPts
    minDist = Inf;
    for centrIdx = 1 : linCentr
      dis = sqrt((points(ptsIdx, 1) - centroids(centrIdx, 1))^2 + (points(ptsIdx, 2) - centroids(centrIdx, 2))^2 + (points(ptsIdx, 3) - centroids(centrIdx, 3))^2);
      if dis < minDist
        minDist = dis;
      endif
    endfor
    % determinarea costului
    cost = cost + minDist;
  endfor
end