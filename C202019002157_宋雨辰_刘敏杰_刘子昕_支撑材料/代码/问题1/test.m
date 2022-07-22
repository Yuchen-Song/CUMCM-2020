clc;clear;
[churn_rate,str,raw]=xlsread('../../C/excel3.xlsx',1,'','basic');
% A=100000000;
maxLoan_rate=zeros(3,1);
pb=[1 0.937 0.874];
lr=[0.04,0.0425:0.004:0.1465,0.15];
num=zeros(3,1);
numI=[27 39 30];
Ltv=zeros(3,1);
Ue=zeros(3,1);
ret=[];
for a=10:10:100
    maxEbp=0;
    for loan_rate1=lr
        for loan_rate2=lr
            for loan_rate3=lr
                Ebp=0;
                %main
                Br=[loan_rate1,loan_rate2,loan_rate3];
                for i=1:3
                    num(i)=numI(i)*(1-churn_rate(abs(churn_rate(:,1)-Br(i))<1e-5,i+1));
                    Ltv(i)=a*num(i);
                    Ue(i)=(1+Br(i))*pb(i)-1;
                    Ebp=Ebp+Ltv(i)*Ue(i);
                end
                if(maxEbp<Ebp)
                    maxEbp=Ebp;
                    maxLoan_rate=Br;
                end
                
            end
        end
    end
    ret=[ret;maxEbp,a,maxLoan_rate];
    
end
xlswrite('_.xlsx',ret);
