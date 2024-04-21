module stepMotor(
input clk,
  output reg A_phase,  // A�۫H��
  output reg B_phase,  // B�۫H��
  output reg C_phase,  // C�۫H��
  output reg D_phase   // D�۫H��
);

reg [1:0] state;  // �ΨӰl?�B�i���F�����A

  reg [23:0] freq; // ���W
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