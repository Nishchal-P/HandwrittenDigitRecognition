accuracy = zeros(10,50);
for k = 1:10
    ThreeMatrixTesting1 = data(1000 + randperm(500,100),:);
    EightMatrixTesting1 = data(3500 + randperm(500,100),:);

    ThreeEightMatrixTesting1 = vertcat(ThreeMatrixTesting1, EightMatrixTesting1);
    
    mylabelsTesting1(1:100) = 3;
    mylabelsTesting1(100:200) = 8;

    errors1 = zeros(50,1);
    
    for i=1:50
        for j=1:200
            a = knearest(i, ThreeEightMatrixTesting1(j,:), ThreeEightMatrix, mylabelsTesting1);
            if a == mylabelsTesting1(j)
                errors1(i) = errors1(i) + 1;
            end
        end
        accuracy(k,i) = errors1(i) / 2;
    end
end




figure
average = sum(accuracy) ./ 10;
plot(average);

title('Graph of average accuracy');
xlabel('Neighbour numbers');
ylabel('Average')
legend('y = knearest(k, testingdata, data, truelabels)','Location','northeast');



figure
stDeviation = std(accuracy);
errorbar(1:50,average,stDeviation);

title('Graph of standard deviation of the accuracy');
xlabel('Neighbour numbers');
ylabel('Standard deviation')
legend('y = knearest(k, testingdata, data, truelabels)','Location','northeast');

