module simple_sim ();
reg         clock;
reg         reset;
reg         pause;
reg         reverse;
wire [6:0]  data;

Counter7SD C7SD(clock,reset,pause,reverse,data);

initial
begin
  $dumpfile("sim/waveform/out.vcd");
  $dumpvars(0,simple_sim);
  $display("clock\treset\tpause\treverse\tdata");
end

always #5 clock = ~ clock;
always @ ( clock ) begin
  $display("%b\t%b\t%b\t%b\t%b",clock,reset,pause,reverse,data);
end

initial begin
  //clock = 1;
  start;
  simple_flow;
  $finish;
end

task start;
  clock = 1;
endtask

task simple_flow; begin
  reverse = 1;
  @(posedge clock)
    reset = 0;
  repeat(12)@(posedge clock)
    reset = 1;
  @(posedge clock)
    #10;
end
endtask

endmodule //
