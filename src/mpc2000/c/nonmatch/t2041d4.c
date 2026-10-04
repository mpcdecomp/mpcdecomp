/* differs: 150 size 192, image 196; +23 image `mov al, byte ptr [0x12e4]` CL `mov al, byte ptr [0x9b49]`; 172 size 192, image 4; +4 image `push di` CL `push si` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_FX_TYPE_LABELS {
    int f_0;
    int f_2;
};
extern unsigned char B_1362;
extern unsigned char B_1363;
extern unsigned char B_1364;
extern unsigned char B_1365;
extern struct g_FX_TYPE_LABELS FX_TYPE_LABELS;
extern char G_STATE_9D8B;
extern char PGM_SLOT;
extern unsigned char P_1390[1];
extern unsigned char P_4CF0[1];
extern unsigned char TBL_1360;
extern unsigned char TBL_1361;
extern void __far __pascal cmd_build_params(int, int, int, int, int);
extern long __far __pascal cmd_caller_setup(int, int, unsigned char far *);
extern void __far __pascal cmd_dispatch_0E(int, int, int);
extern long __far __pascal cmd_dispatch_1E(int, int, long);
extern int __far __pascal disp_list_run(unsigned char far *);
extern void __far __pascal sequence_get_info(int, int, int);

void __far __pascal cmd_sequence_handler(long arg_0)
{
	int bx;
	int cx;
	int di;
	int si;
	int si2;
	int si3;
	int si4;
	int si5;
	int si6;
	int t1;
	int t2;
	long t3;
	long t4;
	int t5;
	int t6;
	int t7;
	int t8;

	t1 = disp_list_run((unsigned char far *)P_1390);
	sequence_get_info(PGM_SLOT, TBL_1360, TBL_1361);
	bx = G_STATE_9D8B << 2;
	t3 = cmd_dispatch_1E(B_1362, B_1363, ((long)*(int *)((char *)&FX_TYPE_LABELS + 2 + bx) << 16 | (unsigned)*(int *)((char *)&FX_TYPE_LABELS + 0 + bx)));
	di = (int)arg_0;
	cx = ~__repne_scas1(MK_FP((int)(arg_0 >> 16), di), 0, -1);
	si = cx - 1;
	si2 = si + (cx - 1);
	si3 = si2 + (cx - 1);
	si4 = si3 * 2;
	t4 = cmd_caller_setup(B_1364 + si4, B_1365, (unsigned char far *)P_4CF0);
	si5 = si4 - 226;
	si6 = -si5;
	cmd_build_params(18, si4 + 9, 28, si6, 3);
	cmd_dispatch_0E(236, 28, 3);
	cmd_dispatch_0E(238, 28, 3);
	cmd_dispatch_0E(240, 28, 3);
	return;
}
