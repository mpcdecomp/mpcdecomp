/* differs: 150 +45 image `push 2` CL `push word ptr [0x9a6e]`; 172 +45 image `push 2` CL `push word ptr [0x9cb0]` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern char far *SND_CURRENT;
extern char SND_EDIT_VIEW;
extern unsigned char STR_ROM_2[1];
extern unsigned char STR_SND_2[1];
extern unsigned char TBL_LEFT_RIGHT_LABELS[1];
extern long __far __pascal cmd_dispatch_1E(int, int, unsigned char far *);
extern int __far __pascal cmd_exec_caller(int, int, int, int);
extern void __far cmd_ratio_calc(void);
extern void __far __pascal display_draw_coord(int, int, int, int);
extern void __far field_redraw(void);
extern void __far __pascal mode_dispatch_index(int, int);
extern int __far __pascal sample_check_active(int, int);
extern void __far __pascal timer_value_read_4(int, int, int, int);

void __far __fastcall __loadds X_09124(void)
{
	int ax;
	int ax2;
	int dx;
	int t1;
	int t2;
	long t3;
	int t4;
	int t5;
	int t6;
	int t7;

	timer_value_read_4(*(int *)((char *)&SND_CURRENT + 2), *(int *)((char *)&SND_CURRENT + 0), 26, 2);
	mode_dispatch_index(199, 1);
	dx = (int)(cmd_dispatch_1E(212, 12, (unsigned char far *)(TBL_LEFT_RIGHT_LABELS + SND_EDIT_VIEW * 6)) >> 16);
	if (SND_CURRENT == 0) {
		goto L1;
	}
	if (sample_check_active(*(int *)((char *)&SND_CURRENT + 2), *(int *)((char *)&SND_CURRENT + 0)) == 0) {
		goto L2;
	}
	ax = (int)(unsigned)STR_ROM_2;
	goto L3;
L2:
	ax = (int)(unsigned)STR_SND_2;
L3:
	t3 = cmd_dispatch_1E(2, 2, MK_FP(SEG_DATA, ax));
	display_draw_coord(*(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 22), *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 20), 26, 12);
	display_draw_coord(*(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 26), *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 24), 122, 12);
	ax2 = cmd_exec_caller(*(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 22), *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 20), *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 26), *(int far *)((char far *)*(long *)((char *)&SND_CURRENT + 0) + 24));
L1:
	field_redraw();
	cmd_ratio_calc();
	return;
}
