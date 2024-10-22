function[H0_n,jv,jw]=jacob(denevit,mafsal)
 syms H0_n
 for i=1:size(denevit,1)
    if i==1
        H0_n=Rot('z',denevit(i,1))*Trans('Z',denevit(i,2))*Rot('x',denevit(i,3))*Trans('x',denevit(i,4));
    else   
        H0_n=H0_n*Rot('z',denevit(i,1))*Trans('Z',denevit(i,2))*Rot('x',denevit(i,3))*Trans('x',denevit(i,4));
    end
 end    

 syms O0Oe jv;
 O0Oe=[H0_n(1,4);H0_n(2,4);H0_n(3,4)];

 for j=1:3
    for k=1:size(mafsal,1)
       jv(j,k)=diff(O0Oe(j),mafsal(k));
    end
 end    

 syms R0_n jw;
 R0_n=H0_n(1:3,1:3);

 for k=1:size(mafsal,1)
     jw(1,k)=0;
     for j=1:3
           jw(1,k)=jw(1,k)+diff(R0_n(3,j),mafsal(k))*R0_n(2,j);
     end
 end

 for k=1:size(mafsal,1)
     jw(2,k)=0;
     for j=1:3
           jw(2,k)=jw(2,k)+diff(R0_n(1,j),mafsal(k))*R0_n(3,j);   
     end
 end

 for k=1:size(mafsal,1)
     jw(3,k)=0;
     for j=1:3
           jw(3,k)=jw(3,k)+diff(R0_n(2,j),mafsal(k))*R0_n(1,j);     
     end
 end     
end
           
