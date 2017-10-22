ThreeMatrix = data(1000 + randperm(500,100),:);
SixMatrix = data(2500 + randperm(500,100),:);
EightMatrix = data(3500 + randperm(500,100),:);
OneMatrix = data(0 + randperm(500,100),:);

mylabels(1:100) = 3;
mylabels(101:200) = 6;
mylabels(201:300) = 8;
mylabels(301:400) = 1;

FullMatrix = vertcat(ThreeMatrix, SixMatrix, EightMatrix, OneMatrix);

ThreeMatrixTesting = data(1000 + randperm(500,100),:);
SixMatrixTesting = data(2500 + randperm(500,100),:);
EightMatrixTesting = data(3500 + randperm(500,100),:);
OneMatrixTesting = data(0 + randperm(500,100),:);

FullMatrixTesting = vertcat(ThreeMatrixTesting, SixMatrixTesting, EightMatrixTesting, OneMatrixTesting);

mylabelsTesting(1:100) = 3;
mylabelsTesting(101:200) = 6;
mylabelsTesting(201:300) = 8;
mylabelsTesting(301:400) = 1;



target = zeros(400,4);
prediction = zeros(400,4);

target(1:100,1) = 1;
target(1:100,2:4) = 0;

target(101:200,1) = 0;
target(101:200,2) = 1;
target(101:200,3:4) = 0;

target(201:300,1:2) = 0;
target(201:300,3) = 1;
target(201:300,4) = 0;

target(301:400,1:3) = 0;
target(301:400,4) = 1;

[Y,n] = RegLS(10^6, FullMatrixTesting, FullMatrix, target);



for i = 1:400
  max = Y(i,1);
  poz = 1;
  for j=2:4
    if max < Y(i,j)
      max = Y(i,j);
      poz = j;
    end
  end

  if(poz == 1)
    prediction(i) = 3;
  end
  if(poz == 2)
    prediction(i) = 6;
  end
  if(poz == 3)
    prediction(i) = 8;
  end
  if(poz == 4)
    prediction(i) = 1;
  end

end

figure
showdata(FullMatrix, mylabelsTesting, prediction);
%{
figure
showdata(FullMatrix(1:100,:), mylabelsTesting(1:100), prediction(:,1));

figure
showdata(FullMatrix(101:200,:), mylabelsTesting(101:200), prediction(:,2));

figure
showdata(FullMatrix(201:300,:), mylabelsTesting(201:300), prediction(:,3));

figure
showdata(FullMatrix(301:400,:), mylabelsTesting(301:400), prediction(:,4));
%}