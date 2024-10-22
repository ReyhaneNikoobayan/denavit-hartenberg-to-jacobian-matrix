syms denevit jv jw H0_n speed;
syms theta1 theta2 d3;

denevit=[theta1,31,pi/2,0;
   pi/2+theta2,0,pi/2,0;
   0,d3+30,0,0];

mafsal=[theta1;theta2;d3];
[H0_n,jv,jw]=jacob(denevit,mafsal);

jv=simplify(jv);
jw=simplify(jw);

disp('jw');
disp(jw);

disp('jv');
disp(jv);

a=det(jv);
equ=a==0;
s=simplify(a);

disp('detjv');
disp(s);

ve=[15;10;5];
speed=[];
speed_=inv(jv)*ve;
speed_=simplify(speed_);


for i=(0:4:80)*pi/180
    for j=(-45:4:45)*pi/180
        for k=10:0.5:20
            R=subs(speed_,[theta1,theta2,d3],[i,j,k]);
            speed=[speed,R]; 
            
        end
    end
end

v1=vpa(speed(1,:),3);
v2=vpa(speed(2,:),3);
v3=vpa(speed(3,:),3);

max_v1=max(abs(v1));
max_v2=max(abs(v2));
max_v3=max(abs(v3));

disp('maxv1 maxv2 maxv3')
disp([max_v1 max_v2 max_v3])

