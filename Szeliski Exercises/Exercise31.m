Image = imread('Lena.tiff');

figure,imshow(Image);
title('Original Image');
Image=Image(:,:,1);
Image1 = zeros(size(Image));
val= 1 ;
while val
    prompt = 'enter a value ';
    n = input(prompt);
    for R=1:size(Image,1)
        for C=1:size(Image,2)
           Image1(R,C)= n*Image(R,C);
        end   
    end
    Image1=uint8(Image1);
    figure,imshow(Image1);
    title('Changed Image');
    val = input('Do you want to check more?(1 for yes/0 for no) ');
end

        