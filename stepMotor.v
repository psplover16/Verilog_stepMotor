module stepMotor(
input clk,
  output reg A_phase,  // A相信號
  output reg B_phase,  // B相信號
  output reg C_phase,  // C相信號
  output reg D_phase   // D相信號
);

reg [1:0] state;  // 用來追?步進馬達的狀態

  reg [23:0] freq; // 除頻
  always @(posedge clk) begin
    freq = freq + 1;
  end


always@(posedge freq[23])begin
if (state == 2'b00)
begin 
A_phase = 0;
B_phase = 1;
C_phase = 1;
D_phase = 0; 
end
else if (state == 2'b01)
begin 
A_phase = 0;
B_phase = 1;
C_phase = 0;
D_phase = 1; 
end
else if (state == 2'b10)
begin 
A_phase = 1;
B_phase = 0;
C_phase = 0;
D_phase = 1; 
end
else if (state == 2'b11)
begin 
A_phase = 1;
B_phase = 0;
C_phase = 1;
D_phase = 0; 
end
      state <= (state == 2'b11) ? 2'b00 : state + 1;
end

endmodule