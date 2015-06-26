function varargout = tuxiangchuli(varargin)
% TUXIANGCHULI M-file for tuxiangchuli.fig
%      TUXIANGCHULI, by itself, creates a new TUXIANGCHULI or raises the existing
%      singleton*.
%
%      H = TUXIANGCHULI returns the handle to a new TUXIANGCHULI or the handle to
%      the existing singleton*.
%
%      TUXIANGCHULI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TUXIANGCHULI.M with the given input arguments.
%
%      TUXIANGCHULI('Property','Value',...) creates a new TUXIANGCHULI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tuxiangchuli_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tuxiangchuli_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Copyright 2002-2003 The MathWorks, Inc.

% Edit the above text to modify the response to help tuxiangchuli

% Last Modified by GUIDE v2.5 25-Jun-2015 21:58:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tuxiangchuli_OpeningFcn, ...
                   'gui_OutputFcn',  @tuxiangchuli_OutputFcn, ...
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


% --- Executes just before tuxiangchuli is made visible.
function tuxiangchuli_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tuxiangchuli (see VARARGIN)

% Choose default command line output for tuxiangchuli
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes tuxiangchuli wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = tuxiangchuli_OutputFcn(hObject, eventdata, handles) 
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
h1=get(handles.radiobutton1,'value');
h2=get(handles.radiobutton2,'value');
h3=get(handles.radiobutton3,'value');
h4=get(handles.radiobutton4,'value');
h5=get(handles.radiobutton5,'value');
h6=get(handles.radiobutton6,'value');
h7=get(handles.radiobutton7,'value');
h8=get(handles.radiobutton8,'value');
if (h1==1)&&(h5==1)
image = double(imread('1.png'))./255;
axes(handles.axes1);
set(handles.text4,'string','原始图像一')
imshow(image);

image = double(imread('1.png'))./255; % colour values between 0 and 1
s_im = size(image);

%*************************************************************************%

% SHADOW DETECTION
    % MASK: creating a shadow segmentation if no mask is available
    gray = rgb2gray(image);
    light_mask = double(bwareaopen(im2bw(gray, graythresh(gray)),200));
    h = fspecial('gaussian',20,0.5);
    light_mask = imfilter(light_mask,h);
    shadow_mask = 1 - light_mask;
    % SHADOW / LIGHT CORE DETECTION
    % structuring element
    struct_elem = [0 1 1 1 0; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 0 1 1 1 0];
    % shadow/light  core (morphology erode: pixels not on the blurred edge of the shadow area)
    shadow_core = imerode(shadow_mask, struct_elem);
    light_core = imerode(light_mask, struct_elem);
    % smoothing the mask
    smoothmask = conv2(shadow_mask, struct_elem/sum(sum(struct_elem)), 'same');
    axes(handles.axes2);
       set(handles.text5,'string','阴影区域检测')
     imshow(shadow_mask);
end

if (h1==1)&&(h6==1)
image = double(imread('1.png'))./255;
axes(handles.axes1);
set(handles.text4,'string','原始图像一')
imshow(image);

image = double(imread('1.png'))./255; % colour values between 0 and 1
s_im = size(image);

%*************************************************************************%

% SHADOW DETECTION
    % MASK: creating a shadow segmentation if no mask is available
    gray = rgb2gray(image);
    light_mask = double(bwareaopen(im2bw(gray, graythresh(gray)),200));
    h = fspecial('gaussian',20,0.5);
    light_mask = imfilter(light_mask,h);
    shadow_mask = 1 - light_mask;
    % SHADOW / LIGHT CORE DETECTION
    % structuring element
    struct_elem = [0 1 1 1 0; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 0 1 1 1 0];
    % shadow/light  core (morphology erode: pixels not on the blurred edge of the shadow area)
    shadow_core = imerode(shadow_mask, struct_elem);
    light_core = imerode(light_mask, struct_elem);
    % smoothing the mask
    smoothmask = conv2(shadow_mask, struct_elem/sum(sum(struct_elem)), 'same');
    axes(handles.axes2);
       set(handles.text5,'string','阴影平滑')
     imshow(smoothmask);
end

if (h1==1)&&(h7==1)
image = double(imread('1.png'))./255;
axes(handles.axes1);
set(handles.text4,'string','原始图像一')
imshow(image);

image = double(imread('1.png'))./255; % colour values between 0 and 1
s_im = size(image);

%*************************************************************************%

% SHADOW DETECTION
    % MASK: creating a shadow segmentation if no mask is available
    gray = rgb2gray(image);
    light_mask = double(bwareaopen(im2bw(gray, graythresh(gray)),200));
    h = fspecial('gaussian',20,0.5);
    light_mask = imfilter(light_mask,h);
    shadow_mask = 1 - light_mask;
    % SHADOW / LIGHT CORE DETECTION
    % structuring element
    struct_elem = [0 1 1 1 0; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 0 1 1 1 0];
    % shadow/light  core (morphology erode: pixels not on the blurred edge of the shadow area)
    shadow_core = imerode(shadow_mask, struct_elem);
    light_core = imerode(light_mask, struct_elem);
    % smoothing the mask
    smoothmask = conv2(shadow_mask, struct_elem/sum(sum(struct_elem)), 'same');
    axes(handles.axes2);
       set(handles.text5,'string','其他区域检测')
     imshow( light_mask);
end

if (h1==1)&&(h8==1)
image = double(imread('1.png'))./255;
set(handles.text4,'string','原始图像一')
axes(handles.axes1);
imshow(image);

image = double(imread('1.png'))./255; % colour values between 0 and 1
s_im = size(image);

%*************************************************************************%

% SHADOW DETECTION
    % MASK: creating a shadow segmentation if no mask is available
    gray = rgb2gray(image);
    light_mask = double(bwareaopen(im2bw(gray, graythresh(gray)),200));
    h = fspecial('gaussian',20,0.5);
    light_mask = imfilter(light_mask,h);
    shadow_mask = 1 - light_mask;
    % SHADOW / LIGHT CORE DETECTION
    % structuring element
    struct_elem = [0 1 1 1 0; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 0 1 1 1 0];
    % shadow/light  core (morphology erode: pixels not on the blurred edge of the shadow area)
    shadow_core = imerode(shadow_mask, struct_elem);
    light_core = imerode(light_mask, struct_elem);
    % smoothing the mask
    smoothmask = conv2(shadow_mask, struct_elem/sum(sum(struct_elem)), 'same');
     struct_elem = [0 1 1 1 0; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 0 1 1 1 0];
    
    % shadow/light  core (morphology erode: pixels not on the blurred edge of the shadow area)
    shadow_core = imerode(shadow_mask, struct_elem);
    light_core = imerode(light_mask, struct_elem);
    % smoothing the mask
    smoothmask = conv2(shadow_mask, struct_elem/sum(sum(struct_elem)), 'same');
    
    % AVERAGE PIXEL INTENSITIES
    % shadow area
    shadow_avg_red = sum(sum(image(:,:,1).*shadow_core)) / sum(sum(shadow_core));
    shadow_avg_green = sum(sum(image(:,:,2).*shadow_core)) / sum(sum(shadow_core));
    shadow_avg_blue = sum(sum(image(:,:,3).*shadow_core)) / sum(sum(shadow_core));
    % light area
    light_avg_red = sum(sum(image(:,:,1).*light_core)) / sum(sum(light_core));
    light_avg_green = sum(sum(image(:,:,2).*light_core)) / sum(sum(light_core));
    light_avg_blue = sum(sum(image(:,:,3).*light_core)) / sum(sum(light_core));
    
    im_ycbcr = rgb2ycbcr(image);
    % computing averade channel values in im_ycbcr space
    shadow_avg_y = sum(sum(im_ycbcr(:,:,1).*shadow_core)) / sum(sum(shadow_core));
    shadow_avg_cb = sum(sum(im_ycbcr(:,:,2).*shadow_core)) / sum(sum(shadow_core));
    shadow_avg_cr = sum(sum(im_ycbcr(:,:,3).*shadow_core)) / sum(sum(shadow_core));
    %
    litavg_y = sum(sum(im_ycbcr(:,:,1).*light_core)) / sum(sum(light_core));
    litavg_cb = sum(sum(im_ycbcr(:,:,2).*light_core)) / sum(sum(light_core));
    litavg_cr = sum(sum(im_ycbcr(:,:,3).*light_core)) / sum(sum(light_core));
    % computing ratio, and difference in im_ycbcr space
    diff_y = litavg_y - shadow_avg_y;
    diff_cb = litavg_cb - shadow_avg_cb;
    diff_cr = litavg_cr - shadow_avg_cr;

    ratio_y = litavg_y/shadow_avg_y;
    ratio_cb = litavg_cb/shadow_avg_cb;
    ratio_cr = litavg_cr/shadow_avg_cr;
    % shadow correction: Y->additive, Cb&Cr-> basic light model
    aux_result_im_ycbcr = im_ycbcr;
    aux_result_im_ycbcr(:,:,1) = im_ycbcr(:,:,1) + shadow_mask * diff_y;
    aux_result_im_ycbcr(:,:,2) = im_ycbcr(:,:,2).*light_mask + shadow_mask.*ratio_cb.*im_ycbcr(:,:,2);
    aux_result_im_ycbcr(:,:,3) = im_ycbcr(:,:,3).*light_mask + shadow_mask.*ratio_cr.*im_ycbcr(:,:,3);
    % conversion back to rgb colourspace
    result_im_ycbcr = ycbcr2rgb(aux_result_im_ycbcr);
          
    axes(handles.axes2);
    set(handles.text5,'string','阴影消除')
     imshow( result_im_ycbcr);
end
% --------------------------------------------------------------------
%————————————————————————————————————————
if (h2==1)&&(h5==1)
image = double(imread('2.png'))./255;
axes(handles.axes1);
set(handles.text4,'string','原始图像二')
imshow(image);

image = double(imread('2.png'))./255; % colour values between 0 and 1
s_im = size(image);

%*************************************************************************%

% SHADOW DETECTION
    % MASK: creating a shadow segmentation if no mask is available
    gray = rgb2gray(image);
    light_mask = double(bwareaopen(im2bw(gray, graythresh(gray)),200));
    h = fspecial('gaussian',20,0.5);
    light_mask = imfilter(light_mask,h);
    shadow_mask = 1 - light_mask;
    % SHADOW / LIGHT CORE DETECTION
    % structuring element
    struct_elem = [0 1 1 1 0; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 0 1 1 1 0];
    % shadow/light  core (morphology erode: pixels not on the blurred edge of the shadow area)
    shadow_core = imerode(shadow_mask, struct_elem);
    light_core = imerode(light_mask, struct_elem);
    % smoothing the mask
    smoothmask = conv2(shadow_mask, struct_elem/sum(sum(struct_elem)), 'same');
    axes(handles.axes2);
       set(handles.text5,'string','阴影区域检测')
     imshow(shadow_mask);
end

if (h2==1)&&(h6==1)
image = double(imread('2.png'))./255;
axes(handles.axes1);
set(handles.text4,'string','原始图像二')
imshow(image);

image = double(imread('2.png'))./255; % colour values between 0 and 1
s_im = size(image);

%*************************************************************************%

% SHADOW DETECTION
    % MASK: creating a shadow segmentation if no mask is available
    gray = rgb2gray(image);
    light_mask = double(bwareaopen(im2bw(gray, graythresh(gray)),200));
    h = fspecial('gaussian',20,0.5);
    light_mask = imfilter(light_mask,h);
    shadow_mask = 1 - light_mask;
    % SHADOW / LIGHT CORE DETECTION
    % structuring element
    struct_elem = [0 1 1 1 0; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 0 1 1 1 0];
    % shadow/light  core (morphology erode: pixels not on the blurred edge of the shadow area)
    shadow_core = imerode(shadow_mask, struct_elem);
    light_core = imerode(light_mask, struct_elem);
    % smoothing the mask
    smoothmask = conv2(shadow_mask, struct_elem/sum(sum(struct_elem)), 'same');
    axes(handles.axes2);
       set(handles.text5,'string','阴影平滑')
     imshow(smoothmask);
end

if (h2==1)&&(h7==1)
image = double(imread('2.png'))./255;
axes(handles.axes1);
set(handles.text4,'string','原始图像二')
imshow(image);

image = double(imread('2.png'))./255; % colour values between 0 and 1
s_im = size(image);

%*************************************************************************%

% SHADOW DETECTION
    % MASK: creating a shadow segmentation if no mask is available
    gray = rgb2gray(image);
    light_mask = double(bwareaopen(im2bw(gray, graythresh(gray)),200));
    h = fspecial('gaussian',20,0.5);
    light_mask = imfilter(light_mask,h);
    shadow_mask = 1 - light_mask;
    % SHADOW / LIGHT CORE DETECTION
    % structuring element
    struct_elem = [0 1 1 1 0; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 0 1 1 1 0];
    % shadow/light  core (morphology erode: pixels not on the blurred edge of the shadow area)
    shadow_core = imerode(shadow_mask, struct_elem);
    light_core = imerode(light_mask, struct_elem);
    % smoothing the mask
    smoothmask = conv2(shadow_mask, struct_elem/sum(sum(struct_elem)), 'same');
    axes(handles.axes2);
       set(handles.text5,'string','其他区域检测')
     imshow( light_mask);
end

if (h2==1)&&(h8==1)
image = double(imread('2.png'))./255;
axes(handles.axes1);
set(handles.text4,'string','原始图像二')
imshow(image);

image = double(imread('2.png'))./255; % colour values between 0 and 1
s_im = size(image);

%*************************************************************************%

% SHADOW DETECTION
    % MASK: creating a shadow segmentation if no mask is available
    gray = rgb2gray(image);
    light_mask = double(bwareaopen(im2bw(gray, graythresh(gray)),200));
    h = fspecial('gaussian',20,0.5);
    light_mask = imfilter(light_mask,h);
    shadow_mask = 1 - light_mask;
    % SHADOW / LIGHT CORE DETECTION
    % structuring element
    struct_elem = [0 1 1 1 0; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 0 1 1 1 0];
    % shadow/light  core (morphology erode: pixels not on the blurred edge of the shadow area)
    shadow_core = imerode(shadow_mask, struct_elem);
    light_core = imerode(light_mask, struct_elem);
    % smoothing the mask
    smoothmask = conv2(shadow_mask, struct_elem/sum(sum(struct_elem)), 'same');
     struct_elem = [0 1 1 1 0; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 0 1 1 1 0];
    
    % shadow/light  core (morphology erode: pixels not on the blurred edge of the shadow area)
    shadow_core = imerode(shadow_mask, struct_elem);
    light_core = imerode(light_mask, struct_elem);
    % smoothing the mask
    smoothmask = conv2(shadow_mask, struct_elem/sum(sum(struct_elem)), 'same');
    
    % AVERAGE PIXEL INTENSITIES
    % shadow area
    shadow_avg_red = sum(sum(image(:,:,1).*shadow_core)) / sum(sum(shadow_core));
    shadow_avg_green = sum(sum(image(:,:,2).*shadow_core)) / sum(sum(shadow_core));
    shadow_avg_blue = sum(sum(image(:,:,3).*shadow_core)) / sum(sum(shadow_core));
    % light area
    light_avg_red = sum(sum(image(:,:,1).*light_core)) / sum(sum(light_core));
    light_avg_green = sum(sum(image(:,:,2).*light_core)) / sum(sum(light_core));
    light_avg_blue = sum(sum(image(:,:,3).*light_core)) / sum(sum(light_core));
    
    im_ycbcr = rgb2ycbcr(image);
    % computing averade channel values in im_ycbcr space
    shadow_avg_y = sum(sum(im_ycbcr(:,:,1).*shadow_core)) / sum(sum(shadow_core));
    shadow_avg_cb = sum(sum(im_ycbcr(:,:,2).*shadow_core)) / sum(sum(shadow_core));
    shadow_avg_cr = sum(sum(im_ycbcr(:,:,3).*shadow_core)) / sum(sum(shadow_core));
    %
    litavg_y = sum(sum(im_ycbcr(:,:,1).*light_core)) / sum(sum(light_core));
    litavg_cb = sum(sum(im_ycbcr(:,:,2).*light_core)) / sum(sum(light_core));
    litavg_cr = sum(sum(im_ycbcr(:,:,3).*light_core)) / sum(sum(light_core));
    % computing ratio, and difference in im_ycbcr space
    diff_y = litavg_y - shadow_avg_y;
    diff_cb = litavg_cb - shadow_avg_cb;
    diff_cr = litavg_cr - shadow_avg_cr;

    ratio_y = litavg_y/shadow_avg_y;
    ratio_cb = litavg_cb/shadow_avg_cb;
    ratio_cr = litavg_cr/shadow_avg_cr;
    % shadow correction: Y->additive, Cb&Cr-> basic light model
    aux_result_im_ycbcr = im_ycbcr;
    aux_result_im_ycbcr(:,:,1) = im_ycbcr(:,:,1) + shadow_mask * diff_y;
    aux_result_im_ycbcr(:,:,2) = im_ycbcr(:,:,2).*light_mask + shadow_mask.*ratio_cb.*im_ycbcr(:,:,2);
    aux_result_im_ycbcr(:,:,3) = im_ycbcr(:,:,3).*light_mask + shadow_mask.*ratio_cr.*im_ycbcr(:,:,3);
    % conversion back to rgb colourspace
    result_im_ycbcr = ycbcr2rgb(aux_result_im_ycbcr);
          
    axes(handles.axes2);
       set(handles.text5,'string','阴影消除')
     imshow( result_im_ycbcr);
end

%————————————————————————————————————
%————————————————————————————————————
if (h3==1)&&(h5==1)
image = double(imread('3.png'))./255;
axes(handles.axes1);
set(handles.text4,'string','原始图像三')
imshow(image);

image = double(imread('3.png'))./255; % colour values between 0 and 1
s_im = size(image);

%*************************************************************************%

% SHADOW DETECTION
    % MASK: creating a shadow segmentation if no mask is available
    gray = rgb2gray(image);
    light_mask = double(bwareaopen(im2bw(gray, graythresh(gray)),200));
    h = fspecial('gaussian',20,0.5);
    light_mask = imfilter(light_mask,h);
    shadow_mask = 1 - light_mask;
    % SHADOW / LIGHT CORE DETECTION
    % structuring element
    struct_elem = [0 1 1 1 0; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 0 1 1 1 0];
    % shadow/light  core (morphology erode: pixels not on the blurred edge of the shadow area)
    shadow_core = imerode(shadow_mask, struct_elem);
    light_core = imerode(light_mask, struct_elem);
    % smoothing the mask
    smoothmask = conv2(shadow_mask, struct_elem/sum(sum(struct_elem)), 'same');
    axes(handles.axes2);
       set(handles.text5,'string','阴影区域检测')
     imshow(shadow_mask);
end

if (h3==1)&&(h6==1)
image = double(imread('3.png'))./255;
axes(handles.axes1);
set(handles.text4,'string','原始图像三')
imshow(image);

image = double(imread('3.png'))./255; % colour values between 0 and 1
s_im = size(image);

%*************************************************************************%

% SHADOW DETECTION
    % MASK: creating a shadow segmentation if no mask is available
    gray = rgb2gray(image);
    light_mask = double(bwareaopen(im2bw(gray, graythresh(gray)),200));
    h = fspecial('gaussian',20,0.5);
    light_mask = imfilter(light_mask,h);
    shadow_mask = 1 - light_mask;
    % SHADOW / LIGHT CORE DETECTION
    % structuring element
    struct_elem = [0 1 1 1 0; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 0 1 1 1 0];
    % shadow/light  core (morphology erode: pixels not on the blurred edge of the shadow area)
    shadow_core = imerode(shadow_mask, struct_elem);
    light_core = imerode(light_mask, struct_elem);
    % smoothing the mask
    smoothmask = conv2(shadow_mask, struct_elem/sum(sum(struct_elem)), 'same');
    axes(handles.axes2);
       set(handles.text5,'string','阴影平滑')
     imshow(smoothmask);
end

if (h3==1)&&(h7==1)
image = double(imread('3.png'))./255;
axes(handles.axes1);
set(handles.text4,'string','原始图像三')
imshow(image);

image = double(imread('3.png'))./255; % colour values between 0 and 1
s_im = size(image);

%*************************************************************************%

% SHADOW DETECTION
    % MASK: creating a shadow segmentation if no mask is available
    gray = rgb2gray(image);
    light_mask = double(bwareaopen(im2bw(gray, graythresh(gray)),200));
    h = fspecial('gaussian',20,0.5);
    light_mask = imfilter(light_mask,h);
    shadow_mask = 1 - light_mask;
    % SHADOW / LIGHT CORE DETECTION
    % structuring element
    struct_elem = [0 1 1 1 0; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 0 1 1 1 0];
    % shadow/light  core (morphology erode: pixels not on the blurred edge of the shadow area)
    shadow_core = imerode(shadow_mask, struct_elem);
    light_core = imerode(light_mask, struct_elem);
    % smoothing the mask
    smoothmask = conv2(shadow_mask, struct_elem/sum(sum(struct_elem)), 'same');
    axes(handles.axes2);
       set(handles.text5,'string','其他区域检测')
     imshow( light_mask);
end

if (h3==1)&&(h8==1)
image = double(imread('3.png'))./255;
axes(handles.axes1);
set(handles.text4,'string','原始图像三')
imshow(image);

image = double(imread('3.png'))./255; % colour values between 0 and 1
s_im = size(image);

%*************************************************************************%

% SHADOW DETECTION
    % MASK: creating a shadow segmentation if no mask is available
    gray = rgb2gray(image);
    light_mask = double(bwareaopen(im2bw(gray, graythresh(gray)),200));
    h = fspecial('gaussian',20,0.5);
    light_mask = imfilter(light_mask,h);
    shadow_mask = 1 - light_mask;
    % SHADOW / LIGHT CORE DETECTION
    % structuring element
    struct_elem = [0 1 1 1 0; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 0 1 1 1 0];
    % shadow/light  core (morphology erode: pixels not on the blurred edge of the shadow area)
    shadow_core = imerode(shadow_mask, struct_elem);
    light_core = imerode(light_mask, struct_elem);
    % smoothing the mask
    smoothmask = conv2(shadow_mask, struct_elem/sum(sum(struct_elem)), 'same');
     struct_elem = [0 1 1 1 0; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 0 1 1 1 0];
    
    % shadow/light  core (morphology erode: pixels not on the blurred edge of the shadow area)
    shadow_core = imerode(shadow_mask, struct_elem);
    light_core = imerode(light_mask, struct_elem);
    % smoothing the mask
    smoothmask = conv2(shadow_mask, struct_elem/sum(sum(struct_elem)), 'same');
    
    % AVERAGE PIXEL INTENSITIES
    % shadow area
    shadow_avg_red = sum(sum(image(:,:,1).*shadow_core)) / sum(sum(shadow_core));
    shadow_avg_green = sum(sum(image(:,:,2).*shadow_core)) / sum(sum(shadow_core));
    shadow_avg_blue = sum(sum(image(:,:,3).*shadow_core)) / sum(sum(shadow_core));
    % light area
    light_avg_red = sum(sum(image(:,:,1).*light_core)) / sum(sum(light_core));
    light_avg_green = sum(sum(image(:,:,2).*light_core)) / sum(sum(light_core));
    light_avg_blue = sum(sum(image(:,:,3).*light_core)) / sum(sum(light_core));
    
    im_ycbcr = rgb2ycbcr(image);
    % computing averade channel values in im_ycbcr space
    shadow_avg_y = sum(sum(im_ycbcr(:,:,1).*shadow_core)) / sum(sum(shadow_core));
    shadow_avg_cb = sum(sum(im_ycbcr(:,:,2).*shadow_core)) / sum(sum(shadow_core));
    shadow_avg_cr = sum(sum(im_ycbcr(:,:,3).*shadow_core)) / sum(sum(shadow_core));
    %
    litavg_y = sum(sum(im_ycbcr(:,:,1).*light_core)) / sum(sum(light_core));
    litavg_cb = sum(sum(im_ycbcr(:,:,2).*light_core)) / sum(sum(light_core));
    litavg_cr = sum(sum(im_ycbcr(:,:,3).*light_core)) / sum(sum(light_core));
    % computing ratio, and difference in im_ycbcr space
    diff_y = litavg_y - shadow_avg_y;
    diff_cb = litavg_cb - shadow_avg_cb;
    diff_cr = litavg_cr - shadow_avg_cr;

    ratio_y = litavg_y/shadow_avg_y;
    ratio_cb = litavg_cb/shadow_avg_cb;
    ratio_cr = litavg_cr/shadow_avg_cr;
    % shadow correction: Y->additive, Cb&Cr-> basic light model
    aux_result_im_ycbcr = im_ycbcr;
    aux_result_im_ycbcr(:,:,1) = im_ycbcr(:,:,1) + shadow_mask * diff_y;
    aux_result_im_ycbcr(:,:,2) = im_ycbcr(:,:,2).*light_mask + shadow_mask.*ratio_cb.*im_ycbcr(:,:,2);
    aux_result_im_ycbcr(:,:,3) = im_ycbcr(:,:,3).*light_mask + shadow_mask.*ratio_cr.*im_ycbcr(:,:,3);
    % conversion back to rgb colourspace
    result_im_ycbcr = ycbcr2rgb(aux_result_im_ycbcr);
          
    axes(handles.axes2);
       set(handles.text5,'string','阴影消除')
     imshow( result_im_ycbcr);
end
%——————————————————————————————————————————
%__________________________________________________________________________
if (h4==1)&&(h5==1)
image = double(imread('4.png'))./255;
axes(handles.axes1);
set(handles.text4,'string','原始图像四')
imshow(image);

image = double(imread('4.png'))./255; % colour values between 0 and 1
s_im = size(image);

%*************************************************************************%

% SHADOW DETECTION
    % MASK: creating a shadow segmentation if no mask is available
    gray = rgb2gray(image);
    light_mask = double(bwareaopen(im2bw(gray, graythresh(gray)),200));
    h = fspecial('gaussian',20,0.5);
    light_mask = imfilter(light_mask,h);
    shadow_mask = 1 - light_mask;
    % SHADOW / LIGHT CORE DETECTION
    % structuring element
    struct_elem = [0 1 1 1 0; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 0 1 1 1 0];
    % shadow/light  core (morphology erode: pixels not on the blurred edge of the shadow area)
    shadow_core = imerode(shadow_mask, struct_elem);
    light_core = imerode(light_mask, struct_elem);
    % smoothing the mask
    smoothmask = conv2(shadow_mask, struct_elem/sum(sum(struct_elem)), 'same');
    axes(handles.axes2);
       set(handles.text5,'string','阴影区域检测')
     imshow(shadow_mask);
end

if (h4==1)&&(h6==1)
image = double(imread('4.png'))./255;
axes(handles.axes1);
set(handles.text4,'string','原始图像四')
imshow(image);

image = double(imread('4.png'))./255; % colour values between 0 and 1
s_im = size(image);

%*************************************************************************%

% SHADOW DETECTION
    % MASK: creating a shadow segmentation if no mask is available
    gray = rgb2gray(image);
    light_mask = double(bwareaopen(im2bw(gray, graythresh(gray)),200));
    h = fspecial('gaussian',20,0.5);
    light_mask = imfilter(light_mask,h);
    shadow_mask = 1 - light_mask;
    % SHADOW / LIGHT CORE DETECTION
    % structuring element
    struct_elem = [0 1 1 1 0; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 0 1 1 1 0];
    % shadow/light  core (morphology erode: pixels not on the blurred edge of the shadow area)
    shadow_core = imerode(shadow_mask, struct_elem);
    light_core = imerode(light_mask, struct_elem);
    % smoothing the mask
    smoothmask = conv2(shadow_mask, struct_elem/sum(sum(struct_elem)), 'same');
    axes(handles.axes2);
       set(handles.text5,'string','阴影平滑')
     imshow(smoothmask);
end

if (h4==1)&&(h7==1)
image = double(imread('4.png'))./255;
axes(handles.axes1);
set(handles.text4,'string','原始图像四')
imshow(image);

image = double(imread('4.png'))./255; % colour values between 0 and 1
s_im = size(image);

%*************************************************************************%

% SHADOW DETECTION
    % MASK: creating a shadow segmentation if no mask is available
    gray = rgb2gray(image);
    light_mask = double(bwareaopen(im2bw(gray, graythresh(gray)),200));
    h = fspecial('gaussian',20,0.5);
    light_mask = imfilter(light_mask,h);
    shadow_mask = 1 - light_mask;
    % SHADOW / LIGHT CORE DETECTION
    % structuring element
    struct_elem = [0 1 1 1 0; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 0 1 1 1 0];
    % shadow/light  core (morphology erode: pixels not on the blurred edge of the shadow area)
    shadow_core = imerode(shadow_mask, struct_elem);
    light_core = imerode(light_mask, struct_elem);
    % smoothing the mask
    smoothmask = conv2(shadow_mask, struct_elem/sum(sum(struct_elem)), 'same');
    axes(handles.axes2);
       set(handles.text5,'string','其他区域检测')
     imshow( light_mask);
end

if (h4==1)&&(h8==1)
image = double(imread('4.png'))./255;
axes(handles.axes1);
set(handles.text4,'string','原始图像四')
imshow(image);

image = double(imread('4.png'))./255; % colour values between 0 and 1
s_im = size(image);

%*************************************************************************%

% SHADOW DETECTION
    % MASK: creating a shadow segmentation if no mask is available
    gray = rgb2gray(image);
    light_mask = double(bwareaopen(im2bw(gray, graythresh(gray)),200));
    h = fspecial('gaussian',20,0.5);
    light_mask = imfilter(light_mask,h);
    shadow_mask = 1 - light_mask;
    % SHADOW / LIGHT CORE DETECTION
    % structuring element
    struct_elem = [0 1 1 1 0; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 0 1 1 1 0];
    % shadow/light  core (morphology erode: pixels not on the blurred edge of the shadow area)
    shadow_core = imerode(shadow_mask, struct_elem);
    light_core = imerode(light_mask, struct_elem);
    % smoothing the mask
    smoothmask = conv2(shadow_mask, struct_elem/sum(sum(struct_elem)), 'same');
     struct_elem = [0 1 1 1 0; 1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 0 1 1 1 0];
    
    % shadow/light  core (morphology erode: pixels not on the blurred edge of the shadow area)
    shadow_core = imerode(shadow_mask, struct_elem);
    light_core = imerode(light_mask, struct_elem);
    % smoothing the mask
    smoothmask = conv2(shadow_mask, struct_elem/sum(sum(struct_elem)), 'same');
    
    % AVERAGE PIXEL INTENSITIES
    % shadow area
    shadow_avg_red = sum(sum(image(:,:,1).*shadow_core)) / sum(sum(shadow_core));
    shadow_avg_green = sum(sum(image(:,:,2).*shadow_core)) / sum(sum(shadow_core));
    shadow_avg_blue = sum(sum(image(:,:,3).*shadow_core)) / sum(sum(shadow_core));
    % light area
    light_avg_red = sum(sum(image(:,:,1).*light_core)) / sum(sum(light_core));
    light_avg_green = sum(sum(image(:,:,2).*light_core)) / sum(sum(light_core));
    light_avg_blue = sum(sum(image(:,:,3).*light_core)) / sum(sum(light_core));
    
    im_ycbcr = rgb2ycbcr(image);
    % computing averade channel values in im_ycbcr space
    shadow_avg_y = sum(sum(im_ycbcr(:,:,1).*shadow_core)) / sum(sum(shadow_core));
    shadow_avg_cb = sum(sum(im_ycbcr(:,:,2).*shadow_core)) / sum(sum(shadow_core));
    shadow_avg_cr = sum(sum(im_ycbcr(:,:,3).*shadow_core)) / sum(sum(shadow_core));
    %
    litavg_y = sum(sum(im_ycbcr(:,:,1).*light_core)) / sum(sum(light_core));
    litavg_cb = sum(sum(im_ycbcr(:,:,2).*light_core)) / sum(sum(light_core));
    litavg_cr = sum(sum(im_ycbcr(:,:,3).*light_core)) / sum(sum(light_core));
    % computing ratio, and difference in im_ycbcr space
    diff_y = litavg_y - shadow_avg_y;
    diff_cb = litavg_cb - shadow_avg_cb;
    diff_cr = litavg_cr - shadow_avg_cr;

    ratio_y = litavg_y/shadow_avg_y;
    ratio_cb = litavg_cb/shadow_avg_cb;
    ratio_cr = litavg_cr/shadow_avg_cr;
    % shadow correction: Y->additive, Cb&Cr-> basic light model
    aux_result_im_ycbcr = im_ycbcr;
    aux_result_im_ycbcr(:,:,1) = im_ycbcr(:,:,1) + shadow_mask * diff_y;
    aux_result_im_ycbcr(:,:,2) = im_ycbcr(:,:,2).*light_mask + shadow_mask.*ratio_cb.*im_ycbcr(:,:,2);
    aux_result_im_ycbcr(:,:,3) = im_ycbcr(:,:,3).*light_mask + shadow_mask.*ratio_cr.*im_ycbcr(:,:,3);
    % conversion back to rgb colourspace
    result_im_ycbcr = ycbcr2rgb(aux_result_im_ycbcr);
          
    axes(handles.axes2);
       set(handles.text5,'string','阴影消除')
     imshow( result_im_ycbcr);
end
%______________________________________________________________________
%___________________________________________________________
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


