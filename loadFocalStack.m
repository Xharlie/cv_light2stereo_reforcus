function [rgb_stack, gray_stack] = loadFocalStack(focal_stack_dir)
    sample = imread([focal_stack_dir '/frame1.jpg']);
    rgb_stack=zeros(size(sample,1),size(sample,2),3*25);
    gray_stack=zeros(size(sample,1),size(sample,2),25);
    for i = 1:25
        rgb_stack(:,:,i*3-2:i*3) = imread([focal_stack_dir '/frame' num2str(i) '.jpg']);
        gray_stack(:,:,i) = rgb2gray(imread([focal_stack_dir '/frame' num2str(i) '.jpg']));
    end
end