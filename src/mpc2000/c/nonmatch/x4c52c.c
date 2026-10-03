/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char far *C0_W_0D7C2;
extern int C0_W_0D7C4;
extern char C1_W_08FCB[1];
void __far far_484D6(char far *, char far *);

void __far L_4BBCE(void)
{
	far_484D6(C1_W_08FCB, C0_W_0D7C2 + 0x12);
}
