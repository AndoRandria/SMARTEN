function varargout = visualisation(varargin)
% VISUALISATION MATLAB code for visualisation.fig
%      VISUALISATION, by itself, creates a new VISUALISATION or raises the existing
%      singleton*.
%
%      H = VISUALISATION returns the handle to a new VISUALISATION or the handle to
%      the existing singleton*.
%
%      VISUALISATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VISUALISATION.M with the given input arguments.
%
%      VISUALISATION('Property','Value',...) creates a new VISUALISATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before visualisation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to visualisation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help visualisation

% Last Modified by GUIDE v2.5 19-Dec-2019 16:09:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @visualisation_OpeningFcn, ...
                   'gui_OutputFcn',  @visualisation_OutputFcn, ...
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


% --- Executes just before visualisation is made visible.
function visualisation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to visualisation (see VARARGIN)

% Choose default command line output for visualisation
handles.output = hObject;
axes (handles.axes2);
imshow('logo.jpg');
ilainamiseho=evalin('base','SP');%utiliser le systeme de production en démarrage
assignin('base','ilainamiseho',ilainamiseho);
m=evalin('base', 'm');
set(handles.slider3, 'Max',m);
set(handles.slider3, 'Min',1);
set(handles.slider3, 'Value',1);
pas_min=1/(m-1);
set(handles.slider3, 'SliderStep',[pas_min 1]);

%-----------When there is bug with the import map button-------------
%s='andravoahangy_tsena.shp';
%view=shaperead(s);
%assignin('base','view',view);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes visualisation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = visualisation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in importmap.
function importmap_Callback(hObject, eventdata, handles)
% hObject    handle to importmap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%_________________________Import file_____________________________
s=uigetfile('*.shp', 'Select a Shapefile');
view=shaperead(s);
assignin('base','view',view);

function t_Callback(hObject, eventdata, handles)
% hObject    handle to t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of t as text
%        str2double(get(hObject,'String')) returns contents of t as a double


% --- Executes during object creation, after setting all properties.
function t_CreateFcn(hObject, eventdata, handles)
% hObject    handle to t (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in showmap.
function showmap_Callback(hObject, eventdata, handles)
% hObject    handle to showmap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%______________________Initialisation_____________________________
set(handles.etat,'String','Please wait...','ForegroundColor','k');
cla (handles.axes1);
axes(handles.axes1);
%_____________________Load needed variables______________________
view=evalin('base', 'view');
t=(str2double(get(handles.t,'string')));
n=evalin('base', 'n');
m=evalin('base', 'm');
ilainamiseho=evalin('base', 'ilainamiseho');
for ii = 1:n
  x=ilainamiseho(t,ii);
  view(ii).donnee = x; % add your data here
end
a=n+1; % mise à zero des batiments non étudiés TSY MAINTSY MISY VALEUR DAHOLO IZY REHETRA
for ii = a:numel(view)
  view(ii).donnee = 0; % add your data here
end
A = vertcat(view.donnee);% convert le field donnee depuis strict vers array
M=max(A);% obtenir le maximum parmi donnee
Limite=M+0.5;

%_________________________Mapping__________________________________
spec = makesymbolspec('Polygon', ...
                     {'donnee', [0 Limite], 'Facecolor', parula });
zoom on;grid on;
mapshow(view,'SymbolSpec', spec)
c = colorbar;
caxis([0 Limite])% imposer limites du colorbar entre 0 et le max de donnee
c.Label.String = 'Energy [kWh]';
xlabel ('X');
ylabel ('Y');
set(handles.etat,'String','Done!','ForegroundColor',[0.0 0.6 0.2]);


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (hObject == handles.production)
    ilainamiseho=evalin('base','SP');
    assignin('base','ilainamiseho',ilainamiseho);
    set(handles.titre,'string','PRODUCTION SYSTEM 2D VIEW');
    elseif (hObject == handles.consumption)
        ilainamiseho=evalin('base','SC');
        assignin('base','ilainamiseho',ilainamiseho);
        set(handles.titre,'string','CONSUMPTION SYSTEM 2D VIEW');
    elseif (hObject == handles.grid)
        ilainamiseho=evalin('base','RES');
        assignin('base','ilainamiseho',ilainamiseho);
        set(handles.titre,'string','GRID ENERGY EXTRACTION 2D VIEW');
    elseif (hObject == handles.storage)
        ilainamiseho=evalin('base','STO');
        assignin('base','ilainamiseho',ilainamiseho);
        set(handles.titre,'string','STORAGE SYSTEM 2D VIEW');
    elseif (hObject == handles.surplus)
        ilainamiseho=evalin('base','EXC');
        assignin('base','ilainamiseho',ilainamiseho);
        set(handles.titre,'string','ENERGY PRODUCTION SURPLUS 2D VIEW');
end


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
newval = hObject.Value;                         %get value from the slider
newval = round(newval);                         %round off this value
set(hObject, 'Value', newval);                  %set slider position to rounded off value
sliderValue = get(handles.slider3,'Value');
set(handles.t,'String',sliderValue);

%______________________Initialisation_____________________________
set(handles.etat,'String','Please wait...','ForegroundColor','k');
cla (handles.axes1);
axes(handles.axes1);
%_____________________Load needed variables______________________
view=evalin('base', 'view');
t=(str2double(get(handles.t,'string')));
n=evalin('base', 'n');
m=evalin('base', 'm');
ilainamiseho=evalin('base', 'ilainamiseho');
for ii = 1:n
  x=ilainamiseho(t,ii);
  view(ii).donnee = x; % add your data here
end
a=n+1; % mise à zero des batiments non étudiés TSY MAINTSY MISY VALEUR DAHOLO IZY REHETRA
for ii = a:numel(view)
  view(ii).donnee = 0; % add your data here
end
A = vertcat(view.donnee);% convert le field donnee depuis strict vers array
M=max(A);% obtenir le maximum parmi donnee
Limite=M+0.5;

%_________________________Mapping__________________________________
spec = makesymbolspec('Polygon', ...
                     {'donnee', [0 Limite], 'Facecolor', parula });
zoom on;grid on;
mapshow(view,'SymbolSpec', spec)
c = colorbar;
caxis([0 Limite])% imposer limites du colorbar entre 0 et le max de donnee
c.Label.String = 'Energy [kWh]';
xlabel ('X');
ylabel ('Y');
set(handles.etat,'String','Done!','ForegroundColor',[0.0 0.6 0.2]);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
