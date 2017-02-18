% measure what fraction of the spectral region shows motion above
% background
function Out = PropMeas(Img)
    [m,n] = size(Img);
    Out = sum(Img(:))/(m*n);
end





            
        
