/* differs: 150 size 476, image 408; +1 image `enter 2, 0` CL `enter 0xc, 0`; 172 size 476, image 408; +1 image `enter 2, 0` CL `enter 0xc, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    char f_0;
};
struct g_SMEM_POOL_BASE_HI {
    int f_0;
};
struct g_SMEM_POOL {
    int f_0;
};
struct g_SMEM_POOL_LEN_HI {
    int f_0;
};
struct g_SMEM_POOL_LEN {
    int f_0;
};
struct g_SDS_TX_ADDR {
    long f_0;
};
extern unsigned char BUF_SYSEX_RX[1];
extern unsigned char BUF_XFER[1];
extern char far *PTR_LCD_STATE;
extern unsigned int SDS_PACKET_COUNT;
extern char SDS_STATE;
extern char SDS_STEREO_SIDE;
extern struct g_SDS_TX_ADDR SDS_TX_ADDR;
extern int SDS_TX_ADDR_HI;
extern unsigned int SDS_TX_PACKET;
extern int SDS_TX_TIME;
extern unsigned int SDS_TX_TIMEOUT;
extern struct g_SMEM_POOL SMEM_POOL;
extern struct g_SMEM_POOL_BASE_HI SMEM_POOL_BASE_HI;
extern struct g_SMEM_POOL_LEN SMEM_POOL_LEN;
extern struct g_SMEM_POOL_LEN_HI SMEM_POOL_LEN_HI;
extern void __near __pascal audio_event_handler(unsigned char far *);
extern long __far cmd_far_stub2(void);
extern void __far field_edit_disable(void);
extern int __near midi_sysex_handler(void);
extern long __near midi_txrx_arm_field(void);
extern void __near __pascal seq_io_control(int, int);
extern void __far __pascal smem_read_words(int, int, unsigned char far *, int);
extern long __far __pascal sysex_sub_dispatch(unsigned char far *, int);

void __far __fastcall __loadds lcd_draw_data(int ax3)
{
	int ax;
	int ax2;
	int bx;
	int bx2;
	unsigned int cx;
	int cx2;
	struct s1 __near *di;
	int dx;
	int es;
	int si;
	long t1;
	long t10;
	int t2;
	long t3;
	int t4;
	long t5;
	int t6;
	long t7;
	int t8;
	long t9;

	ax = midi_sysex_handler();
	if (ax == 0) {
		goto L1;
	}
	t1 = sysex_sub_dispatch((unsigned char far *)BUF_SYSEX_RX, ax);
L1:
	if ((SDS_STATE & 1) != 0) {
		goto L2;
	}
	goto L3;
L2:
	field_edit_disable();
	SDS_STATE = (char)(SDS_STATE & -2);
	if (PTR_LCD_STATE != 0) {
		goto L4;
	}
	goto L3;
L4:
	bx = (int)*(long *)((char *)&PTR_LCD_STATE + 0);
	es = (int)(*(long *)((char *)&PTR_LCD_STATE + 0) >> 16);
	if (*(int far *)MK_FP(es, bx + 30) <= 31) {
		goto L5;
	}
	goto L3;
L5:
	si = ((*(int far *)MK_FP(es, bx + 48) << 2) + *(int far *)MK_FP(es, bx + 48)) * 2;
	dx = *(int *)((char *)&SMEM_POOL_BASE_HI + 0 + si);
	*(int *)((char *)&SDS_TX_ADDR + 0) = *(int *)((char *)&SMEM_POOL + 0 + si);
	SDS_TX_ADDR_HI = dx;
	if (*(char far *)MK_FP(es, bx + 19) == 0) {
		goto L6;
	}
	if (SDS_STEREO_SIDE == 0) {
		goto L6;
	}
	bx2 = ((*(int far *)MK_FP(es, bx + 48) << 2) + *(int far *)MK_FP(es, bx + 48)) * 2;
	t3 = ((long)*(int *)((char *)&SMEM_POOL_LEN_HI + 0 + bx2) << 16 | (unsigned)*(int *)((char *)&SMEM_POOL_LEN + 0 + bx2)) / 2L;
	*(int *)((char *)&SDS_TX_ADDR + 0) = *(int *)((char *)&SDS_TX_ADDR + 0) + (int)t3;
	SDS_TX_ADDR_HI = (int)(SDS_TX_ADDR.f_0 + t3 >> 16);
L6:
	ax2 = *(int far *)((char far *)*(long *)((char *)&PTR_LCD_STATE + 0) + 28);
	SDS_PACKET_COUNT = (int)((((long)*(int far *)((char far *)*(long *)((char *)&PTR_LCD_STATE + 0) + 30) << 16 | (unsigned)ax2) + 39L) / 40L);
	seq_io_control(*(int *)((char *)&PTR_LCD_STATE + 2), *(int *)((char *)&PTR_LCD_STATE + 0));
	SDS_TX_PACKET = 0;
	SDS_STATE = (char)(SDS_STATE | 2);
	SDS_TX_TIME = ax3;
	SDS_TX_TIMEOUT = 0x7d0;
	t5 = cmd_far_stub2();
L3:
	if ((SDS_STATE & 2) != 0) {
		goto L7;
	}
	goto L8;
L7:
	if ((unsigned int)(ax3 - SDS_TX_TIME) > SDS_TX_TIMEOUT) {
		goto L9;
	}
	goto L8;
L9:
	if (SDS_TX_PACKET >= SDS_PACKET_COUNT) {
		goto L10;
	}
	smem_read_words(SDS_TX_ADDR_HI, *(int *)((char *)&SDS_TX_ADDR + 0), (unsigned char far *)BUF_XFER, 40);
	if (SDS_TX_PACKET - SDS_PACKET_COUNT != -1) {
		goto L11;
	}
	t7 = *(long far *)((char far *)*(long *)((char *)&PTR_LCD_STATE + 0) + 28) % 40L;
	if ((int)t7 == 0) {
		goto L11;
	}
	cx = (40 - (int)t7) * 2;
	di = (struct s1 __near *)(BUF_XFER + (int)t7 * 2);
	cx2 = cx >> 1;
	__stos2((struct s1 far *)di, 0, cx2 * 2);
	if (!(cx & 1)) {
		goto L11;
	}
	*(char *)((char __near *)di + cx2 * 2) = (char)0;
L11:
	audio_event_handler((unsigned char far *)BUF_XFER);
	*(int *)((char *)&SDS_TX_ADDR + 0) = *(int *)((char *)&SDS_TX_ADDR + 0) + 40;
	SDS_TX_ADDR_HI = (int)(SDS_TX_ADDR.f_0 + 40L >> 16);
	SDS_TX_PACKET = SDS_TX_PACKET + 1;
	SDS_TX_TIME = ax3;
	SDS_TX_TIMEOUT = 40;
	return;
L10:
	SDS_STATE = (char)(SDS_STATE & -3);
	t9 = cmd_far_stub2();
	t10 = midi_txrx_arm_field();
L8:
	return;
}
