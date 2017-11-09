function [center, radius] = findSphere(img)
    bw = img > 0;
    stats = regionprops('table',bw,'Centroid',...
    'MajorAxisLength','MinorAxisLength');
    center = stats.Centroid
    diameters = mean([stats.MajorAxisLength stats.MinorAxisLength],2);
    radius = diameters/2
%     imshow(img)
%     hold on
%     viscircles(centers,radii);
    
end