module counter_7seg_tb;
    reg clk;
    reg rst_n;
    reg up_down;
    wire [3:0] count;
    wire [6:0] seg;

    counter_7seg uut (
        .clk(clk),
        .rst_n(rst_n),
        .up_down(up_down),
        .count(count),
        .seg(seg)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("output/counter_sim.vcd");
        $dumpvars(0, counter_7seg_tb);

        clk = 0;
        rst_n = 0;
        up_down = 1;

        #20;
        rst_n = 1;
        #120;
        up_down = 0;
        #120;
        $finish;
    end
endmodule
