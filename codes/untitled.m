syms theta1 theta2 theta3 L1 L2 L3 jv;
jv=[-sin(theta1)*cos(theta2)-sin(theta1)*cos(theta2+theta3),-sin(theta2)*cos(theta1)-L2*cos(theta1)*sin(theta2+theta3),-L2*sin(theta2+theta3)*cos(theta1);
    L1*cos(theta1)*cos(theta2)+L2*cos(theta1)*cos(theta2+theta3),-L1*sin(theta2)*sin(theta1)-L2*sin(theta1)*sin(theta2+theta3),-L2*sin(theta2+theta3)*sin(theta1);
    L1*cos(theta1),L2*cos(theta2+theta3),L2*cos(theta2+theta3)];
s=det(jv) ;
s=subs(s,[L1,L2],[1,1]);
simplify(s)
equ=s==0;
[a,b,c]=solve(equ);