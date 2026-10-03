/* differs: 150 size 176, image 162; +1 image `enter 6, 0` CL `enter 0xa, 0`; 172 size 176, image 162; +1 image `enter 6, 0` CL `enter 0xa, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    char pad_0[48];
    int f_30;
};
extern int G_ERRNO;
extern int __far _longjmp(void far *, int);
extern int __far _setjmp(void far *);
extern long __far err_msg_report(void);
extern int __far int2F_dispatch_10(void);
extern long __near __pascal lcd_clear_line(long, long, int, int);
extern long __far __pascal sample_access_caller(int, int, int);
extern long __near __pascal track_event_handler(int, int);
extern void __far __pascal ui_enter_pad_assign(int, int);

long __far seq_event_handler(int arg_0, int arg_2, int arg_4, char arg_6[6], int arg_12, int arg_14)
{
	int loc_6;
	int loc_4;
	int loc_2;
	int ax;
	int ax2;
	long t1;
	struct s1 far *t3;
	int t4;

	loc_2 = 0;
	loc_4 = 0;
	loc_6 = -1;
	t1 = _setjmp(MK_FP(SEG_DATA, -0x64b6));
	loc_2 = (int)t1;
	if ((int)t1 != 0) {
		goto L1;
	}
	if ((int)sample_access_caller(arg_2, arg_0, (int)t1) != 0) {
		goto L2;
	}
	_longjmp(MK_FP(SEG_DATA, -0x64b6), G_ERRNO);
L2:
	loc_6 = (int)track_event_handler(*(int *)((char *)&arg_6 + 0), arg_4);
	t3 = (struct s1 far *)lcd_clear_line(*(long *)((char *)&arg_0 + 0), *(long *)((char *)&arg_12 + 0), *(int *)((char *)&arg_6 + 0), arg_4);
	loc_4 = FP_OFF(t3);
	loc_2 = FP_SEG(t3);
	t3->f_30 = loc_6;
	int2F_dispatch_10();
	ui_enter_pad_assign(loc_2, FP_OFF(t3));
	return ((long)UNDEF << 16 | (unsigned)1);
L1:
	int2F_dispatch_10();
	G_ERRNO = loc_2;
	return (long)MK_FP((int)(err_msg_report() >> 16), 0);
}
