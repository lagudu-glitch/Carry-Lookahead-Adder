module tb ();
    logic [15:0] tb_X;
    logic [15:0] tb_Y;
    logic [15:0] tb_S;
    logic tb_CO;

    // instance of DUT
    cla_16b test (.CI(1'b0), .A(tb_X), .B(tb_Y), .CO(tb_CO), .S(tb_S));

    initial begin
        
        $monitor ("A=%d, B=%d, CO=%d, S=%d", tb_X, tb_Y, tb_CO, tb_S);

        #1
        tb_X = 0;
        tb_Y = 0;

        #1
        tb_X = 1;
        tb_Y = 0;

        #1
        tb_X = 2;
        tb_Y = 1;

        #1
        tb_X = 2;
        tb_Y = 3;

        #1
        tb_X = 3;
        tb_Y = 3;

        #1
        tb_X = 7;
        tb_Y = 3;

        #1
        tb_X = 3;
        tb_Y = 12;

        #1
        tb_X = 10;
        tb_Y = 0;
        
        #1
        tb_X = 3;
        tb_Y = 4;

        #1
        tb_X = 14;
        tb_Y = 1;

        #1
        tb_X = 3;
        tb_Y = 6;

        #1
        tb_X = 7;
        tb_Y = 2;

        #1
        tb_X = 1;
        tb_Y = 5;

        #1
        tb_X = 6;
        tb_Y = 4;

        #1
        tb_X = 15;
        tb_Y = 15;

        #1
        $display("TEST COMPLETE");
        $finish();
    end

    // To dump signals to waveform
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars; 
    end

endmodule
    

