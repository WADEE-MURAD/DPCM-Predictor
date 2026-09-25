# DPCM Predictor

MATLAB project implementing and analyzing **Differential Pulse Code Modulation (DPCM) predictors**.

## Features

* First-order prediction
* Optimum predictor coefficient calculation
* MSE and prediction gain analysis
* Effect of signal frequency on prediction
* Second-order predictor
* MATLAB plots and analysis

## Results

* **Dynamic Range Reduction:** On the discrete test sequence, first-order prediction compressed the signal's dynamic range from 13 down to 2, significantly lowering the quantization bit-depth required.
* **First-Order Optimization:** Deriving the optimum coefficient ($a_{\text{opt}} \approx 1.1045$) via least-squares minimized the sequence MSE to **0.856**, outperforming the fixed coefficient sweep.
* **Prediction Gain:** For the smooth dual-tone signal ($2\cos(0.05\pi n) + 0.5\cos(0.2\pi n)$), the predictor achieved a prediction gain of **21.81 (13.39 dB)** with $a_{\text{opt}} \approx 0.9762$ (MSE $\approx 0.0962$). Because of strong adjacent-sample correlation, the simple unit-delay predictor ($a = 1$) was already within 1.22% of optimum performance.
* **Frequency Dependency:** Low-frequency signals exhibited high inter-sample correlation and strong positive prediction gain. Higher frequency signals ($2\cos(0.6\pi n)$) broke sample-to-sample correlation, resulting in negative prediction gain ($G_p < 0\text{ dB}$).
* **Second-Order Predictor:** Solving the normal equations yielded coefficients $a_1 \approx 1.4589$ and $a_2 \approx -0.3995$, driving the MSE down to **0.7097**—a **~16% improvement** over the optimal first-order predictor (MSE $\approx 0.8465$) by exploiting multi-lag correlation.

## Technologies

* MATLAB
* Signal Processing

## Course

**ENEE3309 – Communication Systems**