module Urna #(
parameter inicio = 2'b00,
parameter digito1 = 2'b01,
parameter digito2 = 2'b10)
(
    input clk,							
    input digit,				
    input valid,
    input swap,				
    input finish,			

    output reg [1:0] VoteStatus,
    output reg [7:0] TotalC1,			
    output reg [7:0] TotalC2,			
    output reg [7:0] TotalNull			

);	  

reg [3:0] digito1C1;					
reg [3:0] digito1C2;					

reg [3:0] contadorC1;						
reg [3:0] contadorC2;						
reg [3:0] contadorNulL;

reg [1:0] estado_atual, proximo_estado;		

always @(negedge finish or posedge valid)
	begin
		case (estado_atual)														

			inicio: if (!finish)											
						begin
							proximo_estado <= digito1;								
						end	

					else
						begin							
							contadorC1 <= 8'b0;										
							contadorC2 <= 8'b0;
							contadorNulL <= 8'b0;
							proximo_estado <= inicio;								
						end
				
			digito1: if (finish == 1'b1)									
						begin
							proximo_estado <= finish;								
						end
					else if (digit == 4'b0001 && valid == 1'b1)
						begin
							digito1C1 <= 4'b0001;
							proximo_estado <= digito2;
						end
					else if (digit == 4'b0010 && valid == 1'b1)
						begin
							digito1C2 <= 4'b0010;
							proximo_estado <= digito2;
						end
					else
						begin
							proximo_estado <= digito2;
						end