clc;clear;
[churn_rate,str,raw]=xlsread('../../C/excel3.xlsx',1,'','basic');
syms A x y
% A=100000000;
maxEbp=0;
maxLoan_rate=0;
pb=[1 0.937 0.874];
Br=[0.04,0.0425:0.004:0.1465,0.15];
num=zeros(3,1);
numI=[27 39 30];
Ltv=zeros(3,1);
Ue=zeros(3,1);
maxll(1)=A;
maxll(4)=0;
for a=10:10:100
    for loan_rate=Br
        for b=0.1:0.05:0.6
            Ebp=0;
            equ1= b*A==(x-y)*(1-pb(2))+y*(1-pb(3));
            equ2= x*(1-pb(2))==y*(1-pb(3));
            [maxll(2),maxll(3)]=solve(equ1,equ2,x,y);
            for i=1:3
                num(i)=numI(i)*(1-churn_rate(abs(churn_rate(:,1)-loan_rate)<1e-5,i+1));
                Ltv(i)=a*num(i);
                Ue(i)=(1+loan_rate)*pb(i)-(1+Br(i))*(1-pb(i))-1;
                Ebp=Ebp+Ltv(i)*Ue(i);
            end
            if(maxEbp<Ebp)
                maxEbp=Ebp;
                maxLoan_rate=loan_rate;
            end
        end
        
    end
    
    
end