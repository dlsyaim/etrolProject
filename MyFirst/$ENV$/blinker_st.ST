PROGRAM blinker_st
VAR_EXTERNAL

END_VAR

VAR_GLOBAL

END_VAR

VAR
	button AT %I0.0		:	BOOL;
	blinker AT %Q0.0	:	BOOL;
	timer				:	TON;
END_VAR
;



timer(in:=button,pt:=T#2s);
if(timer.q) then
	blinker	:=	not blinker;
	timer (in:=false);
end_if;

blinker := blinker AND button;
END_PROGRAM