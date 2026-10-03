/* differs: 150 matches */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern unsigned char P_03FC[1];
extern unsigned char TBL_WINKEYS_00562[1];
extern int W_4EFC;
extern long __far X_025D8(void);
extern void __far cmd_far_stub(void);
extern void __far __fastcall __loadds system_setup_2(void);
extern int __far __pascal win_keys_merge(unsigned char far *);

void __far __fastcall __loadds L_00D98(void)
{
	int ax;
	int ax2;
	int t1;
	int t2;
	long t3;

	win_keys_merge((unsigned char far *)P_03FC);
	win_keys_merge((unsigned char far *)TBL_WINKEYS_00562);
	W_4EFC = -1;
	system_setup_2();
	cmd_far_stub();
	t3 = X_025D8();
	return;
}
