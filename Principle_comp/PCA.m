%%Principle components algorithm for entire data set
  
%Preparing training data: Rows are number of samples, columns 
%are features or dimension of training data
data = transpose(reshape (imageTrain, [28*28,5000])); 

%Find the mean 
data_mean = mean(data, 1); % taking means of features 
data_mean = data_mean(ones(1,size(data,1)),:); 

%Find covariant 
data_cov = ((data-data_mean)'*(data-data_mean))/(size(data,1)-1); 
            
%Get diagonal and arrage from largest to smallest 
[prin_com, eig_val] = eig(data_cov);
eig_val = diag(eig_val);
[hold_val, idx] = sort(eig_val, 1, 'descend');
            
eig_val = eig_val(idx,1); %the top 10 eig values locate in the first 10 columns
prin_com= prin_com(:,idx); %top 10 PC locates in the first 10 columns

%%Displaying the top 10 principle component for entire data set

% extract the top 10 PC
top_10_PC = prin_com(:,1:10); 
for i = 1:10
 subplot(2,5,i),axis image
 imshow(reshape(normalize(top_10_PC(:,i)), [28,28])); 
end 

figure 
plot (eig_val); 
xlabel('Features/dimension'); 
ylabel("Eigenvalues")
title("Eigenvalues vs. dimensions")
ylim([0 inf])
