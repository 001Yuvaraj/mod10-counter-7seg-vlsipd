module counter_7seg (
    input wire clk,
    input wire rst_n,
    input wire up_down,
    output reg [3:0] count,
    output reg [6:0] seg
);

    always @(posedge clk) begin
        if (!rst_n) begin
            count <= 4'b0000;
        end else begin
            if (up_down) begin
                if (count == 4'd9)
                    count <= 4'd0;
                else
                    count <= count + 1'b1;
            end else begin
                if (count == 4'd0)
                    count <= 4'd9;
                else
                    count <= count - 1'b1;
            end
        end
    end

    always @(*) begin
        case (count)
            4'd0: seg = 7'b0111111;
            4'd1: seg = 7'b0000110;
            4'd2: seg = 7'b1011011;
            4'd3: seg = 7'b1001111;
            4'd4: seg = 7'b1100110;
            4'd5: seg = 7'b1101101;
            4'd6: seg = 7'b1111101;
            4'd7: seg = 7'b0000111;
            4'd8: seg = 7'b1111111;
            4'd9: seg = 7'b1101111;
            default: seg = 7'b0000000;
        endcase
    end
endmodule
