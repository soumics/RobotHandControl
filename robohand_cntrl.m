function xdot=robohand_cntrl(t,x)
X0=[x(1);x(2);x(3)];
X0dot=[x(4);x(5);x(6)];
X1=X0; X2=X0dot;
m0=x(7); i0=x(8);

Ax=0.02; Ay=0.005; wd=2*pi;
Kp=diag([400,2500,4]);
Kd=diag([2,5,0.004]);
F=diag([10,0.0025]);
lamda=25;

xd=Ax*sin(wd*t);
yd=0.06+Ay*cos(wd*t);
phid=0;

xddot=Ax*wd*cos(wd*t);
yddot=-Ay*wd*sin(wd*t);
phiddot=0;

xddotdot=-Ax*wd^2*sin(wd*t);
yddotdot=-Ay*wd^2*cos(wd*t);
phiddotdot=0;

Xd=[xd;yd;phid];
Xddot=[xddot;yddot;phiddot];
Xddotdot=[xddotdot;yddotdot;phiddotdot];

e=[X0-Xd];
edot=[X0dot-Xddot];
M0_hat=[m0 0 0;0 m0 0;0 0 i0];
Y=[Xddotdot(1) 0;Xddotdot(2) 0;0 Xddotdot(3)];

s=edot+lamda*e;
u=M0_hat*Xddotdot-Kd*edot-Kp*e;

X1dot=X2;
X2dot=u;
adot=-inv(F)*Y'*s;
xdot=[X1dot;X2dot;adot;u];
