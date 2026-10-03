extern char C0_B_09603;
extern char C0_B_0D7E2;
extern char C2_B_FX_UPDATE_MASK;
extern char C2_W_09888[1];
void __far L_54DE4(void);
int __far _setjmp(char far *);
void __far dsp_chan_reg_clear(void);
void __far far_55752(void);

void __far far_5570A(unsigned char p0, char p1)
{
	if (p0 >= 2) goto br_55750;
	C2_B_FX_UPDATE_MASK &= ~(1 << p0);
	if (_setjmp(C2_W_09888)) goto br_55750;
	C0_B_09603 = p0;
	C0_B_0D7E2 = p1;
	if (p1 & 1) {
		dsp_chan_reg_clear();
		return;
	}
	far_55752();
	L_54DE4();
br_55750:
	;
}
