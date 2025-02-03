`include "traffic.v"
`timescale 10ns/10ns
module traffic_test;
//wire
 wire [7:0]count;
 //Input
 reg CLR;
  reg T = 1'b0;
  reg CLK = 1'b0;
  always 
  begin 
   CLK<=~CLK;
   #5;
  end
 //Clock
  always @(posedge CLK)begin
    if (count == 19)begin
      T = ~T; #10;
    end
  end
//Wires
 wire GN, YN, RN, GE, YE, RE;

  traffic UUT (CLR, T, CLK, GN, YN, RN, GE, YE, RE);
  initial begin
    $dumpfile("traffic.vcd");
    $dumpvars(0,traffic_test);
    $display("Start of test.");
    CLR <= 1'b1; #10;
    CLR <= 1'b0; #10;

    $display("T | GN YN RN | GE YE RE");
    for (integer i = 0; i < 11; i = i + 1)
    begin
      $display("%b |  %b  %b  %b  |  %b  %b  %b ", T, GN, YN, RN, GE, YE, RE); #200; T = ~T; 
    end
    $display("Test terminated."); 
    $finish;
end
endmodule