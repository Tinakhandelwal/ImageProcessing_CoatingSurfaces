close all;
img =imread('E:/imageprocessing/ATiN070518AtaCN090518/5KX.tif');
prompt= 'enter the magnification in X?';
x = input(prompt);
h = fspecial('gaussian',[5 5],2);
img = imfilter(img,h,'same');
figure,imshow(img);
if(x<=5000)
    img1 = imtophat(img, strel('disk', 10));
    img2 = imadjust(img1);
    level = graythresh(img2);
    BW = im2bw(img2,level);

    C=~BW;

    D= -bwdist(C);
    D(C) = -Inf;
    L= watershed(D);
    wi = label2rgb(L, 'hot', 'w');
    figure,imshow(wi);
    im4 = im2bw(wi);
    h = imfill(im4,'holes');
   
    label = bwlabel(h);
    figure,imshow(h);
    num1 = max(max(label));
    

    img1 = im2bw(img);
    img2 = imfill(img1,'holes');
    label = bwlabel(img2);
    num = max(max(label));
    count=0;
    P = zeros(num,1);
    i=0;
    figure,imshow((img2));
    disp('area of particles in micron');
    for j=1:num
        [row,col] = find(label==j);
        len = max(row)-min(row)+2;
        width = max(col)-min(col)+2;
        obj=(label == j);
        stats=regionprops(obj,'Area');
        if(stats(1).Area>20)
           count = count+1;
           scale = 6.45/x;
           area = stats(1).Area * scale;
           P(j) = area;
           i=i+1; 
        end;
    end;
    j=1;
    size = zeros(i,1);
    for k=1:num
        if(P(k)>0)
          size(j) = P(k);
          j=j+1;
        end;
    end;
    disp(size);
    disp('Number of particles');
    disp(count);
    figure,hist(size)
    title('Particle Size Analysis')
    xlabel('Particle Size in Micrometer')
    ylabel('Number of Particles')

else
    img1 = im2bw(img);
    img2 = imfill(img1,'holes');
    label = bwlabel(img2);
    num = max(max(label));
    count=0;
    P = zeros(num,1);
    i=0;
    figure,imshow((img2));
    disp('area of particles in micron');
    for j=1:num
        [row,col] = find(label==j);
        len = max(row)-min(row)+2;
        width = max(col)-min(col)+2;
        obj=(label == j);
        stats=regionprops(obj,'Area');
        if(stats(1).Area>20)
           count = count+1;
           scale = 6.45/x;
           area = stats(1).Area * scale;
           P(j) = area;
           i=i+1; 
        end;
    end;
    j=1;
    size = zeros(i,1);
    for k=1:num
        if(P(k)>0)
          size(j) = P(k);
          j=j+1;
        end;
    end;
    disp(size);
    disp('Number of particles');
    disp(count);
    figure,hist(size)
     title('Particle Size Analysis')
    xlabel('Particle Size in Micrometer')
    ylabel('Number of Particles')
    
 end;








