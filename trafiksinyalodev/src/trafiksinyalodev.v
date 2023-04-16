module trafik_sinyal(
            input clk,
            output reg [2:0] led
);

reg [31:0] counter = 0;

always @(posedge clk) begin
    counter <= counter + 1;
    if (counter >= 0 && counter < 240_000_000) begin // 10 saniye  kırmızı LED 
        led <= 3'b110;
    end 
    else if (counter >= 240_000_000 && counter < 360_000_000) begin // 5 saniye yeşil LED 
        led <= 3'b011;
    end 
    else if (counter >= 360_000_000 && counter < 408_000_000) begin // 2 saniye mavi LED 
        led <= 3'b101;
    end 
    else begin // değilse tüm LED'ler kapalı 
        led <= 3'b111;
        counter <= 0;
        
    end
end

endmodule

