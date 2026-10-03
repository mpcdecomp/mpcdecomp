/* differs: 150 size 222, image 304; +1 image `enter 0x10, 0` CL `enter 8, 0`; 172 size 222, image 5; +1 image `enter 0x10, 0` CL `enter 8, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern unsigned char BUF_XFER[1];
extern unsigned char STR_BLOCK[1];
extern unsigned char STR_FLASH_CARD_NOT_FOUND[1];
extern unsigned char STR_FLASH_MEMORY_OK[1];
extern unsigned char STR_FLASH_VERIFY_ERROR[1];
extern unsigned char STR_FLASH_WRITE_ERROR[1];
extern unsigned char STR_NOW_TESTING[1];
extern unsigned char SYS_BUILD_DATE[1];
extern int W_4EFC;
extern long __far __pascal cmd_dispatch_1E(int, int, unsigned char far *);
extern void __far cmd_far_stub(void);
extern void __far __pascal draw_unsigned_value(int, int, long, int);
extern void __far __pascal smem_read_words(int, int, void far *, int);
extern long __far __pascal string_fill_stosb(int, int);
extern void __far __pascal string_memop_setup(int, int);
extern void __far __pascal system_call_handler(int, int, unsigned char far *, int);

void __far __fastcall __loadds flash_test_go_handler(void)
{
	char loc_8[4];
	int loc_4;
	char loc_3;
	int loc_2;
	int ax;
	unsigned int cx;
	int cx2;
	int cx3;
	int di;
	int di2;
	int di3;
	int di4;
	int di5;
	int di6;
	int di7;
	int di8;
	int di9;
	int p26;
	int p28;
	int si;
	int si2;
	int si3;
	int t1;
	long t10;
	long t2;
	long t3;
	int t4;
	int t5;
	int t6;
	int t7;
	int t8;
	int t9;

	if (W_4EFC != 0) {
		goto L1;
	}
	goto L2;
L1:
	loc_4 = 0;
	loc_2 = 0x100;
	di = (int)(unsigned)SYS_BUILD_DATE;
	t1 = __repne_scas1(MK_FP(SEG_DATA, di), 0, -1);
	di2 = di + (-1 - t1);
	cx = ~t1;
	di3 = di2 - cx;
	si = di3;
	di4 = si;
	cx2 = cx >> 1;
	__movs2(MK_FP(SEG_DATA, di4), MK_FP(SEG_DATA, si), cx2 * 2);
	si2 = si + cx2 * 2;
	di5 = di4 + cx2 * 2;
	__movs1(MK_FP(SEG_DATA, di5), MK_FP(SEG_DATA, si2), cx & 1);
	t2 = cmd_dispatch_1E(121, 10, (unsigned char far *)STR_NOW_TESTING);
	t3 = cmd_dispatch_1E(121, 19, (unsigned char far *)STR_BLOCK);
	*(int *)((char *)&loc_8 + 0) = 0;
L3:
	draw_unsigned_value(157, 19, (long)(int)*(int *)((char *)&loc_8 + 0), 4);
	cmd_far_stub();
	string_memop_setup(loc_2, loc_4);
	di6 = (int)(unsigned)BUF_XFER;
	system_call_handler(loc_2, loc_4, (unsigned char far *)BUF_XFER, (unsigned int)(~__repne_scas1(MK_FP(SEG_DATA, di6), 0, -1) - 1) >> 1);
	if (UNDEF == 0) {
		goto L4;
	}
	di7 = (int)(unsigned)BUF_XFER;
	smem_read_words(loc_2, loc_4, MK_FP(SEG_DATA, -0x6120), (unsigned int)(~__repne_scas1(MK_FP(SEG_DATA, di7), 0, -1) - 1) >> 1);
	di8 = (int)(unsigned)BUF_XFER;
	ax = 0;
	cx3 = ~__repne_scas1(MK_FP(SEG_DATA, di8), (char)ax, -1);
	di9 = -0x6120;
	si3 = (int)(unsigned)BUF_XFER;
	t9 = __repe_cmps1(MK_FP(SEG_DATA, si3), MK_FP(SEG_DATA, di9), ((char)(cx3 - 1 >> 8) << 8 | (unsigned char)((char)cx3 - 1 & -2)));
	if (CC("==", UNDEF)) {
		goto L5;
	}
	ax = 0 - 0 - CC("<u", UNDEF) + 1;
L5:
	if (ax != 0) {
		goto L6;
	}
	loc_3 = (char)(loc_3 - -128);
	loc_2 = (int)(((long)loc_2 << 16 | (unsigned)loc_3) + ((long)ax << 16 | (unsigned)128) >> 16);
	*(int *)((char *)&loc_8 + 0) = *(int *)((char *)&loc_8 + 0) + 1;
	if (*(int *)((char *)&loc_8 + 0) >= 128) {
		goto L7;
	}
	goto L3;
L7:
	p26 = SEG_DATA;
	p28 = (int)(unsigned)STR_FLASH_MEMORY_OK;
	goto L8;
L4:
	p26 = SEG_DATA;
	p28 = (int)(unsigned)STR_FLASH_WRITE_ERROR;
	goto L8;
L6:
	p26 = SEG_DATA;
	p28 = (int)(unsigned)STR_FLASH_VERIFY_ERROR;
	goto L8;
L2:
	p26 = SEG_DATA;
	p28 = (int)(unsigned)STR_FLASH_CARD_NOT_FOUND;
L8:
	t10 = string_fill_stosb(p26, p28);
	return;
}
