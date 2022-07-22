clc;clear;
load possed_data_new.mat;
P=nan(302,3);%????
p=nan(302,3);%?????
gi=nan(302,2);%?????
gP=nan(302,2);%??????
sd=nan(302,3);%?????
st=nan(302,3);%???????
for i=1:302
    for d=1:3
        if((sales(i,d)~=0)&&(income(i,d)~=0))
            P(i,d)=sales(i,d)-income(i,d);
            p(i,d)=P(i,d)/sales(i,d);
            sd(i,d)=income(i,d)/sales(i,d);
        end
        if(sales(i,d)~=0)
            st(i,d)=(1-refund(i,d)/sales(i,d));
        end
    end
    for r=1:2
        if((sales(i,r+1)~=0)&&(sales(i,r)~=0))
            gi(i,r)=(sales(i,r+1)-sales(i,r))/sales(i,r);
        end
        if((P(i,r+1)~=0)&&(P(i,r)~=0))
            gP(i,r)=(P(i,r+1)-P(i,r))/P(i,r);
        end
    end
end
% xlswrite('P.xlsx',P)
% xlswrite('p_.xlsx',p)
% xlswrite('gi.xlsx',gi)
% xlswrite('gP.xlsx',gP)
% xlswrite('sd.xlsx',sd)
% xlswrite('st.xlsx',st)
save data_in_detail_new