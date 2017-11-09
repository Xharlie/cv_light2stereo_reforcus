function index_map = generateIndexMap(gray_stack, w_size)
%     size(gray_stack);
    lap_y=[0,1,0;0,-2,0; 0,1,0];
    lap_x=lap_y.';
    abs_lap_stack= abs(imfilter(gray_stack,lap_y)) + abs(imfilter(gray_stack,lap_x));
%     size(abs_lap_stack);
    h_sum = ones(w_size*2+1);
    abs_sum_lap_stack = imfilter(abs_lap_stack,h_sum);
%     size(abs_sum_lap_stack)
    h_avg = fspecial('average',w_size*2+1);
    abs_avg_sum_lap_stack = imfilter(abs_sum_lap_stack,h_avg);
    index_map = zeros(size(abs_avg_sum_lap_stack(:,:,1)));
    for i=1:size(index_map,1)
        for j=1:size(index_map,2)
            [argvalue, argmax] = max(abs_avg_sum_lap_stack(i,j,:));
            index_map(i,j) = argmax;
        end
    end
end
