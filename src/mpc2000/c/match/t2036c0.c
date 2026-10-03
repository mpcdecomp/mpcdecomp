extern char B_8CAB;
extern char far *WIN_FIELD_VAR;
extern char far *WIN_FIELD_CHANGE_FN;
long __far far_078E4(void);

void __far __fastcall __loadds L_03746(void)
{
	if (!far_078E4()) goto L_037A8;
	if (!*(char far * far *)WIN_FIELD_VAR) goto L_037A8;
	if (*(char far * far *)(*(char far * far *)(*(char far * far *)WIN_FIELD_VAR + 44) + 44)) {
		*(long far *)WIN_FIELD_VAR = *(long far *)(*(char far * far *)WIN_FIELD_VAR + 44);
	} else {
		if (!B_8CAB) goto L_037A8;
		*(long far *)WIN_FIELD_VAR = 0L;
	}
	((int (__far *)(void))WIN_FIELD_CHANGE_FN)();
L_037A8:
	;
}
