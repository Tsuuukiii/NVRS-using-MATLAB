cd 'D:\Users\user\Documents\Polyspace_Workspace\research\Icons'
clc
clear
close(allchild(0))
warning off;
color = 'white';
figcolor = figure('Color',color,'Toolbar','none','Menubar','none','Resize','off','name','NVRS_Search');


color1 = [0 0.4470 0.7410];
set(gcf, 'Position',  [200, 100, 1000, 600])

bg = uicontrol('Style','Text','String','','Units','normalized','Position',[0 .87 1 0.3],'backgroundcolor',color1);
bg1 = uicontrol('Style','Text','String','','Units','normalized','Position',[0 .85 1 0.03],'backgroundcolor','y');

title = uicontrol('Style','Text','String','NON-VERBAL RECOGNITION SYSTEM','Units','normalized','Position',[0.03 .88 1 0.1],'backgroundcolor',color1,'FontSize',25,'Fontweight','bold');
set(title,'ForegroundColor','white');


insertsearch = uicontrol('style','Edit','string','1','Units','normalized','Position',[0.03 0.6 0.7 0.1],'backgroundcolor','w','Tag','EditField');
    
showsearch = uicontrol('Style','PushButton','String','Search','Units','normalized','Position',[0.74 0.6 0.25 0.1],'callback',{@showimage,insertsearch},'backgroundcolor','w','FontSize',12);

gotodetect= uicontrol('Style','PushButton','String','DETECT','Units','normalized','Position',[0.03 0.73 0.2 0.1],'callback','NVRS_detec','backgroundcolor','w','FontSize',12);
gotocapture= uicontrol('Style','PushButton','String','CAPTURE','Units','normalized','Position',[0.25 0.73 0.2 0.1],'callback','NVRS_capture','backgroundcolor','w','FontSize',12);
gototrain= uicontrol('Style','PushButton','String','TRAIN','Units','normalized','Position',[0.47 0.73 0.2 0.1],'callback','NVRS_train','backgroundcolor','w','FontSize',12);
delall= uicontrol('Style','PushButton','String','CLOSE','Units','normalized','Position',[0.69 0.73 0.2 0.1],'callback','close all','backgroundcolor','w','FontSize',12);

function showimage(~,~,InHandle)
   a =(InHandle.String);
   b = a;
   filename = ['ASL\',(b), '.bmp'];
   img = imread(filename);
   subplot(2,2,3), imshow(img)
   
   grayImage = rgb2gray(img);
   meanVal = mean(grayImage,"all");
   binaryimg = grayImage >= meanVal;
   subplot(2,2,4), imshow(binaryimg)
end
 


 


