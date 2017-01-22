function ch_img = channel_menu(value,snap)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

switch (value)
    case 1
       ch_img=snap(:,:,1);
  
    case 2
         ch_img=snap(:,:,2);
 
    case 3
         ch_img=snap(:,:,3);
 
    otherwise
 end  
end

