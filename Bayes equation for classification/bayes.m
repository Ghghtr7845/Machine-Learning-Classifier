%Initializing parameters

sigma = eye (784, 784); %sigma is equal to sigma inverse 
det_sigma = det(sigma); 
log_value = 784*log(2*pi); %dimension = 784
log_PY = log(1/10); % N = 10 classes from 0 to 9
bayes_list = zeros (500,10); %will be updated to contain the Bayes probabilities
bayes_index = zeros(500, 10); %will be updated to contain the indexes of Bayes probability, useful in sorting 
reshape_imageTrain = reshape(imageTrain,[28*28,5000]); %each column now contains a whole training image, rows are features
reshape_imageTest = reshape(imageTest,[28*28,500]); %each column now contains a whole testing image, rows are features

%Implementation of the Bayes equation to find the maximum probability
for test_index = 1: length(labelTest)
 for class_index = 1 : 10
  part_1 = (reshape_imageTest(:, test_index) - mean_vector_matrix(:, class_index))'; 
  part_2 = (reshape_imageTest(:, test_index) - mean_vector_matrix(:, class_index )); 
  bayes_list(test_index, class_index) = (-1/2)*part_1*(sigma)* part_2 -(1/2)*log_value - (1/2)*log(det_sigma)+log_PY; 
      %bayes_list now contains probability for all 10 classes
 end 
 
 [bayes_list(test_index,:), bayes_index(test_index, :)] =sort(bayes_list(test_index, :), 'descend');
 %sorts the Bayes probability from largest to smallest to locate the
 %the maximum number and the index of that maximum number
 
end 

predictions = bayes_index(:,1)-1;
%the first column contains the index of the max Bayes value.
%subtract by 1 because class begins at 0 but index begins at 1.
%predictions holds that the Bayes Decision Rule has predicted each digit to be
