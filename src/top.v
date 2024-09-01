module top (
    input clk,
	input resetn,

	output lcd_resetn,
	output lcd_clk,
	output lcd_cs,
	output lcd_rs,
	output lcd_data
);

reg [15:0]pixel;
wire [14:0] adr;

lcd114 lcd(clk, resetn, lcd_resetn, lcd_clk, lcd_cs, lcd_rs, lcd_data, pixel, adr);

/* RAM-Usage
Port A to write into the RAM
Port B for SPI-Module to read from RAM
*/

Gowin_DPB msb_ram(
        .douta(douta), //output [7:0] douta
        .doutb(doutb), //output [7:0] doutb
        .clka(clk), //input clka
        .ocea(ocea), //input ocea
        .cea(cea), //input cea
        .reseta(reseta), //input reseta
        .wrea(wrea), //input wrea
        .clkb(clk), //input clkb
        .oceb(oceb), //input oceb
        .ceb(ceb), //input ceb
        .resetb(resetb), //input resetb
        .wreb(wreb), //input wreb
        .ada(ada), //input [14:0] ada
        .dina(dina), //input [7:0] dina
        .adb(adb), //input [14:0] adb
        .dinb(dinb) //input [7:0] dinb
);

Gowin_DPB lsb_ram(
        .douta(douta), //output [7:0] douta
        .doutb(doutb), //output [7:0] doutb
        .clka(clk), //input clka
        .ocea(ocea), //input ocea
        .cea(cea), //input cea
        .reseta(reseta), //input reseta
        .wrea(wrea), //input wrea
        .clkb(clk), //input clkb
        .oceb(oceb), //input oceb
        .ceb(ceb), //input ceb
        .resetb(resetb), //input resetb
        .wreb(wreb), //input wreb
        .ada(ada), //input [14:0] ada
        .dina(dina), //input [7:0] dina
        .adb(adb), //input [14:0] adb
        .dinb(dinb) //input [7:0] dinb
);

always @(adr) begin
    if ((adr % 240) == 0) pixel <= 16'hf034;
    else pixel <= 0;
end
    
endmodule