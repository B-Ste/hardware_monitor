module wrapper (
    input clk,
    input resetn,
    
    output lcd_resetn,
	output lcd_clk,
	output lcd_cs,
	output lcd_rs,
	output lcd_data
);

reg [7:0] i_0 = 8'b00000000;
reg [7:0] i_1 = 8'b01001010;
reg [7:0] i_2 = 8'b01001010;
reg [7:0] i_3 = 8'b01001000;
reg [7:0] i_4 = 8'b01111010;
reg [7:0] i_5 = 8'b01001010;
reg [7:0] i_6 = 8'b01001010;
reg [7:0] i_7 = 8'b00000000;

reg [31:0]ctr;

monitor monitor(clk, resetn, i_0, i_1, i_2, i_3, i_4, i_5, i_6, i_7, lcd_resetn, lcd_clk, lcd_cs, lcd_rs, lcd_data);
    
endmodule