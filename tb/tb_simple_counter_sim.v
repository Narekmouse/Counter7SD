module simple_sim ();
reg         clock;
reg         reset;
reg         pause;
reg         reverse;
wire [6:0]  data;

Counter7SD C7SD(clock,reset,pause,reverse,data);

always #3 clock = ~ clock;


initial
begin
  $dumpfile("out.vcd");
  $dumpvars(0,simple_sim);
end

initial begin
  clock = 1;
//  pause = 1;
//  reverse = 1;
  #5 reset = 0;
  #5 reset = 1;
  #50 pause = 0;
  #50 pause = 1;

  #100 reset = 0;

  #10 $finish;
end
endmodule //
