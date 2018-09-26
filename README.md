# Demonstration-PS-Window
This is a demonstration to see the effect of applying a window on a signal. There is a window parameter in periodogram. A window is first applied to the signal and then the FFT is calculated. We take the square of the absolute value of the FFT to obtain the power spectrum of the windowed signal. However, the periodogram function scales the result by a correction factor to compensate for the loss of power due to the application of the window. The correct factor is one over the square of the mean of the window. One will see that applying a window does not necessarily improve the power spectrum estimation of the input signal.

![alt text](https://github.com/liangsizhuang/Demonstration-PS-Window/blob/master/figure.png)
