clc;clear;
load data_in_detail.mat;
profit=nan(123,3);
profit_increasing_rate=nan(123,2);
for i=1:123
    for j=1:3
        profit(i,j)=P(i,j*2-1)+P(i,j*2);
    end
    for k=1:2
        profit_increasing_rate(i,k)=(profit(i,k+1)-profit(i,k))/profit(i,k);
    end
end
xlswrite('_.xls',[profit,profit_increasing_rate])