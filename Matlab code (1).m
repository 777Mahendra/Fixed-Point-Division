N = 8; 
scale_factor = 2^N; 
D = 23; % Denominator
num = 15; % Numerator

% Convert to fixed-point
D_fixed = round(D * scale_factor);  % Convert denominator to fixed point
x0 = 1 / 17; 
x_fixed = round(x0 * scale_factor);  % Convert initial guess 1/D to fixed point

% Newton-Raphson Iteration in Fixed-Point using bit shifts
for i = 1:5  
    x_fixed = bitshift(x_fixed * (2 * scale_factor - bitshift(x_fixed * D_fixed, -N)), -N);
end

% Compute 15/23 in fixed point using bit shifts
result_fixed = num * x_fixed;

% Convert to floating point for verification
result_floating = result_fixed / scale_factor; 

% Display Results
disp(['Fixed-Point Result: ', num2str(result_fixed)]);
disp(['Floating-Point Result: ', num2str(result_floating)]);