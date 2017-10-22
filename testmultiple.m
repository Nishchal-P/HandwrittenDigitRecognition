

for k=1:5

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



for lambda = -5:10

  [Y,n] = RegLS(10^lambda, FullMatrixTesting, FullMatrix, target);

    count = 0;
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

      for i=1:400
        if mylabelsTesting(i) == prediction(i)
            count= count + 1;
        end
      end
    
    accuracyX(k,lambda + 6) = count / 4 ;











end
end

figure
meanAccX = sum(accuracyX) ./ 5;
stDeviation = std(accuracyX);
errorbar(-5:10,meanAccX,stDeviation);

title('Graph of standard deviation of the accuracy');
xlabel('Neighbour numbers');
ylabel('Standard deviation');
legend('y = knearest(k, testingdata, data, truelabels)','Location','southwest');