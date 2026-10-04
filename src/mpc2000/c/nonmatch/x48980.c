/* differs: XL v1.20 +1, 62 bytes */
extern int C2_W_08B48;
extern int C2_W_REC_STATE;
void __far far_489C6(void);
void __far far_48A04(void);
void __far far_48A12(void);
void __far far_48A20(void);

int __far far_48980(void)
{
	int v0;

	v0 = C2_W_REC_STATE;
	if (v0 == C2_W_08B48) goto br_489C2;
	C2_W_08B48 = v0;
	if (v0 | v0) {
		switch (v0 | v0) { case 1: goto br_489A8; case 2: goto br_489B0; case 3: goto br_489B8; }
	} else {
		far_489C6();
		goto br_489BD;
br_489A8:
		far_48A04();
		goto br_489BD;
br_489B0:
		far_48A12();
		goto br_489BD;
br_489B8:
		far_48A20();
	}
br_489BD:
	return 1;
br_489C2:
	return 0;
}
