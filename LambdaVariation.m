count = zeros(16,1);
accuracy = zeros(20,16);

for k=1:20
  target = zeros(200,1);
  target(1:100) = 1;
  target(101:200) = -1;

  

for j=-5:10
  ThreeMatrixTesting1 = data(1000 + randperm(500,100),:);
  EightMatrixTesting1 = data(3500 + randperm(500,100),:);

  ThreeEightMatrixTesting1 = vertcat(ThreeMatrixTesting1, EightMatrixTesting1);
  [Y,n] = RegLS(10^j,ThreeEightMatrixTesting1, ThreeEightMatrix, target);

  count = 0;
  for i = 1:200
    if Y(i) > 0
      predictions(i) = 3;
    else
      predictions(i) = 8;
    end
  end

  for i = 1:200
    if predictions(i) == mylabels(i)
      count= count + 1;
    end
  end
  accuracy(k,j+6) = count/2;

end
end

average = sum(accuracy) ./ 20;


figure
stDeviation = std(accuracy);
errorbar(-5:10,average,stDeviation);

title('Plot regularised least squares model accuracy');
xlabel('log10 ( lambda ) ');
ylabel('Accuracy ( % )')
legend('y = RegLS(lambda, testingdata, data, target)','Location','southeast');
