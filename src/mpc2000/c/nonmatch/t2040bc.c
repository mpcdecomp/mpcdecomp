/* differs: 150 size 158, image 84; +0 image `push ds` CL `enter 4, 0`; 172 size 158, image 84; +0 image `push ds` CL `enter 4, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char B_87E6;
extern int FP_POLL_HOOK;
extern int FP_POLL_HOOK_SEG;
extern char G_STATE_9D8B;
extern unsigned char P_1372[1];
extern void __far L_0426A();
extern long __far X_03716(void);
extern long __far X_037FE(void);
extern long __far X_0449E(void);
extern int __far __pascal win_keys_merge(unsigned char far *);

long __far __fastcall __loadds far_04206(void)
{
	int ax;
	int ax2;
	int dx;
	int flags;
	unsigned t1;
	long t2;
	long t3;

	t1 = win_keys_merge((unsigned char far *)P_1372);
	dx = UNDEF;
	G_STATE_9D8B = (char)(G_STATE_9D8B & 3);
	if (B_87E6 == 0) {
		goto L1;
	}
	ax = G_STATE_9D8B;
	flags = ax;
	if (CC("<", flags)) {
		goto L2;
	}
	if (CC("o", flags)) {
		goto L2;
	}
	ax2 = ax - 1;
	if (ax2 <= 0) {
		goto L3;
	}
	ax = ax2 - 1;
	if (ax < 0) {
		goto L2;
	}
	ax = ax - 1;
	if (ax <= 0) {
		goto L4;
	}
	goto L2;
L3:
	t3 = X_037FE();
	ax = (int)t3;
	dx = (int)(t3 >> 16);
	goto L2;
L4:
	t2 = X_03716();
	ax = (int)t2;
	dx = (int)(t2 >> 16);
L2:
	FP_POLL_HOOK = (int)(unsigned)L_0426A;
	FP_POLL_HOOK_SEG = 0x0b50 /* TEXT2_SEG */;
	return ((long)dx << 16 | (unsigned)ax);
L1:
	return X_0449E();
}
