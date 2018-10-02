function myPlotPSD_Window(x, Fs)

N = length(x);
t = (0:N-1)/Fs;
T = N/Fs;

Correction = 1/mean(hanning(N).^2);

% Periodogram Power Spectrum
[px1, fpx1] = periodogram(x, [], N, Fs, 'centered', 'psd');
delta_fpx1 = mean(diff(fpx1));
% Periodogram Power Spectrum with a Window
[px2, fpx2] = periodogram(x, hanning(N), N, Fs, 'centered', 'psd');
delta_fpx2 = mean(diff(fpx2));

subplot(2,2,1);plot(t,x,'.-');xlabel('Time (s)');
title(['N = ' num2str(N) '    Fs = ' num2str(Fs) ' Hz']);
text(0.98, 0.95, ['T = ' num2str(T) ' s'], 'Units', 'normalized', 'HorizontalAlignment', 'right');
text(0.98, 0.875, ['Power = ' num2str(mean(abs(x).^2))], 'Units', 'normalized', 'HorizontalAlignment', 'right');

subplot(2,2,2);plot(t,x.*hanning(N),'.-');xlabel('Time (s)');
title('Signal with a Window');
text(0.98, 0.95, ['T = ' num2str(T) ' s'], 'Units', 'normalized', 'HorizontalAlignment', 'right');
text(0.98, 0.875, ['Power = ' num2str(mean(abs(x.*hanning(N)).^2))], 'Units', 'normalized', 'HorizontalAlignment', 'right');

subplot(2,2,3);stairs(fpx1-0.5*delta_fpx1, px1,'-');xlabel('Frequency (Hz)');
title('PSD');
text(0.98, 0.95, ['Max Strength = ' num2str(max(px1))], 'Units', 'normalized', 'HorizontalAlignment', 'right');
text(0.98, 0.875, ['Integral = ' num2str(sum(px1)*delta_fpx1)], 'Units', 'normalized', 'HorizontalAlignment', 'right');

subplot(2,2,4);stairs(fpx2-0.5*delta_fpx2, px2,'-');xlabel('Frequency (Hz)');
title('PSD with a Window');
text(0.98, 0.95, ['Max Strength = ' num2str(max(px2))], 'Units', 'normalized', 'HorizontalAlignment', 'right');
text(0.98, 0.875, ['Integral = ' num2str(sum(px2)*delta_fpx2)], 'Units', 'normalized', 'HorizontalAlignment', 'right');
text(0.98, 0.80, ['Integral / Correction = ' num2str(sum(px2)*delta_fpx2 / Correction)], 'Units', 'normalized', 'HorizontalAlignment', 'right');

end