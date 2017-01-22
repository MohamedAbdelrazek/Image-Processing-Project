function T_image =Transpose_Image(snap)
ColCounter=1;
RowCounter=1;
for j=1:size(snap,1)
    for k=1:size(snap,2)
        T_image(RowCounter,ColCounter,1:3)=snap(j,k,1:3);
        
        RowCounter=RowCounter+1;
    end
    ColCounter=ColCounter+1;
    RowCounter=1;
end

end

