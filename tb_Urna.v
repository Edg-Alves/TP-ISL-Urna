`include "Urna.v"
`default_nettype none

module tb_Urna();
reg tb_clk;
reg tb_finish;
reg tb_digit;
reg tb_swap;
reg tb_valid;

wire tb_TotalC1;
wire tb_TotalC2;
wire tb_TotalNull;
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
always #(CLK_PERIOD/2) clk=~clk;

initial begin
    $dumpfile("tb_Urna.vcd");
    $dumpvars(0, tb_Urna);
end

initial begin
    finish = 1'b0;
    digit = 4'b0010;
    valid = 1'b1;
    digit = 4'b0010;
    valid = 1'b1;
    $display("Status: %d", tb_VoteStatus);
end

endmodule
`default_nettype wire