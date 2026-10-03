/* differs: 150 size 174, image 164; +1 image `enter 0xc, 0` CL `enter 0x10, 0`; 172 size 174, image 164; +1 image `enter 0xc, 0` CL `enter 0x10, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_PGM_TABLE {
    int f_0;
    int f_2;
};
extern int G_ERRNO;
extern struct g_PGM_TABLE PGM_TABLE;
extern unsigned char P_8D44[1];
extern long __far __pascal ctrl_port_caller(int, int, int, int);
extern long __far err_msg_report(void);
extern long __near __pascal event_handler(unsigned char far *, int, int);
extern int __far int2F_call_fn14(long);

void __far __pascal midi_realtime_start(int arg_2, int arg_0)
{
	int loc_c;
	char loc_a[3];
	char loc_7;
	char loc_6;
	char loc_5;
	int loc_4;
	int loc_2;
	int ax;
	int bx;
	int cx;
	int dx;
	long t1;

	loc_5 = *(char far *)MK_FP(arg_2, arg_0 + 12);
	loc_6 = (char)-(0 - (*(char far *)MK_FP(arg_2, arg_0 + 16) == 0));
	loc_7 = *(char far *)MK_FP(arg_2, arg_0 + 14);
	cx = *(int far *)MK_FP(arg_2, arg_0);
	loc_4 = *(int far *)MK_FP(arg_2, arg_0 + 6);
	loc_2 = cx;
	G_ERRNO = 5;
	bx = loc_5 << 2;
	dx = *(int *)((char *)&PGM_TABLE + 2 + bx);
	loc_c = *(int *)((char *)&PGM_TABLE + 0 + bx);
	*(int *)((char *)&loc_a + 0) = dx;
	if ((unsigned int)*(int far *)MK_FP(*(int *)((char *)&loc_a + 0), loc_c) <= 2) {
		goto L1;
	}
	if (int2F_call_fn14(((long)cx << 16 | (unsigned)loc_4)) == 0) {
		goto L1;
	}
	if ((int)ctrl_port_caller(*(int *)((char *)&loc_a + 0), loc_c, loc_2, loc_4) == 0) {
		goto L1;
	}
	if (loc_6 == 0) {
		goto L2;
	}
	t1 = event_handler((unsigned char far *)P_8D44, loc_7, 0);
	return;
L1:
	ax = (int)err_msg_report();
L2:
	return;
}
