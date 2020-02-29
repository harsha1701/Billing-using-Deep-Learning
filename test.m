function  label=test(I,net)
    inputSize = net.Layers(1).InputSize;
    I = imresize(I,inputSize(1:2));
    [label,scores] = classify(net,I);
%     [~,idx] = sort(scores,'descend');
%     idx = idx(4:-1:1);
%     classNamesTop = net.Layers(end).ClassNames(idx);
%     scoresTop = scores(idx);
%     figure
%     barh(scoresTop)
%     xlim([0 1])
%     title('Top 5 Predictions')
%     xlabel('Probability')
%     yticklabels(classNamesTop)
end