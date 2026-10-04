/* differs: 150 size 556, image 356; +1 image `enter 2, 0` CL `enter 0x14, 0`; 172 size 556, image 356; +1 image `enter 2, 0` CL `enter 0x14, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern long __far addr_calc_segment(int, int, int);
extern long __near __pascal lcd_ratio_calc(int);
extern long __near __pascal lcd_screen_helper(int, int, int, int);
extern long __far __pascal sample_desc_init(int, int);

long __near __pascal lcd_clear_screen(int arg_6, int arg_4, int arg_2, int arg_0)
{
	int loc_2;
	int ax;
	int ax2;
	int ax3;
	int ax4;
	int ax5;
	int cx;
	int dx;
	int dx2;
	int dx3;
	int dx4;
	int dx5;
	int dx6;
	int es;
	int flags;
	long t1;
	long t2;
	char far *t3;

	t1 = sample_desc_init(arg_6, arg_4);
	t2 = lcd_screen_helper(arg_6, arg_4, arg_2, arg_0 + 3);
	if ((*(char far *)MK_FP(arg_2, arg_0 + 15) & -128) == 0) {
		goto L1;
	}
	ax = *(int far *)MK_FP(arg_2, arg_0 + 138);
	goto L2;
L1:
	ax = (0 - (*(char far *)MK_FP(arg_2, arg_0 + 1) == 0) & -0x5622) - 0x53bc;
L2:
	*(int far *)MK_FP(arg_6, arg_4 + 38) = ax;
	ax2 = 0 - (*(char far *)MK_FP(arg_2, arg_0 + 1) == 0);
	loc_2 = ((char)(ax2 >> 8) << 8 | (unsigned char)((char)ax2 & -120));
	loc_2 = loc_2 + (int)lcd_ratio_calc(*(int far *)MK_FP(arg_2, arg_0 + 20));
	if (loc_2 >= -240) {
		goto L3;
	}
	cx = -240;
	goto L4;
L3:
	cx = loc_2;
	if (cx <= 240) {
		goto L4;
	}
	cx = 240;
L4:
	*(char far *)MK_FP(arg_6, arg_4 + 18) = (char)cx;
	dx = *(int far *)MK_FP(arg_2, arg_0 + 28);
	*(int far *)MK_FP(arg_6, arg_4 + 28) = *(int far *)MK_FP(arg_2, arg_0 + 26);
	*(int far *)MK_FP(arg_6, arg_4 + 30) = dx;
	dx2 = *(int far *)MK_FP(arg_2, arg_0 + 32);
	*(int far *)MK_FP(arg_6, arg_4 + 20) = *(int far *)MK_FP(arg_2, arg_0 + 30);
	*(int far *)MK_FP(arg_6, arg_4 + 22) = dx2;
	dx3 = *(int far *)MK_FP(arg_2, arg_0 + 36);
	*(int far *)MK_FP(arg_6, arg_4 + 24) = *(int far *)MK_FP(arg_2, arg_0 + 34);
	*(int far *)MK_FP(arg_6, arg_4 + 26) = dx3;
	ax3 = *(int far *)MK_FP(arg_2, arg_0 + 44);
	dx4 = *(int far *)MK_FP(arg_2, arg_0 + 46);
	*(int far *)MK_FP(arg_6, arg_4 + 32) = ax3;
	*(int far *)MK_FP(arg_6, arg_4 + 34) = dx4;
	if (*(int far *)MK_FP(arg_2, arg_0 + 48) != 0x270f) {
		goto L5;
	}
	ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)1);
	goto L6;
L5:
	ax4 = ((char)(ax3 >> 8) << 8 | (unsigned char)0);
L6:
	*(char far *)MK_FP(arg_6, arg_4 + 36) = (char)ax4;
	if ((char)ax4 == 0) {
		goto L7;
	}
	ax5 = *(int far *)MK_FP(arg_2, arg_0 + 38);
	dx5 = *(int far *)MK_FP(arg_2, arg_0 + 40);
	*(int far *)MK_FP(arg_6, arg_4 + 24) = ((char)(ax5 >> 8) << 8 | (unsigned char)((char)ax5 & -64));
	*(int far *)MK_FP(arg_6, arg_4 + 26) = dx5;
L7:
	es = arg_6;
	flags = *(int far *)MK_FP(es, arg_4 + 26) - *(int far *)MK_FP(es, arg_4 + 34);
	if (CC(">", flags)) {
		goto L8;
	}
	if (CC("<", flags)) {
		goto L9;
	}
	if ((unsigned int)*(int far *)MK_FP(es, arg_4 + 24) >= (unsigned int)*(int far *)MK_FP(es, arg_4 + 32)) {
		goto L8;
	}
L9:
	dx6 = *(int far *)MK_FP(es, arg_4 + 26);
	*(int far *)MK_FP(es, arg_4 + 32) = *(int far *)MK_FP(es, arg_4 + 24);
	*(int far *)MK_FP(es, arg_4 + 34) = dx6;
L8:
	t3 = addr_calc_segment(*(int far *)MK_FP(arg_6, arg_4 + 32), *(int far *)MK_FP(arg_6, arg_4 + 34), 0);
	*(int far *)MK_FP(arg_6, arg_4 + 50) = (int)FP_OFF(t3);
	*(int far *)MK_FP(arg_6, arg_4 + 52) = (int)FP_SEG(t3);
	return ((long)arg_6 << 16 | (unsigned)arg_4);
}
