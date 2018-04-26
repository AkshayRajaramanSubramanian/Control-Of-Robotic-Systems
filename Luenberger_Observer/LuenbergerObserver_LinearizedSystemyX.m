A = [0 1 0 0 0 0;0 0 -1 0 -1 0;0 0 0 1 0 0;0 0 -0.55 0 -0.05 0;0 0 0 0 0 1;0 0 -0.1 0 -1.1 0];
B = [0; 0.001;0; 0.00005;0;0.0001];
C = [1 0 0 0 0 0];
Cc = C;
D = [0];
Dc = D;
L = place(A',C',[.1 .2 .3 .4 .5 .6])'; 
x = [-1;0;0.1;0;0.1;0];
xhat = [0;0;0;0;0;0];
XX =x;
XXhat = xhat;
T = 40;
UU = (0.1)*ones(1,T);
for k = 0:T-1
    u = UU(k+1);
    y = (Cc*x)+(Dc*u);
    yhat = (Cc*xhat)+(Dc*u);
    x = (Ac*x)+(Bc*u);
    xhat = (Ac*xhat)+(Bc*u)+(L*(y-yhat));
    XX = [XX,x];
    XXhat = [XXhat,xhat];
end
figure();
subplot(3,1,1);
plot(0:T,[XX(1,:);XXhat(1,:)]);
subplot(3,1,2);
plot(0:T,[XX(2,:);XXhat(2,:)]);
subplot(3,1,3);
plot(0:T,[XX(3,:);XXhat(3,:)]);