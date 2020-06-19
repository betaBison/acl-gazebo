clear;
close all;
clc;


[X Y Z VX VY VZ] = csvimport('states.csv', 'columns', {'x', 'y', 'z', 'vx', 'vy', 'vz'});
V_total = sqrt(VX.^2 + VY.^2 + VZ.^2);

[CX, CY, CZ, CR, CH] = csvimport('obstacles.csv', 'columns', {'x', 'y', 'z', 'radius', 'height'});
hold on
scatter3(X,Y,Z,[],V_total,'filled')
colormap jet
colorbar

for ii = 1:size(CX,1)
    [CXi,CYi,CZi] = cylinder(CR(ii));   
    s = surf(CXi + CX(ii),CYi + CY(ii),CZi*CH(ii),'FaceColor','g', 'FaceAlpha',0.8);
end