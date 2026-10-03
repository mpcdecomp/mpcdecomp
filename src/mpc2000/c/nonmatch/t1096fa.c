/* differs: 150 +1 image `enter 0x1c, 0` CL `enter 0x1a, 0`; 172 +1 image `enter 0x1c, 0` CL `enter 0x1a, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int G_ERRNO;
extern int __far _longjmp(void far *, int);
extern long __far err_msg_report(void);
extern int __far int2F_dispatch_10(void);
extern long __near __pascal mode_handler(char far *, int, int);
extern void __near __pascal pad_velocity_handler(char far *);
extern long __far __pascal sample_access_caller(int, int, int);
extern long __near __pascal status_poll_handler(int, int);
extern void __far __pascal ui_enter_pad_assign(int, int);
extern long __near __pascal voice_play_request(long, char far *, int, int);
extern int __far x_setjmp(void far *);

long __far status_read_multi(int arg_0, int arg_2)
{
	char loc_1c[18];
	int loc_a;
	int loc_8;
	int loc_6;
	int loc_4;
	int loc_2;
	int ax;
	int ax2;
	int si;
	long t1;
	long t2;
	int t3;
	long t4;
	long t5;
	int t6;

	loc_2 = 0;
	loc_4 = 0;
	loc_a = -1;
	t1 = x_setjmp(MK_FP(SEG_DATA, -0x72de));
	loc_2 = (int)t1;
	if ((int)t1 != 0) {
		goto L1;
	}
	if ((int)sample_access_caller(arg_2, arg_0, (int)t1) != 0) {
		goto L2;
	}
	t2 = _longjmp(MK_FP(SEG_DATA, -0x72de), G_ERRNO);
L2:
	pad_velocity_handler((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1c));
	t4 = status_poll_handler(0x6174, 0x6164);
	loc_8 = (int)t4;
	loc_6 = (int)(t4 >> 16);
	loc_a = (int)mode_handler((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1c), (int)(t4 >> 16), (int)t4);
	t5 = voice_play_request(*(long *)((char *)&arg_0 + 0), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1c), loc_6, loc_8);
	loc_4 = (int)t5;
	loc_2 = (int)(t5 >> 16);
	si = (int)t5;
	*(int far *)MK_FP((int)(t5 >> 16), si + 48) = loc_a;
	int2F_dispatch_10();
	ui_enter_pad_assign(loc_2, si);
	return ((long)UNDEF << 16 | (unsigned)1);
L1:
	int2F_dispatch_10();
	G_ERRNO = loc_2;
	return (long)MK_FP((int)(err_msg_report() >> 16), 0);
}
