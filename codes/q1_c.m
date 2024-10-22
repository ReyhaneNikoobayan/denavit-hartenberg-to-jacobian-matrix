syms denevit jv jw H0_n;
syms theta1 d1 d2;


denevit=[theta1+pi/2,0,0,0;
  0,d1+22.5,pi/2,45;
   0,d2+30,0,0];

mafsal=[theta1;d1;d2];
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

