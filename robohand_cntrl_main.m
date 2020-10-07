clc;
Ax=0.02; Ay=0.005; wd=2*pi;
t0 = 0; tf = 10;
x0=[0;0;0;0;0;0;0;0;0;0;0];

[t,x] = ode23(@robohand_cntrl,[t0,tf],x0);
xd=Ax*sin(wd*t);
yd=0.06+Ay*cos(wd*t);
plot(t,xd,t,x(:,1));
figure(2)
plot(t,yd,t,x(:,2));
figure(3)
plot(t,x(:,3));
figure(4)
plot(t,x(:,7));
figure(5)
plot(t,x(:,9));


