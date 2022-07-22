clc;clear;
load data_in_detail_new.mat;
score=nan(302,4);
normalized_score=nan(302,4);
final_score=nan(302,1);

for i=1:302
    score(i,1)=nanmean(P(i,:));
    score(i,2)=nanmean(gP(i,:));
    if(nanstd(sd(i,:))~=0)
        score(i,3)=1/nanstd(sd(i,:));
    end
    score(i,4)=nanmean(st(i,:));
end

for i=1:302
    for j=1:4
        normalized_score(i,j)=50+50*(score(i,j)-min(score(:,j)))/(max(score(:,j))-min(score(:,j)));
    end
end

for i=1:302
    final_score(i)=0.513*normalized_score(i,1)+0.324*normalized_score(i,2)+0.060*normalized_score(i,3)+0.103*normalized_score(i,4);
end
% index=find(isnan(final_score(:,1))~=1);

a=min(final_score);
b=max(final_score);
xlswrite('final_score_q2.xlsx',[score(:,1),normalized_score(:,1),score(:,2),normalized_score(:,2),score(:,3),normalized_score(:,3),score(:,4),normalized_score(:,4),final_score]);
% final_score(isnan(final_score(:,1))==1)=[];
plot(final_score,'xr');