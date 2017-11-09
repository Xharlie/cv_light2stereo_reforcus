function light_dirs_5x3 = computeLightDirections(center, radius, img_cell)
    light_dirs_5x3 = [];
    for i = 1:5
        [x, y, inten] = compute_brightest(img_cell{i});
        [x,y,z] = computeZ(x,y,center,radius);
        (x.^2+y.^2+z.^2).^(0.5);
        ratio = inten ./ (x.^2+y.^2+z.^2).^(0.5);
        light_dirs_5x3 = [light_dirs_5x3; x*ratio, y*ratio, z*ratio];
    end
end

function [x_c,y_c,z] = computeZ(x,y,center,radius)
    x_c = double(x - center(1));
    y_c = double(y - center(2));
    z = (radius.^2 - x_c.^2-y_c.^2).^(0.5);
end

function [x,y argvalue] = compute_brightest(img)
    [argvalue, argmax] = max(img(:));
    [y, x] = ind2sub([size(img)],[argmax]);
    argvalue = double(argvalue);
%     figure()
%     imshow(img)
%     hold on
%     plot(x,y,'r*')
end