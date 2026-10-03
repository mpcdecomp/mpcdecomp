/* differs: 150 size 192, image 166; +0 image `push di` CL `enter 6, 0`; 172 size 192, image 166; +0 image `push di` CL `enter 6, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern unsigned char BUF_XFER[1];
extern char G_REC_MODE;
extern char P_9D40;
extern char SAMPLE_INPUT;
extern char TBL_2E30[1];
extern int __far L_00106(void);
extern int __far __fastcall delay_ticks(int);
extern void __far far_000DE(void);
extern long __far __pascal mpc_poll_data(int);
extern long __far __pascal mpc_poll_data2(int);
extern int __far port_c0_read(void);
extern void __far __fastcall port_c0_write(int);
extern long __far __pascal smem_poll_ready(unsigned char far *);
extern void __far timer_loop_io(void);

long __near dma_06F0C(void)
{
	int ax;
	int ax2;
	int di;
	int di2;
	int di3;
	int dx;
	int si;
	int si2;
	int si3;
	int si4;
	int si5;
	long t1;
	int t10;
	long t2;
	int t3;
	int t4;
	int t5;
	int t6;
	int t7;
	int t8;
	long t9;

	di = TBL_2E30[G_REC_MODE];
	if (((char)inpw(136) & 96) == 0) {
		goto L1;
	}
	outpw(136, 128);
L1:
	t1 = mpc_poll_data(12);
	outp(-0x3fcf, (char)2);
	t2 = smem_poll_ready((unsigned char far *)BUF_XFER);
	outpw(-0x3fce, 0x3ff);
	outp(-0x3fc6, (char)85);
	if (SAMPLE_INPUT == 0) {
		goto L2;
	}
	si = port_c0_read();
	si2 = si & -89;
	si3 = si2 | 36;
	port_c0_write(si3);
	timer_loop_io();
	di2 = di | si3;
	si4 = di2;
	t5 = delay_ticks(20);
	dx = UNDEF;
	if (L_00106() == 0) {
		goto L3;
	}
	ax = 0;
	goto L4;
L2:
	far_000DE();
	t7 = port_c0_read();
	ax2 = ((char)(t7 >> 8) << 8 | (unsigned char)((char)t7 & -29));
	si5 = ax2;
	port_c0_write(ax2);
	di3 = di | si5;
	si4 = di3;
L3:
	t9 = mpc_poll_data2(4);
	port_c0_write(si4);
	dx = UNDEF;
	ax = 1;
L4:
	P_9D40 = (char)ax;
	return ((long)dx << 16 | (unsigned)ax);
}
