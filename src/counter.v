//~ [Project]
//~ name          = Counter for Seven-segment display
//~ organization  = RAU:Russian-Armenian University
//~ description   =
//~ [Autor]
//~ name          = Narek Kostanyan
//~ update        = 10 September 2017

module Counter7SD(
  clock,
  reset,
  pause,
  reverse,
  data
  );
// I/O pins direction definition
input             clock;
input             reset;
input             pause;
input             reverse;
output reg [6:0]  data;
       reg [6:0]  temp_data;
// Constant values used in design

// 7 segment display states
// segment      =    abcdefg
// Number States
parameter ZERO  = 7'b1111110; // 0
parameter ONE   = 7'b0110000; // 1
parameter TWO   = 7'b1101101; // 2
parameter THREE = 7'b1101101; // 3
parameter FOUR  = 7'b0110011; // 4
parameter FIVE  = 7'b1011011; // 5
parameter SIX   = 7'b1011011; // 6
parameter SEVEN = 7'b1110000; // 7
parameter EIGHT = 7'b1111111; // 8
parameter NINE  = 7'b1111011; // 9

/*
parameter ZERO  = 0; // 0
parameter ONE   = 1; // 1
parameter TWO   = 2; // 2
parameter THREE = 3; // 3
parameter FOUR  = 4; // 4
parameter FIVE  = 5; // 5
parameter SIX   = 6; // 6
parameter SEVEN = 7; // 7
parameter EIGHT = 8; // 8
parameter NINE  = 9; // 9
*/

// Extra States
parameter PAUSE = 7'b1100111; // P
parameter HOLD  = 7'b0110111; // H

always @ ( posedge clock ) begin
  if (pause==0)
    data <= PAUSE;
  else
    data <= temp_data;
  case(reset)
    0: temp_data <= HOLD;
    1: case (pause)
              0: temp_data <= temp_data;
        default: case (temp_data)
                  HOLD:   case (reverse)
                                  0: temp_data <= ONE;
                            default: temp_data <= NINE;
                          endcase
                  ZERO:   case (reverse)
                                  0: temp_data <= ONE;
                            default: temp_data <= NINE;
                          endcase
                  ONE:    case (reverse)
                                  0: temp_data <= TWO;
                            default: temp_data <= ZERO;
                          endcase
                  TWO:    case (reverse)
                                  0: temp_data <= THREE;
                            default: temp_data <= ONE;
                          endcase
                  THREE:  case (reverse)
                                  0: temp_data <= FOUR;
                            default: temp_data <= TWO;
                          endcase
                  FOUR:   case (reverse)
                                  0: temp_data <= FIVE;
                            default: temp_data <= THREE;
                          endcase
                  FIVE:   case (reverse)
                                  0: temp_data <= SIX;
                            default: temp_data <= FOUR;
                          endcase
                  SIX:     case (reverse)
                                  0: temp_data <= SEVEN;
                            default: temp_data <= FIVE;
                          endcase
                  SEVEN:  case (reverse)
                                  0: temp_data <= EIGHT;
                            default: temp_data <= SIX;
                          endcase
                  EIGHT:  case (reverse)
                                  0: temp_data <= NINE;
                            default: temp_data <= SEVEN;
                          endcase
                  NINE:   case (reverse)
                                  0: temp_data <= ZERO;
                            default: temp_data <= EIGHT;
                          endcase
                  default:temp_data <= HOLD;
                endcase
       endcase
  endcase
end
endmodule // Counter7SD
