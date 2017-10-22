correctLabels = zeros(50,1);
accuracy = zeros(50,1);

for i=1:50
    for j=1:200
        a = knearest(i, ThreeEightMatrix(j,:), ThreeEightMatrix, mylabels);
        if a == mylabels(j)
           correctLabels(i) =correctLabels(i) + 1;
        end
    end
    accuracy(i) = correctLabels(i) / 2;
end

figure

plot(accuracy);

title('Graph of accuracy as neighbours number varies');
xlabel('Neighbour numbers');
ylabel('Accuracy')
legend('y = knearest(k, x, data, truelabels)','Location','northeast');

