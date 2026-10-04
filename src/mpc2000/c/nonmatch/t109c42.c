/* differs: 150 size 452, image 300; +1 image `enter 0x22, 0` CL `enter 0x2e, 0`; 172 size 452, image 300; +1 image `enter 0x22, 0` CL `enter 0x2e, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    int f_0;
    int f_2;
};
extern unsigned char STR_EXT_SND_5[1];
extern long __far __pascal ctrl_io_setup(int, int, void far *);
extern int __near __pascal ctrl_port_78_write(int, int);
extern long __far __pascal far_memop_handler_2(int, int, void far *);
extern int __far int2F_bcd_wrapper(void);
extern int __far int2F_call_fn14(char far *);
extern int __far int2F_call_fn20(char far *);

long __near __pascal event_handler(int arg_6, int arg_4, int arg_2, int arg_0)
{
	long loc_22;
	int loc_20;
	char loc_1e[22];
	int loc_8;
	int loc_6;
	struct s1 far *loc_4;
	int loc_2;
	int ax;
	int ax2;
	unsigned int cx;
	int cx2;
	unsigned int cx3;
	int cx4;
	int di;
	int di2;
	int di3;
	int di4;
	int ds;
	int dx;
	int dx2;
	int dx3;
	int p48;
	int t1;
	long t2;
	long t3;
	int t4;
	int t5;

	dx = UNDEF;
	loc_8 = int2F_bcd_wrapper();
	di = arg_0;
	if (di < 128) {
		goto L1;
	}
	goto L2;
L1:
	dx2 = arg_6;
	*(int *)((char *)&loc_4 + 0) = arg_4 + (di << 2);
	loc_2 = dx2;
	loc_6 = di;
	ds = SEG_DATA;
L3:
	dx3 = loc_4->f_2;
	*(int *)((char *)&loc_22 + 0) = loc_4->f_0;
	loc_20 = dx3;
	dx = loc_20 | *(int *)((char *)&loc_22 + 0);
	if (dx != 0) {
		goto L4;
	}
	goto L2;
L4:
	t4 = __repne_scas1((int)loc_22, 0, -1);
	cx = ~t4;
	di2 = (int)loc_22 + (-1 - t4) - cx;
	cx2 = cx >> 1;
	__movs2(MK_FP(SEG_STACK, di2), MK_FP((int)(loc_22 >> 16), di2), cx2 * 2);
	__movs1(MK_FP(SEG_STACK, di2 + cx2 * 2), MK_FP((int)(loc_22 >> 16), di2 + cx2 * 2), cx & 1);
	t5 = __repne_scas1((unsigned char far *)MK_FP(ds, (unsigned int)(unsigned)STR_EXT_SND_5), 0, -1);
	cx3 = ~t5;
	di3 = (int)(unsigned)(STR_EXT_SND_5 + (-1 - t5) - cx3);
	di4 = di3 + (-1 - __repne_scas1(MK_FP(SEG_STACK, di3), 0, -1));
	cx4 = cx3 >> 1;
	__movs2(MK_FP(SEG_STACK, di4 - 1), MK_FP(ds, di3), cx4 * 2);
	__movs1(MK_FP(SEG_STACK, di4 - 1 + cx4 * 2), MK_FP(ds, di3 + cx4 * 2), cx3 & 1);
	ds = ds;
	ax = int2F_call_fn14((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1e));
	dx = UNDEF;
	if (ax != 0) {
		goto L5;
	}
	if (arg_2 == ax) {
		goto L6;
	}
	if (loc_8 == 2) {
		goto L5;
	}
	t1 = int2F_call_fn20((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1e));
L5:
	if (loc_8 != 2) {
		goto L7;
	}
	p48 = (int)(unsigned)loc_1e;
	t2 = ctrl_io_setup(loc_4->f_2, loc_4->f_0, MK_FP(SEG_STACK, p48));
	dx = (int)(t2 >> 16);
	if ((int)t2 != 0) {
		goto L6;
	}
	goto L8;
L7:
	p48 = (int)(unsigned)loc_1e;
	t3 = far_memop_handler_2(loc_4->f_2, loc_4->f_0, MK_FP(SEG_STACK, p48));
	dx = (int)(t3 >> 16);
	if ((int)t3 == 0) {
		goto L9;
	}
L6:
	*(int *)((char *)&loc_4 + 0) = *(int *)((char *)&loc_4 + 0) + 4;
	loc_6 = loc_6 + 1;
	if (loc_6 >= 128) {
		goto L10;
	}
	goto L3;
L10:
	goto L2;
L9:
	ax2 = ctrl_port_78_write(arg_2, loc_6);
	dx = UNDEF;
L8:
	return ((long)dx << 16 | (unsigned)1);
L2:
	return ((long)dx << 16 | (unsigned)0);
}
