function snap = Take_Image(Driver_name,id,Q)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
vid=videoinput(Driver_name,id,Q);
preview(vid);
pause(5);
snap=getsnapshot(vid);
closepreview(vid);
end

