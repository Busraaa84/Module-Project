%% Section one
% We used input because we wanted to get numbers from users
R1 = input('Please enter R1 resistance (ohm): ');
R2 = input('Please enter R2 resistance (ohm): ');
A_v = 1+ (R1/R2);
fprintf('The voltage gain (A_v) of the circuit is: %.2f\n',A_v);

%% Section two
R2 = 1000; 
R1_values = 100:100:4000;
Av_values = 1 + (R1_values ./ R2);
figure(1);

subplot(2,2,1);
plot(R1_values, Av_values, 'b-o');
title('Line Plot');
xlabel('R1 (Ohms)');
ylabel('Gain');
grid on;

subplot(2,2,2);
stem(R1_values, Av_values, 'filled');
title('Stem Plot');
xlabel('R1 (Ohms)');
ylabel('Gain');
grid on;

subplot(2,2,3);
bar(R1_values, Av_values);
title('Bar Plot');
xlabel('R1 (Ohms)');
ylabel('Gain');
grid on;

subplot(2,2,4);
R2_values = 500:500:2000;
[R1_grid, R2_grid] = meshgrid(R1_values, R2_values);  
Av_grid = 1 + (R1_grid ./ R2_grid);
mesh(R1_grid, R2_grid, Av_grid);
title('3D Gain Mesh');
xlabel('R1 (Ohms)');
ylabel('R2 (Ohms)');
zlabel('Gain (Av)');
grid on;

%% Section three
n = input('How many R1 values will you enter?  ');
R1_list = zeros(1, n);
disp('Pleae enter the R1 values in order !!! ')
for i = 1:n
    R1_list(i) = input('R1 Value (Ohm): ');
end
R2 = input('Enter the value of R2 (Ohm): ');
V_in = input('Enter the value of V_in (V): ');
Vout_list = zeros(1, n);
for i = 1:n
    gain_formula = 1 + R1_list(i)/R2;
    Vout_list(i) = gain_formula * V_in;
end
plot(R1_list, Vout_list, 'b*-', 'MarkerSize', 15)
xlabel('R1 (Ohm)')
ylabel('V_out (V)')
title('Output Voltage Based on the R1 Value')
grid on

%% Section four
V_in = 1; 
R3 = input('Enter the value of R3 (Ohm): ');
n = input('How many different measurements will you enter? ');
data = cell(n, 3); 
for i = 1:n
    fprintf('\n%d. measure:\n', i);
    LDR = input('LDR resistance (Ohm): ');
    ortam = input('Situation', 's');
    Vout = V_in * R3 / (LDR + R3);
    data{i,1} = LDR;     
    data{i,2} = ortam;  
    data{i,3} = Vout;    
end
disp('Measurement results:')
disp(data)

%% Section five
V_in = 0:0.1:3;
gain = 11;
V_out = gain * V_in;
for i=1:length(V_out)
    if V_out(i) > 12
        V_out(i) = 12;
    end 
end
plot(V_in,V_out,'b*-')
xlabel('Input Voltage (V)');
ylabel('Output Voltage (V)');
title('Op-Amp Saturation');
grid on;
