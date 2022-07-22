clc;clear;
load prepossed_data.mat;
% devide the data into different firms
first_half_of_year=[1,2,3,4,5,6];
second_half_of_year=[7,8,9,10,11,12];
income=zeros(302,6);%row:firm; col:half years
sales=zeros(302,6);
refund=zeros(302,6);
for i=1:302
    %extract info for single firm from whole data
    temp=char(data_for_income(:,1));
    temp=temp(2:end,2:end);
    temp=str2num(temp);
    index=find(temp(:,1)==i+123);
    %income_data(i)=data_for_income(index,:);
    a=data_for_income(index+1,:);
    %income_data=[income_data;a];
    %devide to periods of half year
    date=cell2mat(a(:,2));
    date=x2mdate(date);
    month_=month(date);
    year_=year(date);
    for d=1:length(index)
        money=cell2mat(a(d,3));
        if(ischar(money))
            money=str2double(money);
        end
        if(year_(d)==2017 && ismember(month_(d),first_half_of_year) )
            income(i,1)=income(i,1)+money;
        elseif(year_(d)==2017 && ismember(month_(d),second_half_of_year))
            income(i,2)=income(i,2)+money;
        elseif(year_(d)==2018 && ismember(month_(d),first_half_of_year))
            income(i,3)=income(i,3)+money;
        elseif(year_(d)==2018 && ismember(month_(d),second_half_of_year))
            income(i,4)=income(i,4)+money;
        elseif(year_(d)==2019 && ismember(month_(d),first_half_of_year))
            income(i,5)=income(i,5)+money;
        elseif(year_(d)==2019 && ismember(month_(d),second_half_of_year))
            income(i,6)=income(i,6)+money;
        end
    end
    
    temp=char(data_for_sales(:,1));
    temp=temp(2:end,2:end);
    temp=str2num(temp);
    index=find(temp(:,1)==i+123);
    b=data_for_sales(index+1,:);
    date=cell2mat(b(:,2));
    date=x2mdate(date);
    month_=month(date);
    year_=year(date);
    for d=1:length(index)
        money=cell2mat(b(d,3));
        if(ischar(money))
            money=str2double(money);
        end
        if(year_(d)==2017 && ismember(month_(d),first_half_of_year) )
            sales(i,1)=sales(i,1)+money;
            if(money<0)
                refund(i,1)=refund(i,1)-money;
            end
        elseif(year_(d)==2017 && ismember(month_(d),second_half_of_year))
            sales(i,2)=sales(i,2)+money;
            if(money<0)
                refund(i,2)=refund(i,2)-money;
            end
        elseif(year_(d)==2018 && ismember(month_(d),first_half_of_year))
            sales(i,3)=sales(i,3)+money;
            if(money<0)
                refund(i,3)=refund(i,3)-money;
            end
        elseif(year_(d)==2018 && ismember(month_(d),second_half_of_year))
            sales(i,4)=sales(i,4)+money;
            if(money<0)
                refund(i,4)=refund(i,4)-money;
            end
        elseif(year_(d)==2019 && ismember(month_(d),first_half_of_year))
            sales(i,5)=sales(i,5)+money;
            if(money<0)
                refund(i,5)=refund(i,5)-money;
            end
        elseif(year_(d)==2019 && ismember(month_(d),second_half_of_year))
            sales(i,6)=sales(i,6)+money;
            if(money<0)
                refund(i,6)=refund(i,6)-money;
            end
        end
    end
end
% xlswrite('income.xls',income);
% xlswrite('sales.xls',sales);
% xlswrite('refund.xls',refund);
save ('possed_data.mat','income','sales','refund');

