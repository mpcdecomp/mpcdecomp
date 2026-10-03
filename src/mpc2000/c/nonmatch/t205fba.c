/* differs: 150 size 68, image 64; +16 image `jl +3D` CL `jl +41`; 172 size 68, image 64; +16 image `jl +3D` CL `jl +41` */
extern char PGM_TABLE[1];
extern char far *WIN_FIELD_VAR;
extern char far *WIN_FIELD_CHANGE_FN;

void __far __fastcall __loadds L_06398(void)
{
	int bx_;
	int cx_;

	cx_ = (unsigned char)*WIN_FIELD_VAR - 1;
	if ((unsigned char)*WIN_FIELD_VAR - 1 < 0) goto br_063D5;
	bx_ = ((unsigned char)*WIN_FIELD_VAR - 1) * 4 + PGM_TABLE;
loop_063B8:
	if (*(int far *)*(char far * __near *)(char __near *)bx_ != 2) goto br_063CA;
	bx_ = bx_ - 4;
	cx_--;
	if (cx_ >= 0) goto loop_063B8;
	return;
br_063CA:
	*WIN_FIELD_VAR = (char)cx_;
	((int (__far *)(void))WIN_FIELD_CHANGE_FN)();
br_063D5:
	;
}
