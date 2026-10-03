/* differs: 150 size 58, image 64; +1 image `enter 4, 0` CL `enter 6, 0`; 172 size 58, image 5; +1 image `enter 4, 0` CL `enter 6, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_PGM_CURRENT {
    int f_0;
    int f_2;
};
extern struct g_PGM_CURRENT PGM_CURRENT;
extern unsigned char PGM_PADMAP[1];
extern unsigned char P_1D76[1];
extern char P_1DD3;
extern void __far __fastcall __loadds pgm_assign_enter(void);

void __far __fastcall __loadds smem_rep_str(void)
{
	long loc_4;
	int loc_2;
	int ax;
	int dx;
	int t1;

	if (P_1DD3 == 0) {
		goto L1;
	}
	ax = -0x72c8;
	dx = SEG_DATA;
	goto L2;
L1:
	dx = PGM_CURRENT.f_2;
	ax = (int)(unsigned)(PGM_PADMAP + PGM_CURRENT.f_0);
L2:
	*(int *)((char *)&loc_4 + 0) = ax;
	loc_2 = dx;
	__movs2(loc_4, (unsigned char far *)P_1D76, 64);
	pgm_assign_enter();
	return;
}
