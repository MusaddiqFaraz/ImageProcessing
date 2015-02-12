%read the original image

Image = im2double(imread('Lena.tiff'));
Image = Image(:,:,2);
figure,imshow(Image,[],'InitialMagnification','fit');
truesize
title('Original image')


% loop over all rows(R) and columns(C)
for R=1:size(Image,1)
    for C=1:size(Image,2)
        
        pixel=Image(R,C);

          % check pixel value, if the pixel is less than 0.5 assign zero
          % otherwise 1 in the  image
          if pixel<0.5
              new_pixel=0;
          %elseif pixel>0.5
             % new_pixel=1;
          else
              new_pixel =1;
          end
          % save new pixel value in the image
          Image(R,C)=new_pixel;
          %calculate the difference between the old pixel value and new pixel. 
          error = pixel-new_pixel;
          %Apply "Floyd-Steinberg Error diffusion" algorithm to the
          %neighbouring pixels.
          if C < size(Image,2)
              Image(R,C + 1)=Image(R,C + 1)+ error*7/16;
              if R ~= size(Image,1)
                  Image(R + 1,C + 1)=Image(R + 1,C + 1)+ error*1/16;
              end
          end    
          if C > 1
             if R ~= size(Image,1)
                 Image(R + 1,C -1)=Image(R + 1,C - 1)+ error*3/16;
                 Image(R + 1,C)=Image(R + 1,C)+ error*5/16;
             end
          end    
    end
end

% display result

figure,imshow(Image,[],'InitialMagnification','fit') 
truesize
title('Black and White Image') 


