% Initial Values
Fs = 100;
f = 1;
varphi = 0;
pause_time = 1;
pause_time_audio = 0.2;

% Create a figure.
h_PSD_Window = figure('name', 'PSD_Window');

% Effect of Changing N
for N = 20:20:300
    if(isgraphics(h_PSD_Window))
       set(0, 'CurrentFigure', h_PSD_Window)
    else
       break;
    end
    [x,~] = GetSine(f, varphi, Fs, N);
    myPlotPSD_Window(x, Fs);
    pause(pause_time);
end

% Effect of Changing varphi
for varphi = 0:pi/4:2*pi
    if(isgraphics(h_PSD_Window))
       set(0, 'CurrentFigure', h_PSD_Window)
    else
       break;
    end
    [x,~] = GetSine(f, varphi, Fs, N);
    myPlotPSD_Window(x, Fs);
    pause(pause_time);
end

% A real signal.
[x,Fs] = audioread('audio_data.wav');
N_1 = 182-1;

for i = 1:length(x)-N_1
    if(isgraphics(h_PSD_Window))
       set(0, 'CurrentFigure', h_PSD_Window)
    else
       break;
    end
    myPlotPSD_Window(x(i:i+N_1,2),Fs);
    pause(pause_time_audio);
end

% This helper function obtains a sine wave.
function [x,t] = GetSine(f, varphi, Fs, N)
    t = transpose((0:N-1)/Fs);
    x = sin(2*pi*f*t + varphi);
end