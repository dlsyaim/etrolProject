PROGRAM RX1
VAR_EXTERNAL
jiachou : udint;
flow_val : REAL;
start_val : uint;

END_VAR

VAR_GLOBAL
jiachou1 : udint:=0;
END_VAR

VAR
tjf_ya1_val : uint;
tjf2_ya1_val : uint;
tjf_kd1_val : uint; 
tjf_ya2_val : uint;
tjf_kd2_val : uint; 
i : uint;
j : uint;
blinker AT %Q0.4 	:	BOOL;
djr_start AT %Q1.5  :   BOOL;
djr_stop  AT %Q1.6  :   BOOL;
djr_par : uint;
dir_mode : uint;
dir_temp : uint;
djr_qd   : uint;
djr_tz   : uint;
djr_settemp : REAL;
dir_settemp_val : uint;
dir_fktemp : uint;
jiachounew : udint;
par_var :uint;
lock_var : uint;
szd_var	:uint;
addr_val : uint;
shunshi_val : REAL;
tongji_val : REAL;
sdyl : REAL;
sdyl_val :uint;
sdyl1 : REAL;
sdyl1_val :uint;
tjf1_qd : uint;
ai0_val : REAL;
tjf_mode :uint;
tjf2_mode :uint;
sd_fw : REAL;
sd_fw_val : uint;
sd2_fw : REAL;
sd2_fw_val : uint;
tjf_xg : uint;
tjf2_xg :uint;
REG_W_UINT_VAR : REG_W_UINT;
REG_R_UINT_VAR : REG_R_UINT;
REG_MOVE_VAR   : REG_MOVE;
REG_R_REAL_VAL : REG_R_REAL;
REG_W_REAL_VAL : REG_W_REAL;
Timer : TON;
END_VAR

(* Variable definition *)
VAR

    clear_all : PID_CLEAR_ALL;

    adr_cfg : PID_ADDR_CFG;

    adr_q : BOOL;

    val_cfg : PID_PARA_SET;

    val_q : BOOL;

    ena : PID_ENABLE;

    ena_q : BOOL;

    state : PID_AUTO;

    state_q : BOOL;

END_VAR

(*调节阀1控制*)
REG_R_UINT_VAR(ADDR := 40097);
tjf_mode := REG_R_UINT_VAR.DATA;
REG_R_UINT_VAR(ADDR := 40098);
tjf_xg := REG_R_UINT_VAR.DATA;
IF tjf_xg=1 THEN
	REG_W_UINT_VAR(ADDR := 40098, DATA := 0);
	addr_val := 40095;
	REG_R_REAL_VAL(ADDR := addr_val, SWAP := 0);
	sd_fw := (REG_R_REAL_VAL.DATA)/100.0 * 40000.0 + 10000.0;
	sd_fw_val := REAL_TO_uint(sd_fw);
	REG_W_UINT_VAR(ADDR := 40200, DATA := sd_fw_val);
END_IF;


REG_R_UINT_VAR(ADDR := 40097);
tjf_mode := REG_R_UINT_VAR.DATA;
REG_W_UINT_VAR(ADDR := 40091, DATA := tjf_mode);

addr_val := 40005;
REG_R_REAL_VAL(ADDR := addr_val, SWAP := 0);
ai0_val := REG_R_REAL_VAL.DATA;
addr_val := 40087;
REG_W_REAL_VAL(ADDR := addr_val, SWAP := 0, DATA := ai0_val);


(*调节阀2控制*)
REG_R_UINT_VAR(ADDR := 40109);
tjf2_mode := REG_R_UINT_VAR.DATA;
REG_R_UINT_VAR(ADDR := 40110);
tjf2_xg := REG_R_UINT_VAR.DATA;
IF tjf2_xg=1 THEN
	REG_W_UINT_VAR(ADDR := 40110, DATA := 0);
	addr_val := 40107;
	REG_R_REAL_VAL(ADDR := addr_val, SWAP := 0);
	sd2_fw := (REG_R_REAL_VAL.DATA)/100.0 * 40000.0 + 10000.0;
	sd2_fw_val := REAL_TO_uint(sd2_fw);
	REG_W_UINT_VAR(ADDR := 40201, DATA := sd2_fw_val);
END_IF;

REG_R_UINT_VAR(ADDR := 40109);
tjf_mode := REG_R_UINT_VAR.DATA;
REG_W_UINT_VAR(ADDR := 40103, DATA := tjf_mode);

addr_val := 40007;
REG_R_REAL_VAL(ADDR := addr_val, SWAP := 0);
ai0_val := REG_R_REAL_VAL.DATA;
addr_val := 40099;
REG_W_REAL_VAL(ADDR := addr_val, SWAP := 0, DATA := ai0_val);


(*电加热*)
REG_R_UINT_VAR(ADDR := 40121);
djr_par := REG_R_UINT_VAR.DATA;
IF djr_par=1 THEN
	REG_W_UINT_VAR(ADDR := 40121, DATA := 0);
	REG_R_UINT_VAR(ADDR := 40117);
	djr_qd := REG_R_UINT_VAR.DATA;
	IF djr_qd=1 THEN
		djr_start := TRUE;
		REG_R_REAL_VAL(ADDR := 40119, SWAP := 0);
		djr_settemp := (REG_R_REAL_VAL.DATA)/500.0 * 40000.0 + 10000.0;
		dir_settemp_val := REAL_TO_uint(djr_settemp);
		REG_W_UINT_VAR(ADDR := 40304, DATA := dir_settemp_val);
		(*REG_R_UINT_VAR(ADDR := 30013);
		dir_fktemp := REG_R_UINT_VAR.DATA;
		REG_W_UINT_VAR(ADDR := 40305, DATA := dir_fktemp);*)
	ELSE
		djr_start := FALSE;
	END_IF;
	
	REG_R_UINT_VAR(ADDR := 40118);
	djr_tz := REG_R_UINT_VAR.DATA;
	IF djr_tz=1 THEN
		djr_stop := TRUE;
	ELSE
		djr_stop := FALSE;
	END_IF;
	
END_IF;

END_PROGRAM