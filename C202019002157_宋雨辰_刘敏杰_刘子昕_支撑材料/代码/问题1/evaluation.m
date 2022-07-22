clc;clear;
load data_in_detail.mat;
score=nan(123,5);
normalized_score=nan(123,5);
final_score=nan(123,1);
final_score_without_credit=nan(123,1);
%find credit rating(C5)
[num,str,raw]=xlsread('../../C/excel1.xlsx',1,'','basic');
credit=char(raw(:,3));
temp=credit(2:end,:);
score(temp(:,1)=='A',5)=100;
score(temp(:,1)=='B',5)=80;
score(temp(:,1)=='C',5)=60;
score(temp(:,1)=='D',5)=20;

for i=1:123
    score(i,1)=nanmean(p(i,:));
    score(i,2)=nanmean(gi(i,:));
    if(nanstd(sd(i,:))~=0)
        score(i,3)=1/nanstd(sd(i,:));
    end
    score(i,4)=nanmean(st(i,:));
end

for i=1:123
    for j=1:4
        normalized_score(i,j)=50+50*(score(i,j)-min(score(:,j)))/(max(score(:,j))-min(score(:,j)));
    end
end

for i=1:123
    final_score(i)=0.359*normalized_score(i,1)+0.114*normalized_score(i,2)+0.083*normalized_score(i,3)+0.144*normalized_score(i,4)+0.3*score(i,5);
    final_score_without_credit(i)=0.359*normalized_score(i,1)+0.114*normalized_score(i,2)+0.083*normalized_score(i,3)+0.144*normalized_score(i,4);
end
index=find(isnan(final_score(:,1))~=1);

a=min(final_score);
b=max(final_score);
% xlswrite('final_score_raw1.xlsx',[score(:,1),score(:,2),score(:,3),score(:,4),score(:,5),final_score]);
% xlswrite('final_score_normalized1.xlsx',[normalized_score(:,1),normalized_score(:,2),normalized_score(:,3),normalized_score(:,4),score(:,5),final_score]);
% xlswrite('final_score_without_credit1.xlsx',[normalized_score(:,1),normalized_score(:,2),normalized_score(:,3),normalized_score(:,4),final_score_without_credit]);
% final_score(isnan(final_score(:,1))==1)=[];
plot(final_score,'x');