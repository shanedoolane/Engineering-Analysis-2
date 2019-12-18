%%
%Part 1
res = 1000;
F=[];
theta = linspace(10,70,res);
L = linspace(0.5,6,res);
for ii = 1:length(theta)
    for jj = 1:length(L)
        F(ii,jj)=abs(1/4-(L(jj)/10*(1-sind(theta(ii))))*((sqrt(1+8*sind(theta(ii))^2))/sind(theta(ii))));
    end
end
figure(1)
clf
contourf(theta, L, F',10);
xlabel('Theta (Degrees)');
ylabel('Length (Meters)');
title('Force in Cylinder, function of Theta and bar length');
colorbar
%%
%Part 2
figure(2)
clf
Freal=F;
for ii = 1:length(theta)
    for jj = 1:length(L)
        if abs(Freal(ii,jj))<0.8 && abs(Freal(ii,jj))>0
                Freal(ii,jj)=1;
        else
               Freal(ii,jj)=0;
        end
    end
end
contourf(theta, L, Freal',10);
xlabel('Theta (Degrees)');
ylabel('Length (Meters)');
title('Acceptable Design Parameters for the Piston');