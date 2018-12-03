
//Instr define

//opcode:
`define opcodeSPECIAL 6'b000000
`define opcodeREGIMM 6'b000001

`define opcodeADDI	6'b001000
`define opcodeADDIU	6'b001001
`define opcodeSLTI	6'b001010
`define opcodeSLTIU	6'b001011
`define opcodeANDI	6'b001100
`define opcodeORI	6'b001101
`define opcodeXORI	6'b001110

`define opcodeLUI	6'b001111

`define opcodeLB	6'b100000
`define opcodeLH	6'b100001
`define opcodeLWL	6'b100010
`define opcodeLW	6'b100011
`define opcodeLBU	6'b100100
`define opcodeLHU	6'b100101
`define opcodeLWR	6'b100110

`define opcodeSB	6'b101000
`define opcodeSH	6'b101001
`define opcodeSWL	6'b101010
`define opcodeSW	6'b101011
`define opcodeSWR	6'b101110

`define opcodeBEQ	6'b000100
`define opcodeBNE	6'b000101

`define opcodeBLEZ	6'b000110
`define opcodeBGTZ	6'b000111

`define opcodeJ		6'b000010

`define opcodeJAL	6'b000011


//funct:
`define functADD	6'b100000
`define functADDU	6'b100001
`define functSUB	6'b100010
`define functSUBU	6'b100011
`define functAND	6'b100100
`define functOR		6'b100101
`define functXOR	6'b100110
`define functNOR	6'b100111

`define functSLLV	6'b000100
`define functSRLV	6'b000110
`define functSRAV	6'b000111

`define functSLT	6'b101010
`define functSLTU	6'b101011

`define functSLL	6'b000000
`define functSRL	6'b000010
`define functSRA	6'b000011

`define functMULT	6'b011000
`define functMULTU	6'b011001
`define functDIV	6'b011010
`define functDIVU	6'b011011

`define functMFHI	6'b010000
`define functMFLO	6'b010010

`define functMTHI	6'b010001
`define functMTLO	6'b010011

`define functJR		6'b001000

`define functJALR	6'b001001


//rt
`define rtBLTZ	5'b00000
`define rtBGEZ	5'b00001

//EXT define
`define extUnsigned	2'b00
`define extSigned	2'b01
`define extLui		2'b10
`define ext1		2'b11


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
`define aluLtu	`aluWidth'b00001110
`define aluLeu	`aluWidth'b00001111
`define aluGtu	`aluWidth'b00010000
`define aluGeu	`aluWidth'b00010001
`define aluSllv	`aluWidth'b00010010
`define aluSrlv	`aluWidth'b00010011
`define aluSrav	`aluWidth'b00010100

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
