/* differs: 150 size 224, image 204; +1 image `enter 4, 0` CL `enter 6, 0`; 172 size 224, image 4; +1 image `enter 4, 0` CL `enter 6, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char B_3011;
extern char B_3015;
extern char B_3019;
extern char B_301D;
extern char B_3021;
extern char B_3025;
extern char B_3029;
extern char B_302D;
extern unsigned char DL_SOUND_MEMORY[1];
extern unsigned char P_300E[1];
extern int SMEM_SIZE;
extern int SMEM_SIZE_HI;
extern long __far X_00E76(void);
extern void __far __pascal cmd_dispatch_0E(int, int, int);
extern long __far __pascal cmd_track_setup(int, int, int);
extern int __far __pascal disp_list_run(unsigned char far *);
extern void __far __pascal draw_unsigned_value(int, int, long, int);
extern long __near fn_0683A(void);
extern void __far __pascal timer_value_read_5(int, int, int);

void __far __fastcall __loadds math_calc_handler(void)
{
	int loc_4;
	int loc_2;
	int ax;
	int ax2;
	int ax3;
	int cx;
	int dx;
	long t2;
	long t4;
	long t5;
	long t6;

	disp_list_run((unsigned char far *)DL_SOUND_MEMORY);
	timer_value_read_5(157, 12, (int)fn_0683A());
	t2 = *(long *)((char *)&SMEM_SIZE + 0) / 0x80000L;
	draw_unsigned_value(67, 40, t2, 2);
	ax2 = SMEM_SIZE;
	dx = (int)(((long)SMEM_SIZE_HI << 16 | (unsigned)ax2) - 0x12280L >> 16);
	loc_4 = ax2 - 0x2280;
	loc_2 = dx;
	t4 = X_00E76();
	cx = loc_4;
	t5 = (((long)loc_2 << 16 | (unsigned)cx) - t4) * 200L;
	t6 = t5 / ((long)loc_2 << 16 | (unsigned)(ax2 - 0x2280));
	if ((int)t6 == 0) {
		goto L1;
	}
	B_3029 = (char)(int)t6;
	B_3021 = (char)(int)t6;
	B_3019 = (char)(int)t6;
	B_3011 = (char)(int)t6;
	B_302D = (char)((char)(int)t6 - 1);
	B_3025 = (char)((char)(int)t6 - 1);
	B_301D = (char)((char)(int)t6 - 1);
	B_3015 = (char)((char)(int)t6 - 1);
	ax3 = disp_list_run((unsigned char far *)P_300E);
L1:
	if ((int)t6 >= 200) {
		goto L2;
	}
	cmd_dispatch_0E((int)t6 + 23, 26, 8);
	cmd_track_setup((int)t6 + 23, 26, 200 - (int)t6);
L2:
	return;
}
