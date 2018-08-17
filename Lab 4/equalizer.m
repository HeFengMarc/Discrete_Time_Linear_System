% He Feng

% This is a function used in Ex3.m which introduces an equalizer to process
% music or other signals.

function equalize = equalizer(file,G1,G2,G3)

% Filter coefficients
B1 = [0.0495 0.1486 0.1486 0.0495];
A1 = [1.0000 -1.1619 0.6959 -0.1311];
B2 = [0.1311 0 -0.2622 0 0.1311];
A2 = [1.0000 -0.4824 0.8101 -0.2269 0.2722];
B3 = [0.0985 -0.2956 0.2956 -0.0985];
A3 = [1.0000 0.5772 0.4218 0.0563];

% Implement the filter and apply the given dataset to the filter.
first_filter = filter(B1,A1,file);
second_filter = filter(B2,A2,file);
third_filter = filter(B3,A3,file);

% Compute the magnitude of each signal before and after processing
fvtool(B1*G1,A1, B2*G2, A2, B3*G3, A3);

% Output result after processing
equalize = (first_filter.*G1) + (second_filter.*G2) + (third_filter.*G3);
