function[error] = calc_error(labelTest, predictions, target_number)
 a = find(labelTest==target_number); 
 error = length(find(labelTest(a)~=predictions(a)))/length(labelTest(a))*100; 
 
%error plot for each class
 figure 
 plot (labelTest(a), 'o'); 
 hold on 
 plot (predictions(a),'x'); 
 legend ('True Labels', 'Predictions within this class','Location','NorthEastOutside'); 
 ylabel('Class');
 xlabel('Number of sample data'); 
 ylim ([0 10]);
end
