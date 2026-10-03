/* differs: 150 size 124, image 140; +0 image `push ds` CL `push si`; 172 size 124, image 140; +0 image `push ds` CL `push si` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_P_2A94 {
    int f_0;
};
struct g_P_2A92 {
    int f_0;
};
extern unsigned char DL_MIXER_SETUP[1];
extern char MIX_INDIV_SOURCE;
extern struct g_P_2A92 P_2A92;
extern struct g_P_2A94 P_2A94;
extern char RECORD_MIX_CHANGES;
extern unsigned char TBL_PGM_MASTER_LABELS[1];
extern void __far __pascal cmd_build_dispatch(int, int, int, int);
extern long __far __pascal cmd_dispatch_1E(int, int, unsigned char far *);
extern void __far __pascal cmd_dispatch_handler_3(int, int);
extern int __far __pascal disp_list_run(unsigned char far *);
extern void __far field_redraw(void);

void __far __fastcall __loadds X_04138(void)
{
	int ax;
	int bx;
	int t1;
	long t2;
	int t3;
	int t4;
	int t5;
	long t6;
	int t7;

	disp_list_run((unsigned char far *)DL_MIXER_SETUP);
	cmd_build_dispatch(0, 0, 123, 49);
	t2 = cmd_dispatch_1E(75, 32, (unsigned char far *)(TBL_PGM_MASTER_LABELS + (MIX_INDIV_SOURCE << 3)));
	cmd_build_dispatch(125, 0, 122, 24);
	cmd_dispatch_handler_3(183, 14);
	cmd_build_dispatch(125, 26, 122, 23);
	bx = RECORD_MIX_CHANGES << 2;
	t6 = cmd_dispatch_1E(177, 39, ((long)*(int *)((char *)&P_2A94 + 0 + bx) << 16 | (unsigned)*(int *)((char *)&P_2A92 + 0 + bx)));
	field_redraw();
	return;
}
