clc;clear;

data=csvread("data.csv",1,0);
wout=data(:,1).*2.*pi;
magg=10.^(data(:,2)./20);
phasee=data(:,3)*pi/180;

bode1=frd(magg.*exp(1i.*phasee),wout);

sysA = tfest(bode1,2,1)

fig=figure(1);

[z,p,k]=zpkdata(sysA,"v")

sysB=zpk(z,p,k);

bode(bode1,"*",sysA,sysB);
