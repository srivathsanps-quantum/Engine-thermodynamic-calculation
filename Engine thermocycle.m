 length= 'enter the connrod length:';                        %enter the connecting rod length
l=input(length);
stroke='enter the stroke value:';                            %enter the stroke length of the engine under study
stroke=input(stroke);         
bore='enter the bore value:';                                %enter the bore length of the engine
bore=input(bore);
temp= 'enter the inlet temp:';                               %Inlet temperature based on supercharging or not
t1=input(temp);
pressure='enter the inlet pressure:';                        %Inlet pressure 
p1=input(pressure);
a=(stroke)/2;
z=2;
gamma=1.4;
Cp=1005;                                                      %Specific heat
vc= 1.6157e+005;                                              %clearance volume
vsw=0.785*bore*bore*stroke;                                   %swept volume
v1=vc+vsw;                                                    %total volume
for crankangle=180:-1:0                                       %Simulation of compression stroke
    y1= (l*l)-((a*a)* (sind(crankangle)* sind(crankangle)));
     y2= y1^0.5;
     s= (a*cosd(crankangle)) + y2;                            %calculation of distance between crankshaft and piston pin
     vs1= 0.785*bore*bore*(l+a-s);                            %calculation of cylinder volume as a function of crankangle
     v2=vc+vs1;                                               %total volume 
     pdummy(1)=1*10^5;                                        %Initial Pressure in Pa
     vdummy(1)=2.6012*10^6;                                   %Initial Volume@BDC
     p2=pdummy(z-1)*((vdummy(z-1))/(v2))^1.4;                 %Calculation of pressure at compression stroke
     vdummy(z)=v2;                                            %Assigning calculated volume to another variable
     pdummy(z)=p2;                                            %Assigning calculated pressure to another variable
     z=z+1;
end
t2=t1*(p2/p1)^(0.2857);                                       %temperature calculation based on new pressure value
p3=p2;                                                        %constant pressure 
w='enter the heat addition';
q=input(w);
t3=(q/Cp)+t2;                                                 %addition of heat due to combustion
v3=(vc*t3)/t2;                                                %Change in volume due to combustion 
z=2;
prdummy(1)=48.8*10^5;
vodummy(1)=4.2609*10^5;
for crankangle=395:1:540                                      %simulation of power stroke
    y1= (l*l)-((a*a)* (sind(crankangle)* sind(crankangle)));
     y2= y1^0.5;
     s= (a*cosd(crankangle)) + y2;
     vs1= 0.785*bore*bore*(l+a-s);
     v2=vc+vs1;
     p2=prdummy(z-1)*((vodummy(z-1))/(v2))^1.4
     vodummy(z)=v2;
     prdummy(z)=p2;
     z=z+1;
end





pressure=[p1,pdummy,p3,prdummy];
volume=[v1,vdummy,v3,vodummy];
plot(volume,pressure)
xlabel ('Volume (mm^3)')
ylabel ('Pressure (Pa)')
