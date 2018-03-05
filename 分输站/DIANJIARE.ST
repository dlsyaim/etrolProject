PROGRAM DIANJIARE
VAR_EXTERNAL

END_VAR

VAR_GLOBAL

END_VAR

VAR
blinker AT %Q0.0 	:	BOOL;
blinker2 AT %Q0.1 	:	BOOL;
blinker3 AT %Q0.2   :   BOOL;
blinker4 AT %Q0.3   :   BOOL;
blinker5 AT %Q0.4   :   BOOL;
blinker6 AT %Q0.5   :   BOOL;
blinker7 AT %Q0.6   :   BOOL;
blinker8 AT %Q0.7   :   BOOL;
blinker9 AT %Q1.0   :   BOOL;
blinker10 AT %Q1.1   :   BOOL;
blinker11 AT %Q1.2   :   BOOL;
blinker12 AT %Q1.3   :   BOOL;
blinker13 AT %Q1.4   :   BOOL;
jtbutton : uint;
sgbj : uint;
i : uint;
j : uint;
kdw : uint;
gdw :uint;
kdw2 : uint;
gdw2 :uint;
kdw3 : uint;
gdw3 :uint;
kdw4 : uint;
gdw4 :uint;
jt_gdw1 : uint;
jt_gdw2 : uint;
jt_kdw1 : uint;
jt_kdw2 : uint;
addr_val : uint;
wds_val : REAL;
wdx_val : REAL;
wd_val : REAL;
par_var : uint;
lock_var : uint;
jf_open : uint;
jf_close : uint;
jf2_open : uint;
jf2_close : uint;
jf3_open : uint;
jf3_close : uint;
jf4_open : uint;
jf4_close : uint;
szd_var : uint;
REG_W_UINT_VAR : REG_W_UINT;
REG_R_UINT_VAR : REG_R_UINT;
REG_MOVE_VAR   : REG_MOVE;
REG_R_REAL_VAL : REG_R_REAL;
REG_W_REAL_VAL : REG_W_REAL;
END_VAR

REG_R_UINT_VAR(ADDR := 10018);
jtbutton := REG_R_UINT_VAR.DATA;
(*急停未按下，阀门操作*)
IF jtbutton=0 THEN
	blinker3 := TRUE;
	blinker9 := FALSE;
	blinker12 := FALSE;
	(*判断进站气液联动阀是否已修改*)
	REG_R_UINT_VAR(ADDR := 40074);
	par_var := REG_R_UINT_VAR.DATA;
	IF par_var=1 THEN
	(*参数修改*)
		REG_W_UINT_VAR(ADDR := 40074, DATA := 0);
		REG_R_UINT_VAR(ADDR := 40071);
		jf_open := REG_R_UINT_VAR.DATA;
		IF jf_open=1 THEN
			blinker := TRUE;
		ELSE 
			blinker := FALSE;
		
		END_IF;
	
		REG_R_UINT_VAR(ADDR := 40072);
		jf_close := REG_R_UINT_VAR.DATA;
		IF jf_close=1 THEN
			blinker2 := TRUE;
		ELSE 
			blinker2 := FALSE;
		END_IF;
	ELSE
	(*参数未修改*)
		;
	END_IF;
 
	REG_R_UINT_VAR(ADDR := 10003);
	kdw := REG_R_UINT_VAR.DATA;
	IF kdw=1 THEN
		blinker := FALSE;
	ELSE
		;
	END_IF;


	REG_R_UINT_VAR(ADDR := 10004);
	gdw := REG_R_UINT_VAR.DATA;
	IF gdw=1 THEN
		blinker2 := FALSE;
	ELSE
		;
	END_IF;
	(*出站电动阀*)
	REG_R_UINT_VAR(ADDR := 40078);
	par_var := REG_R_UINT_VAR.DATA;
	IF par_var=1 THEN
	(*参数修改*)
		REG_W_UINT_VAR(ADDR := 40078, DATA := 0);
		REG_R_UINT_VAR(ADDR := 40075);
		jf2_open := REG_R_UINT_VAR.DATA;
		IF jf2_open=1 THEN
			blinker4 := TRUE;
		ELSE 
			blinker4 := FALSE;
		
		END_IF;
	
		REG_R_UINT_VAR(ADDR := 40076);
		jf2_close := REG_R_UINT_VAR.DATA;
		IF jf2_close=1 THEN
			blinker5 := TRUE;
		ELSE 
			blinker5 := FALSE;
		END_IF;
	ELSE
	(*参数未修改*)
		;
	END_IF;
 
	REG_R_UINT_VAR(ADDR := 10006);
	kdw2 := REG_R_UINT_VAR.DATA;
	IF kdw2=1 THEN
		blinker4 := FALSE;
	ELSE
		;
	END_IF;


	REG_R_UINT_VAR(ADDR := 10007);
	gdw2 := REG_R_UINT_VAR.DATA;
	IF gdw2=1 THEN
		blinker5 := FALSE;
	ELSE
		;
	END_IF;
	
	(*进站放空阀*)
	REG_R_UINT_VAR(ADDR := 40082);
	par_var := REG_R_UINT_VAR.DATA;
	IF par_var=1 THEN
	(*参数修改*)
		REG_W_UINT_VAR(ADDR := 40082, DATA := 0);
		REG_R_UINT_VAR(ADDR := 40079);
		jf3_open := REG_R_UINT_VAR.DATA;
		IF jf3_open=1 THEN
			blinker7 := TRUE;
		ELSE 
			blinker7 := FALSE;
		
		END_IF;
	
		REG_R_UINT_VAR(ADDR := 40080);
		jf3_close := REG_R_UINT_VAR.DATA;
		IF jf3_close=1 THEN
			blinker8 := TRUE;
		ELSE 
			blinker8 := FALSE;
		END_IF;
	ELSE
	(*参数未修改*)
		;
	END_IF;
 
	REG_R_UINT_VAR(ADDR := 10010);
	kdw3 := REG_R_UINT_VAR.DATA;
	IF kdw3=1 THEN
		blinker7 := FALSE;
	ELSE
		;
	END_IF;


	REG_R_UINT_VAR(ADDR := 10011);
	gdw3 := REG_R_UINT_VAR.DATA;
	IF gdw3=1 THEN
		blinker8 := FALSE;
	ELSE
		;
	END_IF;
	
	(*出站放空阀*)
	REG_R_UINT_VAR(ADDR := 40086);
	par_var := REG_R_UINT_VAR.DATA;
	IF par_var=1 THEN
	(*参数修改*)
		REG_W_UINT_VAR(ADDR := 40086, DATA := 0);
		REG_R_UINT_VAR(ADDR := 40083);
		jf4_open := REG_R_UINT_VAR.DATA;
		IF jf4_open=1 THEN
			blinker10 := TRUE;
		ELSE 
			blinker10 := FALSE;
		
		END_IF;
	
		REG_R_UINT_VAR(ADDR := 40084);
		jf4_close := REG_R_UINT_VAR.DATA;
		IF jf4_close=1 THEN
			blinker11 := TRUE;
		ELSE 
			blinker11 := FALSE;
		END_IF;
	ELSE
	(*参数未修改*)
		;
	END_IF;
 
	REG_R_UINT_VAR(ADDR := 10014);
	kdw4 := REG_R_UINT_VAR.DATA;
	IF kdw4=1 THEN
		blinker10 := FALSE;
	ELSE
		;
	END_IF;


	REG_R_UINT_VAR(ADDR := 10015);
	gdw4 := REG_R_UINT_VAR.DATA;
	IF gdw4=1 THEN
		blinker11 := FALSE;
	ELSE
		;
	END_IF;
ELSE
	(*急停关阀操作*)
	(*先关进站气液，出站电动，再开进出放空*)
	blinker3 := FALSE;
	blinker9 := TRUE;
	blinker12 := TRUE;
	REG_R_UINT_VAR(ADDR := 10004);
	jt_gdw1 := REG_R_UINT_VAR.DATA;
(*	IF jt_gdw1=1 THEN
		blinker2 := FALSE;
	ELSE
		blinker2 := TRUE;	
	END_IF;
	*)
	REG_R_UINT_VAR(ADDR := 10007);
	jt_gdw2 := REG_R_UINT_VAR.DATA;
	IF jt_gdw2=1 THEN
		blinker5 := FALSE;
	ELSE
		blinker5 := TRUE;
	END_IF;
	
	IF jt_gdw1=1 AND jt_gdw2=1 THEN
		(*REG_R_UINT_VAR(ADDR := 10010);
		jt_kdw1 := REG_R_UINT_VAR.DATA;
		IF jt_kdw1=1 THEN
			blinker7 := FALSE;
		ELSE
			blinker7 := TRUE;	
		END_IF;
			
		REG_R_UINT_VAR(ADDR := 10014);
		jt_kdw2 := REG_R_UINT_VAR.DATA;
		IF jt_kdw2=1 THEN
			blinker10 := FALSE;
		ELSE
			blinker10 := TRUE;
		END_IF;*)
		;
	ELSE
		;
	END_IF;
END_IF;



REG_R_UINT_VAR(ADDR := 40112);
par_var := REG_R_UINT_VAR.DATA;
IF par_var=1 THEN
	REG_W_UINT_VAR(ADDR := 40112, DATA := 0);
	REG_R_UINT_VAR(ADDR := 40111);
	sgbj := REG_R_UINT_VAR.DATA;
	IF sgbj=1 THEN
		blinker13 := TRUE;
	ELSE
		blinker13 := FALSE;
	END_IF;
ELSE
	;
END_IF;
END_PROGRAM