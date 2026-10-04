/* differs: 150 size 190, image 104; +1 image `enter 0xc, 0` CL `enter 0x12, 0`; 172 size 190, image 104; +1 image `enter 0xc, 0` CL `enter 0x12, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_REC_BUF_ADDR {
    long f_0;
};
struct g_W_9D3C {
    long f_0;
};
extern char G_REC_MODE;
extern struct g_REC_BUF_ADDR REC_BUF_ADDR;
extern int REC_BUF_ADDR_HI;
extern unsigned int REC_LENGTH;
extern int REC_LENGTH_HI;
extern struct g_W_9D3C W_9D3C;
extern long __far __pascal input_handler(long, long, long);

void __near lcd_compute_coords(void)
{
	int loc_c;
	char loc_a[6];
	unsigned long loc_4;
	int loc_2;
	unsigned int ax;
	int bx;
	int bx2;
	int cx;
	int dx;
	int flags;
	long t1;

	ax = REC_LENGTH + *(int *)((char *)&REC_BUF_ADDR + 0);
	dx = REC_LENGTH_HI + REC_BUF_ADDR_HI + (ax < REC_LENGTH);
	loc_c = ax;
	*(int *)((char *)&loc_a + 0) = dx;
	bx = (int)(W_9D3C.f_0 + 15L >> 16);
	*(int *)((char *)&loc_4 + 0) = ((char)(*(int *)((char *)&W_9D3C + 0) + 15 >> 8) << 8 | (unsigned char)((char)*(int *)((char *)&W_9D3C + 0) + 15 & -16));
	loc_2 = bx;
	cx = *(int *)((char *)&loc_4 + 0) - *(int *)((char *)&REC_BUF_ADDR + 0);
	bx2 = (int)(loc_4 - REC_BUF_ADDR.f_0 >> 16);
	flags = *(int *)((char *)&loc_a + 0) - loc_2;
	if (CC("<", flags)) {
		goto L1;
	}
	if (CC(">", flags)) {
		goto L2;
	}
	if (ax <= (unsigned int)*(int *)((char *)&loc_4 + 0)) {
		goto L1;
	}
L2:
	REC_LENGTH = cx;
	REC_LENGTH_HI = bx2;
	if (G_REC_MODE != 2) {
		goto L1;
	}
	t1 = input_handler(*(long *)((char *)&loc_c + 0), loc_4, ((long)bx2 << 16 | (unsigned)cx));
L1:
	return;
}
