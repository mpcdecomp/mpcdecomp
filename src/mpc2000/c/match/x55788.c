extern char C0_B_09603;
extern char C0_B_0D7E2;
extern char C2_B_FX_UPDATE_MASK;
extern char C2_W_09888[1];
void __far L_01D18(void);
void __far L_54DE4(void);
int __far _setjmp(char far *);

void __far far_55788(unsigned char p0, char p1)
{
	if (p0 >= 4) goto br_557D1;
	C2_B_FX_UPDATE_MASK &= ~(1 << p0);
	if (_setjmp(C2_W_09888)) goto br_557D1;
	C0_B_09603 = p0;
	C0_B_0D7E2 = p1;
	if (p1 & 2) goto br_557CC;
	if (!(C0_B_0D7E2 & 1)) {
		L_54DE4();
		return;
	}
br_557CC:
	L_01D18();
br_557D1:
	;
}
