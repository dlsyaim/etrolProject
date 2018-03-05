PROGRAM com1tx
VAR_EXTERNAL

END_VAR

VAR_GLOBAL

END_VAR

VAR
i		   :  UINT;	
ai0_val    :  REAL :=0.0;
ai1_val    :  REAL :=0.0;
ai2_val    :  REAL :=0.0;
ai3_val    :  REAL :=0.0;
ai4_val    :  REAL :=0.0;
ai5_val    :  REAL :=0.0;
ai6_val    :  REAL :=0.0;
ai7_val    :  REAL :=0.0;
ai8_val    :  REAL :=0.0;
ai9_val    :  REAL :=0.0;
ai10_val    :  REAL :=0.0;
ai11_val    :  REAL :=0.0;
addr_val	:  UINT;
button AT %I0.0		:	BOOL;
blinker AT %Q0.6 	:	BOOL;
adr_var : UINT;
val_var : UINT;
lock_var : UINT := 0;
duishe_var : UINT := 0;
jinkoup_var : REAL;
chukoup_var : REAL;
huanrewd_var : REAL;

REG_W_UINT_VAR : REG_W_UINT;
REG_R_UINT_VAR : REG_R_UINT;
REG_MOVE_VAR   : REG_MOVE;
REG_R_REAL_VAL : REG_R_REAL;
REG_W_REAL_VAL : REG_W_REAL;
END_VAR
(*压变，温变采集*)

addr_val := 30017;
REG_R_REAL_VAL(ADDR := addr_val, SWAP := 0);
ai0_val := (REG_R_REAL_VAL.DATA - 4.0)/16.0 * 10000.0;
addr_val := 40001;
REG_W_REAL_VAL(ADDR := addr_val, SWAP := 0, DATA := ai0_val);

addr_val := 30019;
REG_R_REAL_VAL(ADDR := addr_val, SWAP := 0);
ai0_val := (REG_R_REAL_VAL.DATA - 4.0)/16.0 * 120.0 - 40.0;
addr_val := 40003;
REG_W_REAL_VAL(ADDR := addr_val, SWAP := 0, DATA := ai0_val);

addr_val := 30021;
REG_R_REAL_VAL(ADDR := addr_val, SWAP := 0);
ai0_val := (REG_R_REAL_VAL.DATA - 4.0)/16.0 * 6000.0;
addr_val := 40005;
REG_W_REAL_VAL(ADDR := addr_val, SWAP := 0, DATA := ai0_val);


addr_val := 30023;
REG_R_REAL_VAL(ADDR := addr_val, SWAP := 0);
ai0_val := (REG_R_REAL_VAL.DATA - 4.0)/16.0 * 6000.0;
addr_val := 40007;
REG_W_REAL_VAL(ADDR := addr_val, SWAP := 0, DATA := ai0_val);

addr_val := 30025;
REG_R_REAL_VAL(ADDR := addr_val, SWAP := 0);
ai0_val := (REG_R_REAL_VAL.DATA - 4.0)/16.0 * 6000.0;
addr_val := 40009;
REG_W_REAL_VAL(ADDR := addr_val, SWAP := 0, DATA := ai0_val);


addr_val := 30027;
REG_R_REAL_VAL(ADDR := addr_val, SWAP := 0);
ai0_val := (REG_R_REAL_VAL.DATA - 4.0)/16.0 * 6000.0;
addr_val := 40011;
REG_W_REAL_VAL(ADDR := addr_val, SWAP := 0, DATA := ai0_val);

addr_val := 30029;
REG_R_REAL_VAL(ADDR := addr_val, SWAP := 0);
ai0_val := (REG_R_REAL_VAL.DATA - 4.0)/16.0 * 6000.0;
addr_val := 40013;
REG_W_REAL_VAL(ADDR := addr_val, SWAP := 0, DATA := ai0_val);


addr_val := 30031;
REG_R_REAL_VAL(ADDR := addr_val, SWAP := 0);
ai0_val := (REG_R_REAL_VAL.DATA - 4.0)/16.0 * 120.0 - 40.0;
addr_val := 40015;
REG_W_REAL_VAL(ADDR := addr_val, SWAP := 0, DATA := ai0_val);


addr_val := 30033;
REG_R_REAL_VAL(ADDR := addr_val, SWAP := 0);
ai0_val := (REG_R_REAL_VAL.DATA - 4.0)/16.0 * 100.0;
addr_val := 40089;
REG_W_REAL_VAL(ADDR := addr_val, SWAP := 0, DATA := ai0_val);

addr_val := 30035;
REG_R_REAL_VAL(ADDR := addr_val, SWAP := 0);
ai0_val := (REG_R_REAL_VAL.DATA - 4.0)/16.0 * 100.0;
addr_val := 40101;
REG_W_REAL_VAL(ADDR := addr_val, SWAP := 0, DATA := ai0_val);

addr_val := 30037;
REG_R_REAL_VAL(ADDR := addr_val, SWAP := 0);
ai0_val := (REG_R_REAL_VAL.DATA - 4.0)/16.0 * 100.0;
addr_val := 40017;
REG_W_REAL_VAL(ADDR := addr_val, SWAP := 0, DATA := ai0_val);

addr_val := 30039;
REG_R_REAL_VAL(ADDR := addr_val, SWAP := 0);
ai0_val := (REG_R_REAL_VAL.DATA - 4.0)/16.0 * 100.0;
addr_val := 40019;
REG_W_REAL_VAL(ADDR := addr_val, SWAP := 0, DATA := ai0_val);

addr_val := 30041;
REG_R_REAL_VAL(ADDR := addr_val, SWAP := 0);
ai0_val := (REG_R_REAL_VAL.DATA - 4.0)/16.0 * 500.0;
addr_val := 40115;
REG_W_REAL_VAL(ADDR := addr_val, SWAP := 0, DATA := ai0_val);
 
END_PROGRAM