for k=1:5

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
    if newmylabels(i + 100) == 3 && Y(i) > 0 || newmylabels(i + 100) == 8 && Y(i) < 0
        count= count + 1;
    end
  end
  accuracy(k,j + 6) = count;

end
end
meanAcc = sum(accuracy) ./ 5;
figure
stDeviation = std(accuracy);
errorbar(-5:10,meanAcc,stDeviation);

title('Graph of standard deviation of the accuracy');
xlabel('Neighbour numbers');
ylabel('Standard deviation');
legend('y = knearest(k, testingdata, data, truelabels)','Location','southwest');