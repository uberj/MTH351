%% Lab 3

the_root = 1
six_digits_of_accuracy =.5E-6;
%% Problem 1
%%

k = 1;
while abs(eq1(reqx, k) - xtrue) > six_digits_of_accuracy
    k = k + 1;
end
