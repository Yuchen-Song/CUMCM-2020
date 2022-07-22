clc;clear;
%load data from excel
[num_for_income,str_for_income,data_for_income]=xlsread('../../C/excel2.xlsx',2,'','basic');
[num_for_sales,str_for_sales,data_for_sales]=xlsread('../../C/excel2.xlsx',3,'','basic');
%delete invalid incoice
% zuo=data_for_income{12,4}(1);
% temp=char(data_for_income(:,4));
% index=find(temp(:,1)==zuo);
% data_for_income(index,:)=[];
% 
% temp=char(data_for_sales(:,4));
% index=find(temp(:,1)==zuo);
% data_for_sales(index,:)=[];
save ('prepossed_data.mat','data_for_income','data_for_sales');