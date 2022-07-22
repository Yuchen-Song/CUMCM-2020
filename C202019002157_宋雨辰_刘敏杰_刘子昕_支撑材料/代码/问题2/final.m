clc;clear;
load possed_data_new.mat;
[num,str,raw]=xlsread('final_score_q2.xlsx',1,'','basic');
temp=char(raw(:,11));
temp=temp(2:end,:);
index=find(temp(:,1)=='a');
jinxiang(1)=sum(mean(income(index,:)))/3;
index=find(temp(:,1)=='b');
jinxiang(2)=sum(mean(income(index,:)))/3;
index=find(temp(:,1)=='c');
jinxiang(3)=sum(mean(income(index,:)))/3;
index=find(temp(:,1)=='d');
jinxiang(4)=sum(mean(income(index,:)))/3;

xlswrite('_.xlsx',jinxiang)