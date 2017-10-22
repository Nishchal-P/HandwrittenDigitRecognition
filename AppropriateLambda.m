[newThreeEightMatrix,newmylabels] = shufflerows(ThreeEightMatrix,mylabels);

newdata1 = newThreeEightMatrix(1:100,:);
newdata2 = newThreeEightMatrix(101:200,:);


target = zeros(100,1);
for i=1:100
  if(newmylabels(i) == 3)
    target(i) = 1;
  else 
    target(i) = -1;
  end
end
for j=-5:10
  [Y,n] = RegLS(10^j, newdata2, newdata1, target);

  count = 0;
  for i = 1:100
    if Y(i) > 0
      predictions(i) = 3;
    else
      predictions(i) = 8;
    end
  end

  for i = 1:100
    if abs(predictions(i) - labelsR(i)) < 0.5
      count= count + 1;
    end
  end
  accuracy(j + 6) = count;

end
figure

plot(sum(accuracy) ./ 16);