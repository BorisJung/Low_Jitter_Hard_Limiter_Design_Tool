## Low Jitter Hard Limiter Design Tool

This tool was developed while designing the hard limiter input stage for the phase noise measurement system during the work on my Bachelor's Thesis.

It makes use of the design guide for low jitter hard limiters by Oliver M. Collins published in the following IEEE paper:

[The Design of Low Jitter Hard Limiters](https://ieeexplore.ieee.org/document/494304)

The script is meant to be used by executing ***jitter_calc.m*** in MatLab. It starts with a user input window, where the given design parameters from the collins paper are entered. The script then calculates gain distribution, time constants, resulting jitter and some other parameters.
