%Import the table into Matlab and name it 'table'
table = readtable('text_emotion_data_filtered.csv');
%Extract the features and labels
%Feature = Content
features = table2array(table(:,2));
%Label = Sentiment
labels = categorical(table2array(table(:,1)));

%tokenize our tweets
documents = tokenizedDocument(features);
%Make our bag of words
bag = bagOfWords(documents);
%Remove all stop words from our current bag of words
newBag = removeWords(bag,stopWords);
%Remove all words that occur less than 100 times from our bag
newerBag = removeInfrequentWords(newBag,100);
%tfidf for newer bag
M1 = tfidf(newerBag);
M2 = full(M1);

%3.3 training 
trainingMatrix = M2(1:6432, :);
trainingLabels = labels(1:6432, :);
%testing
testingMatrix = M2(6433:height(M2), :);
testingLabels = labels(6433:height(labels), :);

%3.4 evaluation
%
figure(1)
subplot(1,3,1)
%K-nearest neighbour algorithm
knnmodel = fitcknn(trainingMatrix,trainingLabels);
predictions = predict(knnmodel, testingMatrix);
knAccuracy = sum(predictions==testingLabels)/height(testingLabels)
confusionchart(testingLabels, predictions);
title('K-Nearest Neighbour - 37.94%');

bayes = fitcnb(trainingMatrix,trainingLabels);
predictionsTwo = predict(bayes, testingMatrix);
bayesAccuracyTwo = sum(predictionsTwo==testingLabels)/height(testingLabels)
subplot(1,3,2);
confusionchart(testingLabels, predictionsTwo);
title('Bayes - 30.47%');

decisionTreeModel = fitctree(trainingMatrix,trainingLabels);
predictionsThree = predict(decisionTreeModel, testingMatrix);
decisionAccuracyThree = sum(predictionsThree==testingLabels)/height(testingLabels)
subplot(1,3,3);
confusionchart(testingLabels, predictionsThree);
title('Decision Tree - 45.58%');

%plotted confusion charts for all three
