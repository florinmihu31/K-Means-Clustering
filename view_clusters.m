% outputs a graphical representation of the clustering solution
function view_clusters(points, centroids)
	% TODO graphical representation coded here 
  % salvarea marimilor matricelor
  [linPts colPts] = size(points);
  [linCentr colCentr] = size(centroids);
  % initializarea culorilor
  colour = viridis(3 * linCentr + 20);
  % parcurgerea matricelor si determinarea distantei minime a fiecarui punct
  for ptsIdx = 1 : linPts
    minDist = Inf;
    for centrIdx = 1 : linCentr
        dis = sqrt((points(ptsIdx, 1) - centroids(centrIdx, 1))^2 + (points(ptsIdx, 2) - centroids(centrIdx, 2))^2 + (points(ptsIdx, 3) - centroids(centrIdx, 3))^2);
      if dis < minDist
        minDist = dis;
        clusN = centrIdx;
      endif
    endfor
    % functie de reprezentare a punctelor colorate corespunzator
    scatter3(points(ptsIdx, 1), points(ptsIdx, 2), points(ptsIdx, 3), [], colour(3 * clusN));
    hold on;
  endfor
end

