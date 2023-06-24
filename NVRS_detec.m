

clc
clear
warning off;

c=webcam;
load zzz;
x=100;
y=30;
height=500;
width=350;
bboxes=[x y height width ];
color = [0, 0.4470, 0.7410];
figcolor = figure('Toolbar','none','Menubar','none','Resize','off','name','NVRS_Search');
set(gcf,'color',color, 'Position',  [200, 100, 1000, 600])

ax1 = axes('Position',[0 0 1 1]);
close(rs)


while true
e=c.snapshot;
es=imcrop(e,bboxes);
es=imresize(es,[227 227]);
label=classify(zzz,es);
IFaces = insertObjectAnnotation(e,'rectangle',bboxes,label,'FontSize',30,'Color',{'cyan'},'TextColor','black');   
imshow(IFaces,'parent',ax1)
drawnow;

end


