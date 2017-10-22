correctLabels = zeros(50,1);
accuracy = zeros(50,1);

for i=1:50
    for j=1:200
        a = knearest(i, ThreeEightMatrixTesting(j,:), ThreeEightMatrix, mylabelsTesting);
        if a == mylabelsTesting(j)
            correctLabels(i) = correctLabels(i) + 1;
        end
    end
    accuracy(i) = correctLabels(i) / 2; 
end

plot(accuracy);

title('Graph of testing the accuracy as neighbours number varies');
xlabel('Neighbour numbers');
ylabel('Accuracy')
legend('y = knearest(k, testingdata, data, truelabels)','Location','northeast');

