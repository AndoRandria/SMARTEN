cla (handles.axes3);
m = evalin('base', 'm');
n = evalin('base', 'n');

%_______retrieve the entered values________
t1 = (str2double(get(handles.t1,'string')));
t2 = (str2double(get(handles.t2,'string')));
building = (str2double(get(handles.building,'string')));

%________correct the entry of time parameters___________
if (t1<1)
    set(handles.commentaire,'string','Enter an integer value >= 1');
    set(handles.t1,'string','1');
else
    t1=t1;
    set(handles.t1,'string',t1);
end
if (t2>m)
    force_t2=sprintf('Enter an integer value <=%f', m);
    set(handles.commentaire,'string',force_t2);
    write_t2=sprintf('%f', m);
    set(handles.t2,'string',write_t2);
else
    t2=t2;
    set(handles.t2,'string',t2);
end
if (t1>t2)
    set(handles.commentaire,'string','WARNING! t1 must be inferior to t2!');
    error2=sprintf('%f', m);
    set(handles.t2,'string',error2);
    set(handles.t1,'string','1');
else
    t1=t1;
    set(handles.t1,'string',t1);
    t2=t2;
    set(handles.t2,'string',t2);
end
t1 = (str2double(get(handles.t1,'string')));
t2 = (str2double(get(handles.t2,'string')));

%________correct building number entry___________
if (building<1)
    set(handles.commentaire,'string','Enter an integer value >= 1');
    set(handles.building, 'string','1');
else
    building=building;
    set(handles.building,'string',building);
end
if (building>n)
    force_building=sprintf('Enter an integer value <=%f', n);
    set(handles.commentaire,'string',force_building);
    write_building=sprintf('%f', n);
    set(handles.building,'string',write_building);
else
    building=building;
    set(handles.building,'string',building);
end
building = (str2double(get(handles.building,'string')));

%_________display__________________
RES = evalin('base', 'RES');
STO = evalin('base', 'STO');
EXC = evalin('base', 'EXC');
SP = evalin('base', 'SP');
SC = evalin('base', 'SC');
LH = evalin('base', 'LH');
LB = evalin('base', 'LB');
LR = evalin('base', 'LR');
axes(handles.axes3);
grid on; zoom on; hold on;
b=building;
RES=RES(:,b);
STO=STO(:,b);
EXC=EXC(:,b);
SP=SP(:,b);
SC=SC(:,b);
LH=LH(b);
LB=LB(b);
LR=LR(b);
x=t1:t2;
plot(x,RES(t1:t2),x,STO(t1:t2),x,EXC(t1:t2),x,SP(t1:t2),x,SC(t1:t2),[t1,t2],[LH,LH],':',[t1,t2],[LB,LB],':',[t1,t2],[LR,LR],'-.','LineWidth',1.5)
 legend('Network Extr. (RES)','Storage (STO)','Surplus (EXC)','Production (SP)','Consumption (SC)','Upper limit (LH)','Lower limit (LB)','Network limit (LR)','location','eastoutside')
 xlabel('Time [hours]')
 ylabel('Power [kW]')