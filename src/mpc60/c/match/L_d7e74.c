extern char B_8E06;
extern char B_8E07;
extern char B_8E08;
extern char B_8E09;
extern char B_8E0A;
extern char B_8E0B;

L_d7e74(a0, a1, a2, a3)
{
	B_8E06 = 3;
	B_8E07 = (a1 & 7) << 5;
	B_8E08 = 0;
	B_8E09 = 0;
	B_8E0A = a2 & 255;
	B_8E0B = 0;
	return L_0543b_v214(a0, -0x71fa, a3);
}
