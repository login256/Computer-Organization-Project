
//Instr define

//opcode:
`define opcodeR 6'b000000
`define opcodeORI 6'b001101
`define opcodeLW 6'b100011
`define opcodeSW 6'b101011
`define opcodeBEQ 6'b000100
`define opcodeLUI 6'b001111
`define opcodeJAL 6'b000011
`define opcodeJ 6'b000010
`define opcodeSH 6'b101001
`define opcodeSB 6'b101000
`define opcodeSWL 6'b101010
`define opcodeSWR 6'b101110
`define opcodeLH 6'b100001
`define opcodeLB 6'b100000
`define opcodeLWL 6'b100010
`define opcodeLWR 6'b100110
`define opcodeLHU 6'b100101
`define opcodeLBU 6'b100100

//funct:
`define functADDU 6'b100001
`define functSUBU 6'b100011
`define functSLL 6'b000000
`define functMULT 6'b011000
`define functMFLO 6'b010010
`define functMFHI 6'b010001
`define functJR 6'b001000
`define functJALR 6'b001001

//AluCtrl define
`define aluWidth	8
`define aluAdd	`aluWidth'b00000000
`define aluSub	`aluWidth'b00000001
`define aluAnd	`aluWidth'b00000010
`define aluOr	`aluWidth'b00000011
`define aluXor	`aluWidth'b00000100
`define aluNor	`aluWidth'b00000101
`define aluSll	`aluWidth'b00000110
`define aluSrl	`aluWidth'b00000111
`define aluSra	`aluWidth'b00001000
`define aluEq	`aluWidth'b00001001
`define aluLt	`aluWidth'b00001010
`define aluLe	`aluWidth'b00001011
`define aluGt	`aluWidth'b00001100
`define aluGe	`aluWidth'b00001101

//Save/LoadCtrl define
`define slword	3'b000
`define slhalf	3'b001
`define slbyte	3'b010
`define slwordleft	3'b011
`define slwordright	3'b100
`define slhalfu	3'b101
`define slbyteu	3'b110

//multiply and division control
`define mduMult		3'b000
`define mduMultu	3'b001
`define mduDiv		3'b010
`define mduDivu		3'b011
`define mduMtlo		3'b100
`define mduMthi		3'b101
//`define mduMadd	3'b110
//`define mduMaddu	3'b111
