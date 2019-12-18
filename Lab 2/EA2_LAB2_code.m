res=1000;
bx = linspace(-0.6,1,res);
by = linspace(-0.4,1.2,res);
M=[bx;by;zeros(1,res)];
eac=[-1;-1;1.75]./sqrt(((-1)^2)+((-1)^2)+((1.75)^2));
ead=[1.5-0;-0.75-0;0+1.75]./sqrt(((1.5)^2)+((0.75)^2)+((1.75)^2));
Tab=[];Tac=[];Tad=[];
%%
%Tension Calculation
for ii=1:res%bx, bx(ii)
   for jj=1:res%by by(jj)
       eab=[bx(ii)/(sqrt((bx(ii)^2)+(by(jj)^2)+(1.75^2)));...
           by(jj)/(sqrt((bx(ii)^2)+(by(jj)^2)+(1.75^2)));...
           1.75/(sqrt((bx(ii)^2)+(by(jj)^2)+(1.75^2)));];
       A=[eab,eac,ead];
       b=[0;0;6.4];
       Tmat=A\b;
       Tab(ii,jj) = Tmat(1);
       Tac(ii,jj) = Tmat(2);
       Tad(ii,jj) = Tmat(3);
   end
end
%%
%Price Calculation
%price =Tab*length of ab^2
lengthmat=ones(res,res);
pricemat=[];
for ii=1:res%bx,bx(ii)
    for jj=1:res%by,by(jj)
        if lengthmat(ii,jj)~=0
            lengthmat(ii,jj)=sqrt(((bx(ii)-0)^2)+((by(jj)-0)^2)+(0+1.75)^2);
        end
    end
end
lengthmat=lengthmat.^2;
pricemat=lengthmat.*Tab;
optprice = min(min(pricemat));
[xmin,ymin]=find(abs(pricemat)==min(min(abs(pricemat))));
%%
%Tension Trimming
%this block removes solutions that contain a negative tension value after
%finding the minimum price location
for ii=1:res%x, bx(ii)
   for jj=1:res%y,by(jj)
       if Tab(ii,jj) < 0||Tac(ii,jj) < 0||Tad(ii,jj) < 0
           pricemat(ii,jj)=0;
       end
   end
end
fprintf('The optimum price for cable AB is proportional to a price of $%.2f.\n',optprice);
fprintf('The Bx and By coordinates of this price are (%.2f,%.2f)\n',bx(xmin),by(ymin));


figure(4)
contourf(bx,by,pricemat',100);%
xlabel('Bx (meters)');
ylabel('By (meters)');
title('Proportional Price of Cable AB');
colorbar;
colormap(jet(1000));
%%
%Plotting
%Cable AB
figure(1)
contourf(bx,by,Tab',500,'EdgeColor','none','LineStyle','none');%,'EdgeColor','none','LineStyle','none'
xlabel('Bx (meters)');
ylabel('By (meters)');
zlabel('Tension in Cable AB (kN)');
title('Tension in Cable AB as a function of Bx and By');
colorbar;
colormap(jet(1000));

%Cable AC
figure(2)
contourf(bx,by,Tac',500,'EdgeColor','none','LineStyle','none');%,'EdgeColor','none','LineStyle','none'

xlabel('Bx (meters)');
ylabel('By (meters)');
zlabel('Tension in Cable AC (kN)');
title('Tension in Cable AC as a function of Bx and By');
colorbar;
colormap(jet(1000));

%Cable AD
figure(3)
contourf(bx,by,Tad',500,'EdgeColor','none','LineStyle','none');%,'EdgeColor','none','LineStyle','none'

xlabel('Bx (meters)');
ylabel('By (meters)');
zlabel('Tension in Cable AD (kN)');
title('Tension in Cable AD as a function of Bx and By');
colorbar;
colormap(jet(1000));