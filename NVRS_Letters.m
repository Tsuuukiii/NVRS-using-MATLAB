

clc

warning off;
 
try

c=webcam;
load ToTrainLetters;
  x=500;
y=250;
height=800;
width=650;
bboxes=[x y height width ];
color = [0, 0.4470, 0.7410];
fig = figure('Toolbar','none','Menubar','none','Resize','off','name','NVRS_Letter');
set(gcf,'NumberTitle','off');
set(gcf,'color','white', 'Position',  [200, 100, 1000, 600])


bgblue = uicontrol('Style','Text','String','NON-','Units','normalized','Position',[0 .87 1 0.3],'backgroundcolor',color);
bgyellow = uicontrol('Style','Text','String','','Units','normalized','Position',[0 .85 1 0.03],'backgroundcolor','y');

title = uicontrol('Style','Text','String','NON-VERBAL RECOGNITION SYSTEM','Units','normalized','Position',[0.03 .88 1 0.1],'backgroundcolor',color,'FontSize',25,'Fontweight','bold');
set(title,'ForegroundColor','white');


labeltext = uicontrol('Style','Text','Units','normalized','Position',[0 0 1 .1],'FontSize',40,'Fontweight','bold','backgroundcolor',color);
set(labeltext,'ForegroundColor','white');

ax1 = axes('Position',[.1 .1 .8 .8]);





while true
e=c.snapshot;
es=imcrop(e,bboxes);
es=imresize(es,[227 227]);
[label,score]=classify(ToTrainLetters,es);
IFaces = insertObjectAnnotation(e,'rectangle',bboxes,'Detection Box','FontSize',10,'Color',{'cyan'},'TextColor','black');   
imshow(IFaces,'parent',ax1)
drawnow;
halaman ='Detected: ' +string(label) + ' | ';
tinapay = 'Score: ' + string(score);
apptext = append(halaman,tinapay);
set(labeltext,'string',apptext)
end

catch
    clear
    NVRS_DetectMain
end