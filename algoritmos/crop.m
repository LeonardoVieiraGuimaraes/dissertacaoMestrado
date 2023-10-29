clear all;
close all;
for i = 1:30
    I=imread('DSCN9165.jpg');
    h = imshow(I) ;
    %call imellipse
    % set some positon for ellipse 
    x = 100;
    y = 100;
    d1 = 350;
    d2 = 350;
    e = imellipse(gca, [x y d1 d2]);
    % wait to change the positon 
    position = wait(e);
    % ipdate the positon 
    pos = getPosition(e);
    x = pos(1);
    y = pos(2);
    d1 = pos(3);
    d2 = pos(4);
    BW = createMask(e,h);
    BW = uint8(BW);
    I2 = cat(3,BW.*I(:,:,1),BW.*I(:,:,2),BW.*I(:,:,3));
    I3 = imcrop(I2,[x,y,d1,d2]);
    filename = sprintf('italia_0h_%d.jpg',i);
    imwrite(I3,filename);
end
close all;




