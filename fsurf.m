function minLoc = fsurf(fitnessfcn,xBound,yBound)
% Overlays surface and marks known minimum for demo cases of pso. Called by
% PSOPLOTSWARMSURF.
%
% See also: PSODEMO, PSOPLOTSWARMSURF

view(3)

[XX,YY] = meshgrid(xBound(1):(xBound(2)-xBound(1))/50:xBound(2),...
    yBound(1):(yBound(2)-yBound(1))/50:yBound(2)) ;
ZZ = zeros(size(XX)) ;
clear xBound yBound

for i = 1:size(XX,1)
    for j = 1:size(XX,2)
        ZZ(i,j) = fitnessfcn([XX(i,j) YY(i,j)]) ;
    end
end

surface(XX,YY,ZZ,'LineStyle','none',...
    'FaceAlpha',0.4,...
    'FaceLighting','gouraud',...
    'FaceColor','interp')
flagfill = [1 0 0] ;
flaglines = [1 0 0] ;
set(gcf,'Colormap',1-colormap('cool'))

axis tight

axis tight
camlight
set(gca,...
    'XLimMode','manual',...
    'YLimMode','manual',...
    'ZLimMode','manual',...
    'PlotBoxAspectRatio',[1 1 1])