%%
%Question 1
a = linspace(20,70,1000);
t = [];
for ii=1:length(a)
    a(ii)=a(ii)*(pi/180);
    d0=0.1/(tan(a(ii)/2));
    t(ii)=(9.8*((d0*sin(a(ii)))+((d0+0.2)*sin(a(ii)))+((d0+0.4)*sin(a(ii))))+((3*9.81)*cot(a(ii))*(d0)))/sin(pi/2-a(ii));
end
figure(1);clf;plot(a,t);title('Tension in cable CB as a function of alpha');
xlabel('Alpha (Radian)');
ylabel('Tension (Newton)');
j=find(t==min(min(t)));
fprintf('The optimal angle for alpha is %.2f radians or %.2f degrees.\n',a(j),a(j)*180/pi);
fprintf('The tension at this point is %.2f Newtons\n',t(j));
%%
%Question 2
alphavals=20:1:70;
g=length(alphavals);
betavals=20:1:90;
h=length(betavals);
tvals2=zeros(h,g);
count2=1;
count3=1;
for jj=20:1:70
    for kk=20:1:90
        T2=(2.94+5.88*sind(jj) + (2.94*cotd(jj)/tand(jj/2)))/sind(180-jj-kk);  %solve for tension values
        tvals2(count2, count3)=T2;
        count2=count2+1;
    end
    count3=count3+1;
    count2=1;

end
figure(2);
surfc(alphavals,betavals,tvals2);
xlabel('Alpha (Degrees)');
ylabel('Beta (Degrees)');
zlabel('Tension (Newton)')
title('Tension as a function of Alpha and Beta');