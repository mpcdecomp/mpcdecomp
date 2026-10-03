extern unsigned char C2_B_CUR_PAD;
extern unsigned char C2_B_PAD_DRUM;
extern char C2_W_03754[1];
char far * __far ivt_get_vector(int);
void __far ui_field_engine(char far *, char far *);

void __far far_4F98C(void)
{
	ui_field_engine(C2_W_03754, ivt_get_vector(C2_B_PAD_DRUM + 0x60) + C2_B_CUR_PAD);
}
