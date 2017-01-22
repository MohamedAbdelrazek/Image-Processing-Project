function NegativeImg = Negative_Img(snap)
for i=1:size(snap,1)
    for j=1:size(snap,2)
        NegativeImg(i,j)=255-snap(i,j);
    end
   

end
end