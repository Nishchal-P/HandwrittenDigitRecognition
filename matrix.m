ThreeEightMatrix = zeros(200,256);
mylabelsTesting1 = zeros(200,1);


mylabels = zeros(200,1);

ThreeEightMatrixTesting = zeros(200,256);
mylabelsTesting = zeros(200,1);

ThreeMatrix = data(1000 + randperm(500,100),:);
EightMatrix = data(3500 + randperm(500,100),:);

ThreeEightMatrix = vertcat(ThreeMatrix, EightMatrix);
mylabels(1:100) = 3;
mylabels(101:200) = 8;


ThreeMatrixTesting = data(1000 + randperm(500,100),:);
EightMatrixTesting = data(3500 + randperm(500,100),:);

ThreeEightMatrixTesting = vertcat(ThreeMatrixTesting, EightMatrixTesting);


for i =1:100
    mylabelsTesting(i) = 3;
end

for i=101:200
    mylabelsTesting(i) = 8;
end

