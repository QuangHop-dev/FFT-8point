# FPGA Implementation of 8-Point FFT
Previously many tutorials are published on how to design the basic building blocks of a complex digital system. In this tutorial, we are going to implement a digital system to demonstrate the techniques involved in implementing a system. Fast Fourier Transform (FFT) is a very popular transform technique used in many fields of signal processing. In this tutorial, we have chosen 8-point Decimation In Time (DIT) based FFT to implement as an example project. We have implemented 8-point FFT on Spartan 3E FPGA target and obtained its design performances. This design may not be directly useful, but the techniques involved in this project will help in implementing other complex projects.

The basic signal flow diagram for 8-point DIT based FFT is shown below. In this case, input data samples are out of order but the output samples are in order. The different twiddle factors are also mentioned in that diagram. We will discuss the FPGA implementation without discussing any theory of FFT. For detailed theory of FFT any signal processing book can be refereed.

![image](https://github.com/user-attachments/assets/c00c106d-0111-4157-b59d-32dd3c50ab9f)
