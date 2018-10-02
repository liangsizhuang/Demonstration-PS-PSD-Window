# Demonstration-PS-PSD-Window
This is a demonstration to see the effect of applying a window on a signal. There is a window parameter in periodogram. A window is first applied to the signal and then the FFT is calculated. The Power Spectrum (PS) and the Power Spectral Density (PSD) of the windowed signal is then obtained. However, the periodogram function scales the resulting PS and PSD by correction factors to compensate for the loss of power due to the application of the window. The correction factor of PS is different from that of PSD (See the codes for details).

After correction, the PS and PSD become estimated PS and PSD. Interestingly, the summation of all spectral lines in the estimated PS is not equal to the power of the signal before windowing. Similarly, the integral of the estimated PSD is not equal to the power of the signal before windowing. Strangely, the summation of the estimated PS is not equal to the integral of the estimated PSD. However, these values are close to the power of the original signal. I felt like that the integral of the estimated PSD is more close to the power of the original signal. Hence, it is recommended to use PSD if a window is used.

![alt text](https://github.com/liangsizhuang/Demonstration-PS-PSD-Window/blob/master/figure_PS.png)

![alt text](https://github.com/liangsizhuang/Demonstration-PS-PSD-Window/blob/master/figure_PSD.png)
