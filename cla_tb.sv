module tb ();
    logic tb_CO, tb_CI;
    logic signed [15:0] tb_X, tb_Y, tb_S;

    // instance of DUT
    cla_16b test (.CI(tb_CI), .A(tb_X), .B(tb_Y), .CO(tb_CO), .S(tb_S));

    initial begin
        
        $monitor ("A=%d, B=%d, CI=%d, CO=%d, S=%d", tb_X, tb_Y, tb_CI, tb_CO, tb_S);

        #1
        tb_X = 0;
        tb_Y = 0;
        tb_CI = 0;

        #1
        tb_X = 1;
        tb_Y = 1;
        tb_CI = 0;

        #1
        tb_X = 1;
        tb_Y = 1;
        tb_CI = 1;

        #1
        tb_X = 0;
        tb_Y = 0;
        tb_CI = 1;

        #1
        tb_X = 32767;
        tb_Y = 32767;
        tb_CI = 1;

        #1
        tb_X = 30000;
        tb_Y = 2767;
        tb_CI = 0;

        #1
        tb_X = 54;
        tb_Y = 46;
        tb_CI = 0;

        #1
        tb_X = 200;
        tb_Y = 100;
        tb_CI = 1;

        #1
        tb_X = 444;
        tb_Y = 666;
        tb_CI = 0;

        #1
        tb_X = 444;
        tb_Y = 666;
        tb_CI = 1;

        #1
        tb_X = 32767;
        tb_Y = 32767;
        tb_CI = 0;

        #1
        tb_X = -20;
        tb_Y = -20;
        tb_CI = 0;

        #1
        tb_X = -20;
        tb_Y = -20;
        tb_CI = 1;

        #1
        tb_X = -3000;
        tb_Y = -200;
        tb_CI = 0;

        #1
        tb_X = -3000;
        tb_Y = -200;
        tb_CI = 1;

        #1
        $display("TEST COMPLETE");
        $finish();
    end

    // To dump signals to waveform
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb); 
    end

endmodule
    

