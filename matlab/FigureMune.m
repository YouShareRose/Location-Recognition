figure
set(gcf,'Menubar','none')
h_menu=uimenu(gcf,'label','Color');
str_color='color';
str_color1='blue';
h_submune1=uimenu(h_menu,'label','Blue','callback','set(gcf,str_color,str_color1)');
str_color2='red';
h_submune2=uimenu(h_menu,'label','Red','callback','set(gcf,str_color,str_color2)');