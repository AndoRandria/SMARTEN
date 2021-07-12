function varargout = smarten_v1(varargin)
% SMARTEN_V1 MATLAB code for smarten_v1.fig
%      SMARTEN_V1, by itself, creates a new SMARTEN_V1 or raises the existing
%      singleton*.
%
%      H = SMARTEN_V1 returns the handle to a new SMARTEN_V1 or the handle to
%      the existing singleton*.
%
%      SMARTEN_V1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SMARTEN_V1.M with the given input arguments.
%
%      SMARTEN_V1('Property','Value',...) creates a new SMARTEN_V1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before smarten_v1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to smarten_v1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help smarten_v1

% Last Modified by GUIDE v2.5 17-Dec-2019 20:06:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @smarten_v1_OpeningFcn, ...
                   'gui_OutputFcn',  @smarten_v1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before smarten_v1 is made visible.
function smarten_v1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to smarten_v1 (see VARARGIN)

% Choose default command line output for smarten_v1
handles.output = hObject;
handles.output = hObject;
axes (handles.axes2);
imshow('piment.png');
axes (handles.axes1);
imshow('ur.jpg');
axes (handles.axes4);
imshow('logo.jpg');
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes smarten_v1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = smarten_v1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in simulate.
function simulate_Callback(hObject, eventdata, handles)
% hObject    handle to simulate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.commentaire,'string','Please wait...');
choixstrategy=get(handles.strategy1,'Value');
    n = evalin('base', 'n');
    m = evalin('base', 'm');
    SC = evalin('base', 'SC');
    SP = evalin('base', 'SP');
    LR = evalin('base', 'LR');
    LH = evalin('base', 'LH');
    LB = evalin('base', 'LB');
    STOin = evalin('base', 'STOin');
if (choixstrategy == 1)
    run ('Pilotage_espace_bati_pierrot.m');
    assignin('base','RES',RES);
    assignin('base','STO',STO);
    assignin('base','EXC',EXC);
else
    P_max_charge = evalin('base', 'P_max_charge');
    P_max_decharge = evalin('base', 'P_max_decharge');
    rend_r = evalin('base', 'rend_r');
    rend_bat = evalin('base', 'rend_bat');
    rend_ond = evalin('base', 'rend_ond');
    ond_out_max = evalin('base', 'ond_out_max');
    ond_in_max = evalin('base', 'ond_in_max');
    run ('Pilotage_espace_bati_nasser.m');
    assignin('base','RES',RES);
    assignin('base','STO',STO);
    assignin('base','EXC1',EXC1);
    assignin('base','EXC',EXC2);
end
set(handles.commentaire,'string','The simulation is DONE! Push the "Export results" to get your result file. Push the "Show graph" button to show the result graph on a time basis','ForegroundColor',[0.4 0.8 0]);


function t1_Callback(hObject, eventdata, handles)
% hObject    handle to t1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t1 as text
%        str2double(get(hObject,'String')) returns contents of t1 as a double


% --- Executes during object creation, after setting all properties.
function t1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function t2_Callback(hObject, eventdata, handles)
% hObject    handle to t2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t2 as text
%        str2double(get(hObject,'String')) returns contents of t2 as a double


% --- Executes during object creation, after setting all properties.
function t2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.t1,'string','1');
set(handles.t2,'string','24');
set(handles.building,'string','1');
set(handles.commentaire,'string','Welcome into SMARTEN V1.0 by Piment Lab. To run a simulation, please select a strategy.','ForegroundColor','k');
clc;
cla (handles.axes3);
evalin( 'base', 'clearvars *' ); %supprime tous les variables dans le workspace

% --- Executes on button press in afficher.
function afficher_Callback(hObject, eventdata, handles)
% hObject    handle to afficher (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in import_production.
function import_production_Callback(hObject, eventdata, handles)
% hObject    handle to import_production (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
production = uiimport('-file');
SP= production.data(:,:);
assignin('base','SP',SP);
set(handles.commentaire,'string','Your production file is ready for use. Push the "Consumption system" button to import your consumption file. This can take few minutes, please wait.');


% --- Executes on button press in import_consumption.
function import_consumption_Callback(hObject, eventdata, handles)
% hObject    handle to import_consumption (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
consumption = uiimport('-file');
SC= consumption.data(:,:);
assignin('base','SC',SC);
[m,n]=size(SC);
n=n;
m=m;
assignin('base','n',n);
assignin('base','m',m);
set(handles.commentaire,'string','Your consumption file is ready for use. Push the "Parameters" button to import your parameter file.');



% --- Executes on button press in parameters.
function parameters_Callback(hObject, eventdata, handles)
% hObject    handle to parameters (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
param = uiimport('-file');
choixstrategy=get(handles.strategy1,'Value');
if (choixstrategy == 1)
    LR = param.data(:,6);
    assignin('base','LR',LR);
    LH = param.data(:,7);
    assignin('base','LH',LH);
    LB = param.data(:,8);
    assignin('base','LB',LB);
    STOin = param.data(:,9);
    assignin('base','STOin',STOin);
    set(handles.commentaire,'string','Your parameter file is ready for use. Push the "Simulate" button to run the simulation. This can take few minutes, please wait.');
else
    rend_r = param.data(:,1);
    assignin('base','rend_r',rend_r);
    rend_bat = param.data(:,2);
    assignin('base','rend_bat',rend_bat);
    rend_ond = param.data(:,3);
    assignin('base','rend_ond',rend_ond);
    ond_out_max = param.data(:,4);
    assignin('base','ond_out_max',ond_out_max);
    ond_in_max = param.data(:,5);
    assignin('base','ond_in_max',ond_in_max);
    LR = param.data(:,6);
    assignin('base','LR',LR);
    LH = param.data(:,7);
    assignin('base','LH',LH);
    LB = param.data(:,8);
    assignin('base','LB',LB);
    STOin = param.data(:,9);
    assignin('base','STOin',STOin);
    set(handles.commentaire,'string','Your parameter file is ready for use. Push the "Charging file" button to import the charging file. This can take few minutes, please wait.');
end





% --- Executes on button press in export.
function export_Callback(hObject, eventdata, handles)
% hObject    handle to export (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
choixstrategy=get(handles.strategy1,'Value');
if (choixstrategy == 1)
RES = evalin('base', 'RES');
STO = evalin('base', 'STO');
EXC = evalin('base', 'EXC');
export='D:\smarten_results.xlsx';
xlswrite(export,RES,'Network extraction (RES)');
xlswrite(export,STO,'Storage (STO)');
xlswrite(export,EXC,'Energy Surplus (EXC)');
else
RES = evalin('base', 'RES');
STO = evalin('base', 'STO');
EXC1 = evalin('base', 'EXC1');
EXC2 = evalin('base', 'EXC');
export='D:\smarten_results.xlsx';
xlswrite(export,RES,'Network extraction (RES)');
xlswrite(export,STO,'Storage (STO)');
xlswrite(export,EXC1,'Energy Surplus 1 (EXC1)');
xlswrite(export,EXC2,'Energy Surplus 2 (EXC2)');
end
set(handles.commentaire,'string',...
'Congratulations! Your results file is exported to D:\smarten_results.xlsx. Push "Reset" button to run a new simulation.');


% --- Executes on button press in graph.
function graph_Callback(hObject, eventdata, handles)
% hObject    handle to graph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
choixstrategy=get(handles.strategy1,'Value');
if (choixstrategy == 1)
    run ('graphic_pierrot.m');
else
    run ('graphic_nasser.m');
end
set(handles.commentaire,'string','Your graph is displayed below. Use the scroll and the right-click button of your mouse to zoom the graph. Change the Building N° and the display time and then push the "Show graph" button to plot again. Push the "Reset" button to run a new simulation');


function building_Callback(hObject, eventdata, handles)
% hObject    handle to building (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of building as text
%        str2double(get(hObject,'String')) returns contents of building as a double


% --- Executes during object creation, after setting all properties.
function building_CreateFcn(hObject, eventdata, handles)
% hObject    handle to building (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in charge.
function charge_Callback(hObject, eventdata, handles)
% hObject    handle to charge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
charge = uiimport('-file');
P_max_charge= charge.data(:,:);
assignin('base','P_max_charge',P_max_charge);
set(handles.commentaire,'string','Your charging file is ready for use. Push the "Discharging file" button to import the discharging file. This can take few minutes, please wait.');

% --- Executes on button press in discharge.
function discharge_Callback(hObject, eventdata, handles)
% hObject    handle to discharge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
decharge = uiimport('-file');
P_max_decharge= decharge.data(:,:);
assignin('base','P_max_decharge',P_max_decharge);
set(handles.commentaire,'string','Your discharging file is ready for use. Push the "Simulate" button to run the simulation. This can take few minutes, please wait.');


% --- Executes when selected object is changed in strategy.
function strategy_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in strategy 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (hObject == handles.strategy1)
    set(handles.commentaire, 'String', 'You have selected the Strategy 1. Now you can import your files to run the simulation. Push the "Production system" button to import your production file. This can take few minutes, please wait.');
    set(handles.charge, 'style', 'text');
    set(handles.charge, 'string', 'Charging File');
    set(handles.discharge, 'style', 'text');
    set(handles.discharge, 'string', 'Discharging File');
else
    set(handles.commentaire, 'String', 'You have selected the Strategy 2. Now you can import your files to run the simulation. Push the "Production system" button to import your production file. This can take few minutes, please wait.');
    set(handles.charge, 'style', 'pushbutton');
    set(handles.charge, 'string', 'Charging File');
    set(handles.discharge, 'style', 'pushbutton');
    set(handles.discharge, 'string', 'Discharging File');
end

% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in view.
function view_Callback(hObject, eventdata, handles)
% hObject    handle to view (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run('visualisation.m');
