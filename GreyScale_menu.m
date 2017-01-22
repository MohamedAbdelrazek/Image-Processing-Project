function GreyImage = GreyScale_menu(value,snap)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

switch (value)
   case 1
          for i=1:size(snap,1)
        for j=1:size(snap,2)
           GreyImage(i,j)=(snap(i,j,1)+snap(i,j,2)+snap(i,j,3))/3;
        end
          end
         
    case 2
        for i=1:size(snap,1)
         for j=1:size(snap,2)
       GreyImage(i,j)=(max(snap(i,j,1),max(snap(i,j,2),snap(i,j,3)))+min(snap(i,j,1),min(snap(i,j,2),snap(i,j,3))))/2;
         end
        end
          
    case 3
         for i=1:size(snap,1)
    for j=1:size(snap,2)
       GreyImage(i,j)=snap(i,j,1)*0.3+snap(i,j,2)*0.59+snap(i,j,3)*0.11;
    end
end
 end  
end

