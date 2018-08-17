% He Feng

% This function can increase the size of an image by 2. We used the interp2
% function for the bilinear interpolation.

function Expand = bi_interp(image)

% Transfer the image to type double.
new_image = double(image);

% Expand the image using interp2 function given in spec.
Expand = interp2(new_image);

end
