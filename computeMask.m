function mask = computeMask(img_cell)
    acc = img_cell{1};
    for i = 2:5
        acc = acc + img_cell{i};
    end
    mask = acc > 0;
%     imshow(mask)
%     hold on;
end