
%%This is supervised learning using nearest neighbor classifier with K=3.
%%The training set contains 5000 images, the testing set contains 500 images; each images is 28x28. 
  
%%Reshaping training and testing images
reshaped_imageTrain = reshape(imageTrain,[28*28,5000])
reshaped_imageTrain = transpose(reshaped_imageTrain) % training matrix is now 5000x784
reshaped_imageTest = reshape(imageTest,[28*28,500])
reshaped_imageTest = transpose (reshaped_imageTest) % testing matrix is now 500x784

%%Initializing parameters 
K = 3; % let's consider the 3 nearest neighbors 
size_of_test = size (reshaped_imageTest, 1); 
size_of_train = size (reshaped_imageTrain, 1); 
predictions = zeros(size_of_test, 1); 
euclidean_list = zeros(size_of_test, size_of_train); 
 %matrix will be updated to contain sorted euclidean distances
euclidean_index = zeros(size_of_test, size_of_train); 
 %matrix will be updated to contain the index of sorted euclidean distances
 
 %%Calculating Eucidean distance 
 for test_index=1:size_of_test % take every point of testing data for 500 data points
    for train_index=1:size_of_train %every point of training data for 5000 data points
      distance = (reshaped_imageTest(test_index,:)-reshaped_imageTrain(train_index,:)).^2; 
      euclidean_list(test_index,train_index)=sqrt(sum(distance)); 
    end
 [euclidean_list(test_index,:),euclidean_index(test_index,:)] = sort(euclidean_list(test_index,:)); 
end 
 
%%Finding the K nearest neighbors
knn=euclidean_index(:,1:K); % takes the first 3 smallest or shortest Euclidean distances
for i=1:size(knn,1)
 most_common=mode(labelTrain(knn(i,:)')); 
 %the function 'mode' gives the most occuring value in an array
 predictions(i)=most_common; % the predicted number is stored
end

%%Calculating accuracy rate of classifer 
total_accuracy = size (find(predictions==labelTest),1)/size(labelTest,1)*100; 
disp(total_accuracy)
                             
%%Total error rate of the classifier
total_error = size (find(predictions~=labelTest),1)/size(labelTest,1)*100; 
disp(total_error)
                             
%%Confusion matrix to visualize data 
figure 
Confusion_matrix = confusionchart(labelTest,predictions);
                             
%%error from each class/number
true_labels = labelTest; 
predicted_labels= predictions;
error_class_0 = calc_error(true_labels, predicted_labels,0);                              
error_class_1 = calc_error(true_labels, predicted_labels,1);                             
error_class_2 = calc_error(true_labels, predicted_labels,2);  
error_class_3 = calc_error(true_labels, predicted_labels,3);                              
error_class_4 = calc_error(true_labels, predicted_labels,4);                            
error_class_5 = calc_error(true_labels, predicted_labels,5);
error_class_6 = calc_error(true_labels, predicted_labels,6);                              
error_class_7 = calc_error(true_labels, predicted_labels,7);                            
error_class_8 = calc_error(true_labels, predicted_labels,8);                             
error_class_9 = calc_error(true_labels, predicted_labels,9);
                             
                             
%%function to calculate error rate for each number from 0 to 9
function[error] = calc_error(labelTest, predictions, target_number)
  a = find(labelTest==target_number);
  error = length(find(labelTest(a)~=predictions(a)))/length(labelTest(a))*100 
                             
  %error plot for each class
  figure 
  plot (labelTest(a), 'o'); 
  hold on 
  plot (predictions(a),'x'); 
  legend ('True Labels', 'Predictions within this class'); 
  ylabel('Class'); 
  xlabel('Number of data'); 
  ylim ([0 10]);                           
                             
                             
                             
                             
                             
                   
                            
