function varargout = FinalProject(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FinalProject_OpeningFcn, ...
                   'gui_OutputFcn',  @FinalProject_OutputFcn, ...
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
% --- Executes just before FinalProject is made visible.
function FinalProject_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FinalProject wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = FinalProject_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function TakeImageTag_Callback(hObject, eventdata, handles)
global snap;
snap = Take_Image('winvideo',1,'MJPG_1280x720');
imshow(snap,'Parent',handles.axes1);

% --- Executes on button press in BinaryImage.
function BinaryImage_Callback(hObject, eventdata, handles)
% hObject    handle to BinaryImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global snap;
for i=1:size(snap,1)
    for j=1:size(snap,2)
       GS(i,j)=snap(i,j,1)*0.3+snap(i,j,2)*0.59+snap(i,j,3)*0.11;
    end
end
for i=1:size(GS,1)
    for j=1:size(GS,2)
       if(GS(i,j)>128)
           BI(i,j)=1;
       else
           BI(i,j)=0;
           
       end
    end
end
 imshow(BI,'Parent',handles.axes2);
% --- Executes on button press in NegativeImage.
function NegativeImage_Callback(hObject, eventdata, handles)
global snap;
NegativeImg=Negative_Img(snap);
imshow(NegativeImg,'Parent',handles.axes2);

% --- Executes on button press in CropImage.
function CropImage_Callback(hObject, eventdata, handles)
% hObject    handle to CropImage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global snap;
CroppedImage(1:550,1:450,1:3)=snap(1:550,551:1000,1:3);
imshow(CroppedImage,'Parent',handles.axes2);

%C=1;
%R=1;

%for i=100:size(snap,1)
 %   for j=600:size(snap,2)-300
  %      CroppedImage(R,C,1)=snap(i,j,1);
   %      CroppedImage(R,C,2)=snap(i,j,2);
    %     CroppedImage(R,C,3)=snap(i,j,3);
     %    C=C+1;
   % end
    %R=R+1;
    %C=1; 
%end




% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on selection change in channelsMenu.
function channelsMenu_Callback(hObject, eventdata, handles)
global snap;
ch_img =channel_menu(get(handles.channelsMenu,'value'),snap);
 imshow(ch_img,'Parent',handles.axes2);


% --- Executes during object creation, after setting all properties.
function channelsMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to channelsMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in ChooseImage.
function ChooseImage_Callback(hObject, eventdata, handles)
global snap;
snap=Browse_image();
imshow(snap, 'Parent', handles.axes1);


% --- Executes on selection change in channelsMenu.
function GreyMenu_Callback(hObject, eventdata, handles)
global snap;
GrayScaleImage=GreyScale_menu(get(handles.GreyMenu,'value'),snap);
imshow(GrayScaleImage, 'Parent', handles.axes2);
% --- Executes during object creation, after setting all properties.
function GreyMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to channelsMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function BrightnessAdjustTag_Callback(hObject, eventdata, handles)
% hObject    handle to BrightnessAdjustTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
set(handles.BrightnessAdjustTag, 'min', -150);
set(handles.BrightnessAdjustTag, 'max', 150);
h = get(handles.BrightnessAdjustTag,'value');
global snap;
GreyScale=Grey_Scale(snap);
  for i=1:size(GreyScale,1)
        for j=1:size(GreyScale,2)
         B_Img(i,j)=GreyScale(i,j)+h;
        end
          end
          imshow(B_Img,'Parent',handles.axes2);

% --- Executes during object creation, after setting all properties.
function BrightnessAdjustTag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to BrightnessAdjustTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in Transpose.
function Transpose_Callback(hObject, eventdata, handles)
% hObject    handle to Transpose (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global snap;
imshow(Transpose_Image(snap),'Parent',handles.axes2);
   
