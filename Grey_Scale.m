function GreyScale = Grey_Scale(snap)
for i=1:size(snap,1)
    for j=1:size(snap,2)
        GreyScale(i,j)=0.3*snap(i,j,1)+0.59*snap(i,j,2)+0.11*snap(i,j,3);
    end
end

end