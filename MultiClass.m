ThreeMatrix = data(1000 + randperm(500,100),:);
SixMatrix = data(2500 + randperm(500,100),:);
EightMatrix = data(3500 + randperm(500,100),:);
ZeroMatrix = data(4500 + randperm(500,100):);

mylabels(1:100) = 3;
mylabels(101:200) = 6;
mylabels(201:300) = 8;
mylabels(301:400) = 0;

FullMatrix = vertcat(ThreeMatrix, SixMatrix, EightMatrix, ZeroMatrix);

ThreeMatrixTesting = data(1000 + randperm(500,100),:);
SixMatrixTesting = data(2500 + randperm(500,100),:);
EightMatrixTesting = data(3500 + randperm(500,100),:);
ZeroMatrixTesting = data(4500 + randperm(500,100):);

FullMatrixTesting = vertcat(ThreeMatrixTesting, SixMatrixTesting, EightMatrixTesting, ZeroMatrixTesting);

mylabelsTesting(1:100) = 3;
mylabelsTesting(101:200) = 6;
mylabelsTesting(201:300) = 8;
mylabelsTesting(301:400) = 0;
