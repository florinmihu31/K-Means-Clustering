function view_cost_vs_nc(file_points)
	% TODO compute cost for NC = [1..10] and plot 
  % initializarea matricei cu valorile din fisier
  matrAux = load(file_points);
  % transformarea unei structuri intr-o matrice
  points = cell2mat(struct2cell(matrAux));
  % parcurgerea a zece clustere diferite si initializarea centroizilor si a costurilor 
  for currIdx = 1 : 10
    centroids = clustering_pc(points, currIdx);
    cost = compute_cost_pc(points, centroids);
    costs (currIdx) = cost;
  endfor
  % reprezentarea grafica a costului total in functie de numarul de clustere
  plot([1:10], costs);
end

