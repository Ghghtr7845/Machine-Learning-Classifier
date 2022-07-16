function [centroid_matrix, iter] = k_means_cluster (init_means, k, data)
imageTrain = reshape(data, [28*28, 5000]); % every column contains a whole image, columns are features

length_data = length(imageTrain);
cluster = zeros(1,length_data); % will contain the 10 clusters or classes, each column is the index of the image data
old_cluster = cluster; % cluster will change each iteration until it stops changing 

%initializing some counters
iter = 0; %counts how many times items clusters change 
stop_point = false; %a stop point is required to tell data to stop calculating means
mean_size= size(init_means,1); %784
  
while stop_point == false 
  %calculate the norm distance 
 for i = 1:length_data
  eucl_dist = zeros (1,k); % this will be updated continuously as we go through each data point
  for j= 1: k
    distance = (imageTrain(:,i)-init_means(:,j)).^2; 
    eucl_dist(j)= sqrt(sum(distance)); % will be updated 
  end 
  [~,index] = min(eucl_dist); 
  cluster(i) = index; 
 end %end of outer for loop
 
  %updating the centroids to get final means
  init_means = zeros(mean_size, k); 
  for j = 1:k
    init_means(:,j)= mean(imageTrain(:,(cluster==j)),2);% means function was approved to use 
  end 
  if old_cluster == cluster
   stop_point = true ; 
  end 
  old_cluster = cluster; 
  iter = iter+1; 
end %end of while loop

 centroid_matrix = init_means; 
 
end %end of function 
