/* differs: 150 size 72, image 68; +17 image `jge +41` CL `jge +45`; 172 size 72, image 68; +17 image `jge +41` CL `jge +45` */
extern char PGM_TABLE[1];
extern char far *WIN_FIELD_VAR;
extern char far *WIN_FIELD_CHANGE_FN;

void __far __fastcall __loadds L_06354(void)
{
	int bx_;
	int cx_;

	cx_ = (unsigned char)*WIN_FIELD_VAR + 1;
	if ((unsigned char)*WIN_FIELD_VAR + 1 >= 0x18) goto L_06395;
	bx_ = ((unsigned char)*WIN_FIELD_VAR + 1) * 4 + PGM_TABLE;
loop_06375:
	if (*(int far *)*(char far * __near *)(char __near *)bx_ != 2) goto br_0638A;
	bx_ = bx_ + 4;
	cx_++;
	if (cx_ < 0x18) goto loop_06375;
	return;
br_0638A:
	*WIN_FIELD_VAR = (char)cx_;
	((int (__far *)(void))WIN_FIELD_CHANGE_FN)();
L_06395:
	;
}
