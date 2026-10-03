/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern int C2_W_08D4C;
void __far far_4D166(void);
void __far far_4D17E(void);
void __far far_4D1A4(void);

void __far L_4D140(void)
{
	switch (C2_W_08D4C) { case 2: case 7: goto br_4D154; case 3: goto br_4D15A; case 8: goto br_4D160; }
	return;
br_4D154:
	far_4D17E();
	return;
br_4D15A:
	far_4D166();
	return;
br_4D160:
	far_4D1A4();
}
