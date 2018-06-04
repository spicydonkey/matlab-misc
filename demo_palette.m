% Demo for palette.m
%
% DKS
% 2018-06-04

% config
n_colors=10;
bg='w';         % default 'w'
L=1.7;          % default 1.7


%%% main
[C,Clight,Cdark]=palette(n_colors,bg,L);


%%% data
x = linspace(0,2*pi,n_colors);
dx = rand(1,n_colors);
y = sin(x);
dy = rand(1,n_colors);


%%% vis
mark_typ='o';
mark_siz=8;
line_wid=1.8;

figure('Name','demo_palette');

hold on;

for ii=1:n_colors
    h=ploterr(x(ii),y(ii),dx(ii),dy(ii),'o','hhxy',0);
    set(h(1),'Marker',mark_typ,'MarkerSize',mark_siz,...
        'Color',C(ii,:),'LineWidth',line_wid,...
        'MarkerFaceColor',Clight(ii,:));
    set(h(2),'Color',Cdark(ii,:),'LineWidth',line_wid);
    set(h(3),'Color',Cdark(ii,:),'LineWidth',line_wid);
end