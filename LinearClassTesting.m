accuracy = zeros(10,50);
correct = zeros(10,1);
for k = 1:2
    ThreeMatrixTesting1 = data(1000 + randperm(500,100),:);
    EightMatrixTesting1 = data(3500 + randperm(500,100),:);

    ThreeEightMatrixTesting1 = vertcat(ThreeMatrixTesting1, EightMatrixTesting1);
    
    mylabelsTesting1(1:100) = 3;
    mylabelsTesting1(100:200) = 8;

    target = zeros(200,1);
    target(1:100) = 1;
    target(101:200) = -1;



    [Y,n] = RegLS(0,ThreeEightMatrixTesting1, ThreeEightMatrix, target);

    predictions = zeros(50,1);

    for i = 1:200
      if Y(i) > 0
        predictions(i) = 3;
      else
        predictions(i) = 8;
      end
    end

    figure
    showdata(ThreeEightMatrix, mylabelsTesting1, predictions);


    for j=1:200
      a = knearest(1, ThreeEightMatrixTesting(j,:), ThreeEightMatrix, mylabelsTesting);
      predictions(j) = a;        
    end

  figure
  showdata(ThreeEightMatrix, mylabelsTesting, predictions);

    
end
