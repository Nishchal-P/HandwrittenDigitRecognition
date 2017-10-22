SixMatrix = data(2500 + randperm(500,100),:);
ThreeEightSixMatrix = vertcat(ThreeEightMatrix, SixMatrix);

ThreeMatrixTesting = data(1000 + randperm(500,100),:);
SixMatrixTesting = data(2500 + randperm(500,100),:);
EightMatrixTesting = data(3500 + randperm(500,100),:);

ThreeEightSixMatrixTesting = vertcat(ThreeMatrixTesting, EightMatrixTesting, SixMatrixTesting);



mylabelsTesting(1:100) = 3;
mylabelsTesting(101:200) = 8;
mylabelsTesting(201:300) = 6;

predictions = zeros(50,1);


for j=1:300
    a = knearest(1, ThreeEightSixMatrixTesting(j,:), ThreeEightSixMatrix, mylabelsTesting);
    predictions(j) = a;        
end

figure
showdata(ThreeEightSixMatrixTesting, mylabelsTesting, predictions);

[confusionMatrix,order] =  confusionmat(mylabelsTesting, predictions)

