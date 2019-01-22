function varargout = Pavuluri_Gautham_extraction(varargin)
% PAVULURI_GAUTHAM_EXTRACTION MATLAB code for Pavuluri_Gautham_extraction.fig
%      PAVULURI_GAUTHAM_EXTRACTION, by itself, creates a new PAVULURI_GAUTHAM_EXTRACTION or raises the existing
%      singleton*.
%
%      H = PAVULURI_GAUTHAM_EXTRACTION returns the handle to a new PAVULURI_GAUTHAM_EXTRACTION or the handle to
%      the existing singleton*.
%
%      PAVULURI_GAUTHAM_EXTRACTION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PAVULURI_GAUTHAM_EXTRACTION.M with the given input arguments.
%
%      PAVULURI_GAUTHAM_EXTRACTION('Property','Value',...) creates a new PAVULURI_GAUTHAM_EXTRACTION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Pavuluri_Gautham_extraction_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Pavuluri_Gautham_extraction_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Pavuluri_Gautham_extraction

% Last Modified by GUIDE v2.5 05-Dec-2016 18:00:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Pavuluri_Gautham_extraction_OpeningFcn, ...
                   'gui_OutputFcn',  @Pavuluri_Gautham_extraction_OutputFcn, ...
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


% --- Executes just before Pavuluri_Gautham_extraction is made visible.
function Pavuluri_Gautham_extraction_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Pavuluri_Gautham_extraction (see VARARGIN)

% Choose default command line output for Pavuluri_Gautham_extraction
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

I = imread('linear system.png');
axes(handles.axes4);
imshow(I);

% UIWAIT makes Pavuluri_Gautham_extraction wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Pavuluri_Gautham_extraction_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
F = str2num(get(handles.text3,'string'));
S = str2num(get(handles.text6,'string'));
x_f = str2num(get(handles.edit1,'string'));
y_s = str2num(get(handles.edit2,'string'));

if get(handles.radiobutton2, 'value') == 1
K = 2;
else
K = 1;
end


A = [(-F-S*K) F 0 0 0 0;
    S*K (-F-S*K) F 0 0 0;
    0 S*K (-F-S*K) F 0 0;
    0 0 S*K (-F-S*K) F 0;
    0 0 0 S*K (-F-S*K) F;
    0 0 0 0 S*K (-F-S*K)];

b = [-S*y_s; 0; 0; 0; 0; -F*x_f];



if size(x_f) == 0;
    set(handles.text16,'String','Error - value entered for x_f is not a number');
elseif size(y_s) == 0;
    set(handles.text16,'String','Error - value entered for y_s is not a number');
elseif x_f < 0;
        set(handles.text16,'String','Error - value entered for x_f is negative');
elseif y_s < 0;
        set(handles.text16,'String','Error - value entered for y_s is negative');
else
x = A\b;
set(handles.text10,'String',num2str(x));
set(handles.text16,'String','No warnings');
n = 1:1:6;

plot(handles.axes1,n,x,'b-o');
title(handles.axes1,'solute concentration as a function of stage number');
xlabel(handles.axes1,'stage number');
ylabel(handles.axes1,'concentration of solute');
end


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

% val = str2double(get(hObject,'String'));
% % Determine whether val is a number between 0 and 1.
% if isnumeric(val) && length(val)==1 && ...
%    val >= get(handles.slider1,'Min') && ...
%    val <= get(handles.slider1,'Max')
%    set(handles.slider1,'Value',val);
% else
% % Increment the error count, and display it.
%    handles.number_errors = handles.number_errors+1;
%    guidata(hObject,handles); % Store the changes.
%    set(hObject,'String',...
%    ['You have entered an invalid entry ',...
%     num2str(handles.number_errors),' times.']);
%    % Restore focus to the edit text box after error
%    uicontrol(hObject)
% end


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(handles.edit1,'String',num2str(get(handles.slider1,'Value')));

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

set(handles.edit2,'String',num2str(get(handles.slider2,'Value')));


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2
