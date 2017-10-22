

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


[newFullMatrix,newmylabelsTesting] = shufflerows(FullMatrix,mylabelsTesting);

newdata1 = newFullMatrix(1:200,:);
newdata2 = newFullMatrix(201:400,:);



for i=1:100
  if(newmylabels(i) == 3)
    target(1:100,1) = 1;
    target(1:101,2:4) = 0;
  end

  if(newmylabels(i) == 6)
    target(101:200, 1) = 0;
    target(101:200, 2) = 1;
    target(101:200, 3:4) = 0;
  end

  if(newmylabels(i) == 8)
    target(201:300, 1:2) =0;
    target(201:300, 3) = 1;
    target(201:300, 4) = 0;
  end

  if(newmylabels(i) == 1)
    target(301:400, 1:3) = 0;
    target(301:400, 4) = 1;
  end
end



for lambda = -5:10

  [Y,n] = RegLS(10^lambda, FullMatrixTesting, FullMatrix, target);

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










end
end