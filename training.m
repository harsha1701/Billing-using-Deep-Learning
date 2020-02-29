function training()
    images=uigetdir();
    files=dir(images);
    labeldir=[files.isdir];
    labels=files(labeldir);
    n=length(labels);
    allImages = imageDatastore(images, 'IncludeSubfolders', true, 'LabelSource', 'foldernames');
    [trainingImages, testImages] = splitEachLabel(allImages, 0.8, 'randomize');
    alex = alexnet;
    layers = alex.Layers;
    layers(23) = fullyConnectedLayer(n-2);
    layers(25) = classificationLayer;
    opts = trainingOptions('sgdm', 'InitialLearnRate', 0.001, 'MaxEpochs', 40, 'MiniBatchSize', 10);
    trainingImages.ReadFcn = @readFunctionTrain;
    %trainingImages.ReadFcn = @(loc)imresize(imread(loc),inputSize);
    %imshow(preview(trainingImages));
    %testImages.ReadFcn = @(loc)imresize(imread(loc),inputSize);
    myNet = trainNetwork(trainingImages, layers, opts);
    testImages.ReadFcn = @readFunctionTrain;
    predictedLabels = classify(myNet, testImages);
    accuracy = mean(predictedLabels == testImages.Labels);
    save("trained.mat");
end