function lib = make_lib()
    lib.f = @the_function;
    lib.the_root = 1;
    lib.accuracy = 5E-6;
end

function y = the_function(x)
    (x ^ 5) - (x ^ 4) + x - 1;
end
