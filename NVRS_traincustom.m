
  hFig=figure('Position',[200 200 1600 600]);
      movegui(hFig,'center')  
ButtonH=uicontrol('Parent',hFig,'Style','pushbutton','String','View Data','Units','normalized','Position',[0.0 0.5 0.4 0.2],'Visible','on','Callback',@dir);
color= 'w';
labeltext = uicontrol('Style','Text','Units','normalized','Position',[0 0 1 .1],'FontSize',40,'Fontweight','bold','backgroundcolor',color);
set(labeltext,'ForegroundColor','white');


function dir(~,~)

    dname = uigetdir("fileparts(which('NVRS_Train.mlapp'))");
            [~,name] = fileparts(dname);
           color= 'w'; 
labeltext = uicontrol('Style','Text','Units','normalized','Position',[0 0 .5 .1],'FontSize',40,'Fontweight','bold','backgroundcolor',color);
set(labeltext,'ForegroundColor','white');
set(labeltext,'string',name)
end