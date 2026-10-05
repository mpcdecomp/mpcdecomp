extern char B_3794;
extern char B_3795;
extern char B_3796;
extern char B_52A5;
extern char B_52A7;
extern char B_8D88;

far_e0d14(a0)
char a0;
{
	B_3794 = B_52A7 - 1;
	B_3795 = a0;
	B_3796 = B_8D88;
	far_e09f4(0x3792, 6, B_52A5);
	return;
}
