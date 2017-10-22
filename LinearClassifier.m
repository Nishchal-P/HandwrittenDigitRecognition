target = zeros(200,1);
target(1:100) = 1;
target(101:200) = -1;



[Y,n] = RegLS(0,ThreeEightMatrixTesting, ThreeEightMatrix, target);


for i = 1:200
  if Y(i) > 0
    predictions(i) = 3;
  else
    predictions(i) = 8;
  end
end


showdata(ThreeEightMatrix, mylabelsTesting, predictions)