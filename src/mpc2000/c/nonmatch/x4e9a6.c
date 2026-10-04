/* differs: XL v1.20 +D, 2 bytes */
extern char C2_TBL_02F92[1];
extern char C2_TBL_PARAMS_FIELD_ENTER[1];
extern int C2_W_PARAMS_CURSOR;
void __far __fastcall __loadds audition_stop(void);

void __far __fastcall __loadds far_4E9A6(void)
{
	if (!(*(int *)(C2_TBL_02F92 + C2_W_PARAMS_CURSOR * 42) | *(int *)(C2_TBL_PARAMS_FIELD_ENTER + C2_W_PARAMS_CURSOR * 42))) goto L_4E1C9;
	audition_stop();
	((int (__far *)(void))*(long *)(C2_TBL_PARAMS_FIELD_ENTER + C2_W_PARAMS_CURSOR * 42))();
L_4E1C9:
	;
}
