vc=1.61*10^5;                                                   %clearance volume
l= input ('enter the connecting rod length :');                 %263 -connecting rod length
stroke = input('enter the stroke length:');                     %165.1 - stroke length value
a=stroke/2;                                                     %a values aids in the stroke length calculation i.e. stroke = a*2
bore=input ('enter the bore value:');                           %137.2 - Bore value
z=1;                                                  
for crankangle=0:1:720
    y1(z)= (l*l)-((a*a)* (sind(crankangle)* sind(crankangle)));
    y2(z)= y1(z)^0.5;
    s(z)= (a*cosd(crankangle)) + y2(z);                        % calculation of distance between crankshaft and piston pin. 
    vs1(z)= 0.785*bore*bore*(l+a-s(z));                        % calculation of cylinder volume as a function of crankangle.  
    v2(z)=(vc+vs1(z));                                         % Total volume
    crankanglee(z)=crankangle;
    volume(z)=v2(z);
    z=z+1;
end

plot(crankanglee,v2)
xlabel('Crankangle (deg)')
ylabel('Volume (mm^3)')
    
