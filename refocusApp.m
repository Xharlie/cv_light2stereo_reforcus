function refocusApp(rgb_stack, depth_map)
    max_x = size(rgb_stack,2);
    max_y = size(rgb_stack,1);
    coordinate=[1,1];
    f=figure()
    while coordinate(1) < max_x && coordinate(1)>0 ...
        && coordinate(2) < max_y && coordinate(2)>0 
        depth_map(coordinate(2),coordinate(1));
        rgb_stack(:,:,depth_map(coordinate(2),coordinate(1)) * 3-2 ...
        : depth_map(coordinate(2),coordinate(1)) * 3);
    
        imshow(rgb_stack(:,:,depth_map(coordinate(2),coordinate(1)) * 3-2 ...
        : depth_map(coordinate(2),coordinate(1)) * 3 ));
        rgb_stack(:,:,depth_map(coordinate(2),coordinate(1)) * 3-2: depth_map(coordinate(2),coordinate(1)) * 3);
        hold on;
        coordinate = int8(ginput(1))
    end
    close(f);
end