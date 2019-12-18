%the purpose of this section is to plot the value of thetac and pc for
%0<alpha<5pi/12 and k=500 N/m
k = 500;
alpha = linspace(0,5*pi/12,1000);
thetac=acos((cos(alpha).^(1/3)));
l=1./cos(alpha);
pc=2.*(k.*((1./cos(alpha))-(1./cos(thetac))).*sin(thetac));
%plot functions
figure(1);
clf
suptitle('Critical Values of P and Theta as functions of Alpha');
subplot(1,2,1);
plot(alpha,thetac);xlabel('Alpha (rad)');ylabel('Theta Critical (rad)');title('Theta Critical vs Alpha');
subplot(1,2,2);
plot(alpha,pc);xlabel('Alpha (rad)');ylabel('P Critical (N)');title('P Critical vs Alpha');

%%part 5
k = linspace(0,750,750);
l0 = linspace(0,2,750);
c = zeros(length(k),length(l0));
for ii=1:length(l0)
   for kk = 1:length(k)
       alpha = acos(1/l0(ii));
       theta = acos(cos(alpha)^(1/3));
       p = 2*k(kk)*((1/cos(alpha))-(1/cos(theta)))*sin(theta);
       if p<500 && p>250
           c(kk,ii)=p;
       end
   end
end

figure(2);
clf
contourf(l0,k,c,10)
title('Possible Solutions Using Constraints');xlabel('L0 (M)');ylabel('k (N/m)');
colorbar