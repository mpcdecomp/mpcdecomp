/* differs: 150 size 292, image 214; +1 image `enter 0xc, 0` CL `enter 0xa, 0`; 172 size 292, image 214; +1 image `enter 0xc, 0` CL `enter 0xa, 0` */
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
struct g_P_9842 {
    int f_0;
};
struct g_TBL_SOUND_NAMES {
    int f_0;
};
extern unsigned char BUF_XFER[1];
extern int G_ERRNO;
extern struct g_P_9842 P_9842;
extern struct g_TBL_SOUND_NAMES TBL_SOUND_NAMES;
extern long __far __pascal flash_write_words(int, int, struct g_P_9842 far *, int);
extern int __far int2F_call_fn6(unsigned char far *, int);

int __near __pascal main_handler_3(int arg_10, long arg_8, int arg_6, long arg_4, int arg_2, unsigned long arg_0)
{
	char loc_6[6];
	int ax;
	int ax2;
	int ax3;
	struct s1 __near *bx;
	int cx;
	int flags;
	int si;
	int si2;
	int si3;
	long t1;
	long t2;

	*(int *)((char *)&loc_6 + 0) = SEG_DATA;
	*(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) << 1;
	arg_2 = arg_2 << 1 | (unsigned int)*(int *)((char *)&arg_0 + 0) >> 15 & 1;
	if ((arg_2 | *(int *)((char *)&arg_0 + 0)) != 0) {
		goto L1;
	}
	goto L2;
L1:
	flags = arg_2;
	if (CC("<", flags)) {
		goto L3;
	}
	if (CC(">", flags)) {
		goto L4;
	}
	if ((unsigned int)*(int *)((char *)&arg_0 + 0) <= 0x200) {
		goto L3;
	}
L4:
	si = 0x200;
	goto L5;
L3:
	si = *(int *)((char *)&arg_0 + 0);
L5:
	ax = si * 2;
	if (int2F_call_fn6((unsigned char far *)BUF_XFER, ax) != ax) {
		goto L6;
	}
	*(int *)((char *)&arg_0 + 0) = *(int *)((char *)&arg_0 + 0) - si;
	arg_2 = (int)(arg_0 - (long)(int)si >> 16);
	ax2 = si / 2;
	si2 = ax2;
	ax3 = ax2 | si2;
	if (ax3 <= 0) {
		goto L7;
	}
	bx = (struct s1 __near *)BUF_XFER;
	*(int *)((char *)&loc_6 + 0) = ax3;
	si3 = 0;
	cx = ax3;
L8:
	*(int *)((char *)&P_9842 + 0 + si3) = bx->f_0;
	*(int *)((char *)&TBL_SOUND_NAMES + 0 + si3) = bx->f_2;
	si3 = si3 + 2;
	bx = bx + 1;
	cx = cx - 1;
	if (cx != 0) {
		goto L8;
	}
	si2 = *(int *)((char *)&loc_6 + 0);
L7:
	t1 = flash_write_words(arg_10, *(int *)((char *)&arg_8 + 0), (struct g_P_9842 far *)&P_9842, si2);
	t2 = flash_write_words(arg_6, *(int *)((char *)&arg_4 + 0), (struct g_TBL_SOUND_NAMES far *)&TBL_SOUND_NAMES, si2);
	*(int *)((char *)&arg_8 + 0) = *(int *)((char *)&arg_8 + 0) + si2;
	arg_10 = (int)(arg_8 + (long)(int)si2 >> 16);
	*(int *)((char *)&arg_4 + 0) = *(int *)((char *)&arg_4 + 0) + si2;
	arg_6 = (int)(arg_4 + (long)(int)si2 >> 16);
	if ((arg_2 | *(int *)((char *)&arg_0 + 0)) == 0) {
		goto L9;
	}
	goto L1;
L9:
	goto L2;
L6:
	G_ERRNO = 2;
	return -1;
L2:
	return 0;
}
