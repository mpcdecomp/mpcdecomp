/* differs: 150 size 390, image 378; +1 image `enter 4, 0` CL `enter 6, 0`; 172 size 390, image 378; +1 image `enter 4, 0` CL `enter 6, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    int f_0;
    int f_2;
    char pad_4[1];
    char f_5;
    char f_6;
    char f_7;
    char f_8;
    char f_9;
};
struct g_SND_CURRENT {
    int f_0;
    int f_2;
};
extern char B_9D77;
extern unsigned char DL_PGM_ASSIGN[1];
extern unsigned char G_PAD_INDEX;
extern unsigned char G_PAD_NOTE_BASE;
extern char PGM_SLOT;
extern char far *PTR_TRACK_DATA;
extern struct g_SND_CURRENT SND_CURRENT;
extern unsigned char STR_ALSO_PLAY_NOTE[1];
extern unsigned char STR_IF_OVER_USE[1];
extern unsigned char TBL_PGM_MASTER_LABELS[1];
extern long __far __pascal cmd_dispatch_1E(int, int, unsigned char far *);
extern void __far __pascal cmd_dispatch_wrapper(char, int, int);
extern int __far __pascal disp_list_run(unsigned char far *);
extern void __far __pascal draw_unsigned_value(int, int, long, int);
extern void __far field_redraw(void);
extern void __far __pascal sequence_get_info(int, int, int);
extern void __far __pascal timer_value_read_2(char, int, int);
extern void __far __pascal timer_value_read_3(char, int, int);
extern void __far __pascal timer_value_read_4(int, int, int, int);
extern long __near __pascal track_calc_offset(int);
extern void __far __pascal ui_row_request(int);

void __far __fastcall __loadds track_read_caller(void)
{
	int ax;
	int ax2;
	int ax3;
	int dx;
	int flags;
	int flags2;
	struct s1 far *t1;
	int t10;
	long t11;
	int t12;
	int t13;
	int t14;
	int t2;
	int t3;
	int t4;
	int t5;
	int t6;
	int t7;
	long t8;
	int t9;

	t1 = (struct s1 far *)track_calc_offset(G_PAD_NOTE_BASE);
	disp_list_run((unsigned char far *)DL_PGM_ASSIGN);
	ui_row_request(23);
	sequence_get_info(PGM_SLOT, 26, 2);
	cmd_dispatch_wrapper(G_PAD_INDEX, 32, 12);
	timer_value_read_2(*(char far *)((char far *)*(long *)((char *)&PTR_TRACK_DATA + 0) + G_PAD_INDEX), 86, 12);
	timer_value_read_2(((char)((int)cmd_dispatch_1E(194, 12, (unsigned char far *)(TBL_PGM_MASTER_LABELS + (B_9D77 << 3))) >> 8) << 8 | (unsigned char)G_PAD_NOTE_BASE), 38, 22);
	timer_value_read_4(t1->f_2, t1->f_0, 80, 22);
	ax2 = t1->f_5 - 1;
	flags = ax2;
	if (CC("==", flags)) {
		goto L1;
	}
	flags2 = ax2 - 1;
	if (CC(">=", flags2)) {
		goto L2;
	}
	goto L3;
L2:
	if (CC("no", flags2)) {
		goto L4;
	}
	goto L3;
L4:
	if (ax2 - 2 <= 0) {
		goto L5;
	}
	goto L3;
L1:
	t11 = cmd_dispatch_1E(98, 30, (unsigned char far *)STR_ALSO_PLAY_NOTE);
	ax3 = (int)cmd_dispatch_1E(98, 39, (unsigned char far *)STR_ALSO_PLAY_NOTE);
	goto L6;
L5:
	t8 = cmd_dispatch_1E(98, 30, (unsigned char far *)STR_IF_OVER_USE);
	draw_unsigned_value(146, 30, (long)(int)t1->f_6, 3);
	draw_unsigned_value(146, 39, (long)(int)t1->f_8, 3);
L6:
	timer_value_read_3(t1->f_7, 200, 30);
	timer_value_read_3(t1->f_9, 200, 39);
L3:
	field_redraw();
	if ((t1->f_2 | t1->f_0) == 0) {
		goto L7;
	}
	dx = t1->f_2;
	SND_CURRENT.f_0 = t1->f_0;
	SND_CURRENT.f_2 = dx;
L7:
	return;
}
