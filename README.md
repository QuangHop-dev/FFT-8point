# FPGA Implementation of 8-Point FFT
Previously many tutorials are published on how to design the basic building blocks of a complex digital system. In this tutorial, we are going to implement a digital system to demonstrate the techniques involved in implementing a system. Fast Fourier Transform (FFT) is a very popular transform technique used in many fields of signal processing. In this tutorial, we have chosen 8-point Decimation In Time (DIT) based FFT to implement as an example project. We have implemented 8-point FFT on Spartan 3E FPGA target and obtained its design performances. This design may not be directly useful, but the techniques involved in this project will help in implementing other complex projects.

The basic signal flow diagram for 8-point DIT based FFT is shown below. In this case, input data samples are out of order but the output samples are in order. The different twiddle factors are also mentioned in that diagram. We will discuss the FPGA implementation without discussing any theory of FFT. For detailed theory of FFT any signal processing book can be refereed.

![image](https://github.com/user-attachments/assets/c00c106d-0111-4157-b59d-32dd3c50ab9f)

The FFT processor to be designed should have less number of input and outputs. The processor will have a clk pin, a reset pin and start pin as inputs. A pulse at the start pin will start the transform operation. The processor has two output vectors, one for real and one for imaginary part. The FFT processor is shown below in Fig. 2.

In this FPGA implementation, 16-bit fixed point data width is used throughout the design. 7-bits are reserved for integer part and 8-bits are for fractional part. The two’s complement data representation is used where the MSB is used for sign.

![image](https://github.com/user-attachments/assets/8c6f496c-6e2d-420e-9cb7-abb6b3972c7f)

# 8-point FFT Processor Datapath
The overall datapath for the FFT processor is shown in Fig. 3. We have used a ROM to store the data samples and in a single clock one data sample is read. The serial data stream from the ROM is made parallel by a Serial to Parallel (S2P) converter. The S2P holds the parallel data samples for the 8-point FFT block. The 8-point FFT block then comes into operation. The parallel data stream from the FFT block is again made serial by a Parallel to Serial (P2S) block. There are two P2S block, one for real and another for imaginary. The final output can then analyzed either in Chipscope Pro or by acquiring them to a PC.

![image](https://github.com/user-attachments/assets/2c7cc115-9510-4def-bfe8-a56fd50073bb)

1. Input Data Handling: The design of ROM is discussed in the tutorial for memory. The behavioral model of ROM takes data from a text file. In one transformation, only 8 data samples are required. The ROM has control enable pin which activates the ROM. The data samples are read by a counter which provides the addresses when the ROM is activated.

2. Serial to Parallel Conversion: The S2P block is shown in Fig. 4. for 4 data samples. This block has 4-registers of 16-bit width. Each register is controlled by a control enable pin. The input data flows to the output only when enable (en) signal is high. Timing diagram is also shown. The registers make the serial data into parallel in 4-clock cycles. For 8 data samples there will be 8-registers and it will take 8-clock cycles.

![image](https://github.com/user-attachments/assets/3bca9d42-6c4b-4a65-bf62-835f8149528c)

3. FFT Block: The FFT block is the main block which do the conversion of domain. The FFT block implements the signal flow diagram. We have structurally built the FFT block by the smaller sub-blocks. The architecture of the FFT block is shown in Fig. 5. We have applied moderate optimization to improve performance. The sub-blocks are discussed below.

![image](https://github.com/user-attachments/assets/32def289-3f20-4c69-9b0d-e31bffd890c8)

A. Butter Fly Sub-Blocks: In the signal flow diagram in Fig. 1, the basic butterfly block does two type of basic operations, viz., addition and subtraction. Thus we have designed a basic Butter Block 1 (BF1) which performs addition and substraction. The Butter Fly block 2 (BF2) is actually a optimized version of two BF1 blocks which either zero real or imaginary part.

![image](https://github.com/user-attachments/assets/c4d674a4-cbd3-417e-99f9-4aa6922917e8)

B. Complex Multiplier (CM): Complex multiplier multiplies two complex number. Multiplication of two complex number can be expressed as

![image](https://github.com/user-attachments/assets/b5519745-c735-49e4-ba2a-2651611a1c04)

In our case, as (a+jb) is variable but (c+jd) is constant. Thus the complex multiplication is reduced to the following.

![image](https://github.com/user-attachments/assets/fa0dc1e1-e67a-4644-af95-25305b9fe84b)

The complex multiplier block is shown below in Fig. 7. The multiplication by 0.7071 is achieved by a constant multiplier. This reduces the hardware requirement.

![image](https://github.com/user-attachments/assets/584a890d-9ee6-471e-b72f-167ea9e553ce)

C. Constant Multiplier: The design of constant multiplier is discussed in detail in tutorials of computational circuits. The multiplication by the constant 0.7071 can be expressed as

![image](https://github.com/user-attachments/assets/54fb755a-8fb0-4f1e-a12c-0a699b921bf4)

The constant multiplier is shown in Fig. 8. The RSH blocks are hardware wire-shift blocks to shift in right direction.

![image](https://github.com/user-attachments/assets/81fc0c84-410d-445a-9c1f-fc0dc017df7b)

D. Delay Block: The delay blocks are added to synchronize the operations. Several registers are connected serially to form delay blocks.

Further optimization is possible in the FFT block. Like, in the dotted box of Fig. 5 instead of 4 delay blocks two delay blocks can be placed before the SB2 block. This way applying optimization is necessary.

4. Parallel to Serial Conversion (P2S): After successful domain transfer by the FFT block, the parallel output from the FFT block must be made serial due output pin shortage or many systems accept serial data. The block diagram of P2S is shown in Fig. 9 for 4 data samples. The load pulse first loads the parallel data samples to the registers through the Muxes. Then the p2s signal made them serial. The timing diagram is also shown.

![image](https://github.com/user-attachments/assets/2502c3dd-c0b0-4bae-b971-5ce4daf8155c)

# Control Path of The FFT Processor

Proper operation of the FFT processor needs proper design of the controller. The control path for the FFT processor is shown in Fig. 10. Two important blocks in designing the controller is

![image](https://github.com/user-attachments/assets/06913a57-b9c2-4029-aa47-a5f358f99fa9)

A. Phase Generation (PG) Block: The PG block is shown in Fig. 11. The output phase (q) is generated when a start pulse is given and q is deactivated when a stop pulse is asserted. This block can be generated in other way but we have shown a simpler way to realize this operation.

![image](https://github.com/user-attachments/assets/8a52d12c-fb1d-480a-9b33-280d37d157e0)

B. Loadable Counter: Loadable counters are discussed in the tutorials for sequential circuits. Loadable counter generate a Terminal Count (tc) signal when particular limit value (lmt) is reached.

The start pulse generates en1 signal which activates the ROM and also goes to S2P block for serial to parallel conversion. The counter 1 provides address to the ROM. The counter generates tc1 signal after 8 clock pulses. The tc1 signal triggers another PG block. The second set of PG and counter block is for tracking the latency of the FFT block. After the latency of the FFT block, tc2 signal is generated which again triggers the 3rd set of PG-Counter blocks. The tc2 and en3 signal works as load and p2s signals in P2S block respectively. The tc2 signal is synced with the first output of FFT block.

# FFT Processor Output and Design Performance

The output of the FFT processor is shown in Fig. 12 according to the example shown [1]. Input data samples are real but output is imaginary.

![image](https://github.com/user-attachments/assets/706a65b7-9d0c-48f8-915c-d412f9e6d117)

The FFT processor is implemented on SPARTAN 3E starter kit. The design performance is shown below in the following table.

![image](https://github.com/user-attachments/assets/12701cdd-ba2a-465b-a24f-30ba26be3241)

# Reference

https://digitalsystemdesign.in/fpga-implementation-of-8-point-fft/?srsltid=AfmBOoqdNrs1TrYRv9OSMX85dwN1suHmjh7md2tyO7kTBEaIIRWocdlE
