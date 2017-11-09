function [normals, albedo_img] = ...
    computeNormals(light_dirs, img_cell, mask)
    img_m=cat(3, img_cell{1}, img_cell{2}, img_cell{3}, img_cell{4}, img_cell{5});
    height = size(img_cell{1},1);
    width = size(img_cell{1},2);
    normals = zeros(height,width,3);
    albedo_img = zeros(height,width);
    for y = 1:height
        for x = 1:width
            if mask(y,x)
                a = img_m(y,x,:);
                [val ind] = sort(a(:).','descend');
                [n, albedo] =calculate_n_albedo(double(val), ind, light_dirs);
                normals(y,x,:) = n;
                albedo_img(y,x)=albedo;
            end
        end
    end
    albedo_img = albedo_img ./ max(albedo_img(:));
end

function [n, albedo] =calculate_n_albedo(val, ind, light_dirs)
    I1 = val(1) ./ norm(light_dirs(ind(1),:));
    I2 = val(2) ./ norm(light_dirs(ind(2),:));
    I3 = val(3) ./ norm(light_dirs(ind(3),:));
    S = [light_dirs(ind(1),:) ./ norm(light_dirs(ind(1),:)); ...
         light_dirs(ind(2),:) ./ norm(light_dirs(ind(2),:)); ...
         light_dirs(ind(3),:) ./ norm(light_dirs(ind(3),:))];
    N = inv(S) * [I1;I2;I3];
    n = N ./ norm(N);
    albedo = norm(N);
end