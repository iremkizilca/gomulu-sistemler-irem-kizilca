module cift_port_sync_ram
 # (parameter ADDR_WIDTH = 4,
   parameter DATA_WIDTH = 16,
   parameter DEPTH =16
   )

 ( input                  oku_clk,
   input                  yaz_clk,
   input [ADDR_WIDTH-1:0] oku_addr,
   input [ADDR_WIDTH-1:0] yaz_addr,
   input [DATA_WIDTH-1:0] data,
   input                  cs,
   input                  we,
   input                  oe,
   output reg [DATA_WIDTH-1:0] oku_data
 );

reg [DATA_WIDTH-1:0] tmp_data;
reg [DATA_WIDTH-1:0] ram [DEPTH-1:0]; // 16 bit veri öbeği, 16 satır

always @(posedge yaz_clk) begin //Yükselen kenarda yazma
    if (cs & we) 
      ram[yaz_addr] <= data;
 end

always @(negedge oku_clk) begin //Düşen kenarda okuma
    if (cs & !we)
       tmp_data <= ram[oku_addr];
  end

 assign oku_data = cs & oe & !we ? tmp_data : 'hz;

endmodule