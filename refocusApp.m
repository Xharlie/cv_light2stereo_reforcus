function refocusApp(rgb_stack, depth_map)
    max_x = size(rgb_stack,2);
    max_y = size(rgb_stack,1);
    coordinate=[1,1];
    f=figure()
    current_index=depth_map(1,1);
    imshow(uint8(rgb_stack(:,:,depth_map(1,1) * 3-2 ...
                        : depth_map(1,1) * 3 )));
    while coordinate(1) < max_x && coordinate(1)>0 ...
        && coordinate(2) < max_y && coordinate(2)>0 
        target_index = depth_map(coordinate(2),coordinate(1))
        if target_index >= current_index
            for i = current_index:target_index
                imshow(uint8(rgb_stack(:,:,i * 3-2 ...
                        : i * 3 )));
            end
        else
            for i = current_index:-1:target_index
                imshow(uint8(rgb_stack(:,:,i * 3-2 ...
                        : i * 3 )));
            end
        end
        current_index = target_index;
        coordinate = int16(ginput(1))
    end
    close(f);
end
 


        
 