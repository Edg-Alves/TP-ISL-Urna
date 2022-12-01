`include "Urna.v"
`default_nettype none

module tb_Urna();
reg tb_clk;
reg tb_finish;
reg tb_digit;
reg tb_swap;
reg tb_valid;

wire [7:0] tb_TotalC1;
wire [7:0] tb_TotalC2;
wire [7:0] tb_TotalNull;
wire tb_VoteStatus;

Urna urnatb
(
    .finish(tb_finish),
    .clk(tb_clk),
    .swap(tb_swap),
    .digit(tb_digit),
    .valid(tb_valid),
    .VoteStatus(tb_VoteStatus),
    .contadorC1(tb_TotalC1),
    .contadorC2(tb_TotalC2),
    .contadorNull(tb_TotalNull)
);

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) tb_clk=~tb_clk;

initial begin
    $dumpfile("tb_Urna.vcd");
    $dumpvars(0, tb_Urna);
end

reg [6:0] teste[0:18];
    integer i;

initial begin
      teste[0] = 7'b0_0_0_0_0_0_0;
      teste[1] = 7'b0_0_0_0_0_0_0;
      teste[2] = 7'b0_0_0_0_0_0_0;
      teste[3] = 7'b0_0_0_0_0_0_0;
      teste[4] = 7'b0_0_0_0_0_0_0;
      teste[5] = 7'b0_0_0_0_0_0_0;
      teste[6] = 7'b0_0_0_0_0_0_0;
      teste[7] = 7'b0_0_0_0_0_0_0;
      teste[8] = 7'b0_0_0_0_0_0_0;
      teste[9] = 7'b0_0_0_0_0_0_0;
      teste[10] = 7'b0_0_0_0_0_0_0;
      teste[11] = 7'b0_0_0_0_0_0_0;
      teste[12] = 7'b0_0_0_0_0_0_0;
      teste[13] = 7'b0_0_0_0_0_0_0;
      teste[14] = 7'b0_0_0_0_0_0_0;
      teste[15] = 7'b0_0_0_0_0_0_0;
      teste[16] = 7'b0_0_0_0_0_0_0;
      teste[17] = 7'b0_0_0_0_0_0_0;
      teste[18] = 7'b0_0_0_0_0_0_0;

      for (i = 0; i < 19; i = i + 1)
      begin
        tb_digit[0][0] = teste[i][3];
        tb_digit[1] = teste[i][4];
        tb_digit[2] = teste[i][5];
        tb_digit[3] = teste[i][6];
        tb_swap = teste[i][2];
        tb_valid = teste[i][1];
        tb_finish = teste[i][0];

        #10;
        $display("S1: %d S2: %d S3: %d S4: %d S5: %d", S1, S2, S3, S4, S5);
        $display("a: %d b: %d c: %d d: %d e: %d f: %d g: %d", a, b, c, d, e, f, g);
      end
end

endmodule
`default_nettype wire
