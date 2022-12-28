# CARRY LOOKAHEAD ADDER

This is a 16 - bit Carry Lookahead Adder implemented in system verilog. It can add and subtract numbers in the range [-32768, 32767). 
Opcode for add/subtract:
- ADD:       CI = 0
- SUBTRACT:  CI = 1
There is makefile present. Running the below command should run the test bench (cla_tb.sv) present in the repo.
```
make test
```
Make sure you have **Icarus Verilog** installed before running this command, else run the following command in terminal first or click [here](https://bleyer.org/icarus/) for windows install.\
Linux or WSL
```
sudo apt install iverilog
```
MacOs
```
brew install icarus-verilog
```
A .vcd file (dump.vcd) will be created at the end of simulation. You can view the signals by running the simulation with gtkwave. 
