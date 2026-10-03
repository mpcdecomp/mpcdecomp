/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C2_B_REC_MODE;
void __far far_48FBA(void);
void __far far_49092(void);
int __far far_490A6(void);
void __far far_491A8(void);
void __far far_49218(void);
void __far far_49266(void);
void __far far_49308(int);
void __far far_493D2(void);
void __far far_4EE54(int);

void __far L_48E9C(char p0)
{
	C2_B_REC_MODE = p0;
	far_48FBA();
	far_493D2();
	far_4EE54(0x32);
	far_49218();
	far_491A8();
	far_49092();
	switch (far_490A6()) { case 0: goto br_48EDC; }
	far_49266();
	far_49308(0);
br_48EDC:
	;
}
