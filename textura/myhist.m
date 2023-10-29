function H = myhist(A)
    [m,n] = size(A);
    h = zeros(1,max(max(A))+1);
    for i = 1:m
        for j = 1:n
            k = A(i,j);
            h(1,k+1) = h(1,k+1) + 1;
        end
    end
    H = h;
    [mh nh] = size(h);
    x = 0:nh-1;
    figure
    bar(x,h);
end