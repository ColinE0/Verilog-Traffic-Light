module traffic(CLR, T, CLK, GN, YN, RN, GE, YE, RE);

//Inputs
input CLK, CLR, T;
//Outputs
output GN, YN, RN, GE, YE, RE;
output reg J, K;
output reg [7:0] count;
//Clock Control
always @(posedge CLK)
begin
  if (CLR)begin
      J <= 0;
      K <= 0;
      count <= 0;
  end
    else begin
        if (count == 19)
        begin
            count <= 0;
            J <= (T & K) | (~T & J);
            K <= (T & K) | (~T & ~J);
        end
        else begin
            count <= count + 1;
        end
    end
end
 //Assignments
assign RN = J;
assign YN = ~J & K;
assign GN = ~J&~K;
assign RE = ~J;
assign YE = J&~K;
assign GE = J&K;
//End
endmodule