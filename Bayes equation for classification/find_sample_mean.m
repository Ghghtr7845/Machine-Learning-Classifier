function [sample_mean_vector, mean_image] = find_mean(labelTrain, imageTrain, target_digit)
index = find (labelTrain == target_digit); %find the index that contain the targetted digit 
index_length = length (index); % gives how many of that targetted number is present 
image_list = imageTrain (:, :, index); % pull training images index that is classified as targetted digit
reshape_image_list = reshape (image_list, [28*28,index_length]);

%reshaping the image to 784 x index_length. Every columns of the matrix now contains info of each image. 
%This will be use in Bayes equation as mu 
%To find the mean, sum up all values present in sample and divide by sample population 

sample_mean_vector = (1/index_length)*(sum (reshape_image_list, 2)); 
mean_image = reshape(sample_mean_vector, [28,28]);
%Presents a blurred/average image of each digit 
figure
image(mean_image); 
end
