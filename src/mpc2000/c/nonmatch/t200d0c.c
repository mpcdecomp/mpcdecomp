/* differs: 150 size 154, image 188; +1 image `enter 4, 0` CL `enter 0xa, 0`; 172 size 154, image 5; +1 image `enter 4, 0` CL `enter 0xa, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct e_P_4EFE {
    int f_0;
    int f_2;
};
extern unsigned char P_03FC[1];
extern struct e_P_4EFE P_4EFE[1];
extern unsigned char TBL_WINKEYS_004F8[1];
extern int W_4EFC;
extern void __far far_012F0(void);
extern long __far __pascal flash_read_identifier(int, int, char __near *);
extern int __far __pascal win_keys_merge(unsigned char far *);

void __far __fastcall __loadds disk_media_check(void)
{
	char loc_4[4];
	int ax;
	int ax2;
	int di;
	int dx;
	unsigned si;
	int t1;
	long t2;
	int t3;

	win_keys_merge((unsigned char far *)P_03FC);
	win_keys_merge((unsigned char far *)TBL_WINKEYS_004F8);
	far_012F0();
	si = 0;
L1:
	t2 = flash_read_identifier(si + 16 << 4, 0, loc_4);
	dx = *(int far *)MK_FP(SEG_STACK, (int)t2 + 2);
	P_4EFE[si].f_0 = *(int far *)MK_FP(SEG_STACK, (int)t2);
	P_4EFE[si].f_2 = dx;
	si = si + 1;
	if (si < 4) {
		goto L1;
	}
	far_012F0();
	di = 0;
L2:
	if (P_4EFE[di].f_0 != 137) {
		goto L3;
	}
	if (P_4EFE[di].f_2 != 0x66a0) {
		goto L3;
	}
	di = di + 1;
	if (di < 4) {
		goto L2;
	}
	goto L4;
L3:
	W_4EFC = 0;
	return;
L4:
	W_4EFC = 1;
	return;
}
