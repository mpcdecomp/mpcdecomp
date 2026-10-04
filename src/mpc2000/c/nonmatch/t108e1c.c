/* differs: 150 size 466, image 324; +1 image `enter 0x1c, 0` CL `enter 0x26, 0`; 172 size 466, image 324; +1 image `enter 0x1c, 0` CL `enter 0x26, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern unsigned char STR_EXT_SND_4[1];
extern void __far __pascal bcd_convert(int, int, char far *);
extern int __far int2F_bcd_wrapper(void);
extern int __far int2F_dispatch_10(void);
extern int __far __pascal mem_block_process(char far *, int);
extern long __far __pascal memcpy_far_handler(char far *);
extern long __near midi_active_sense(void);
extern long __far __pascal sample_access_caller(char far *, int);
extern long __far __pascal sample_ptr_access(char far *);

long __far __pascal sample_name_lookup(long arg_0)
{
	char loc_1c[24];
	int loc_4;
	int loc_2;
	int ax;
	int bx;
	unsigned int cx;
	int cx2;
	unsigned int cx3;
	int cx4;
	unsigned int cx5;
	int cx6;
	int di;
	int di2;
	int di3;
	int di4;
	int es;
	int si;
	int si2;
	int t1;
	long t2;
	char far *t3;
	int t4;
	long t5;
	long t6;
	int t7;
	int t8;

	di = (int)arg_0;
	es = (int)(arg_0 >> 16);
	t1 = __repne_scas1(MK_FP(es, di), 0, -1);
	cx = ~t1;
	di2 = di + (-1 - t1) - cx;
	cx2 = cx >> 1;
	__movs2(MK_FP(SEG_STACK, di2), MK_FP(es, di2), cx2 * 2);
	__movs1(MK_FP(SEG_STACK, di2 + cx2 * 2), MK_FP(es, di2 + cx2 * 2), cx & 1);
	loc_2 = 0;
	if (loc_1c[0] == 0) {
		si = loc_2;
	} else {
		si = 0;
		while (loc_1c[si] != 46 && si < 16) {
			si = si + 1;
			if (loc_1c[si] != 0) {
				continue;
			}
			break;
		}
	}
	if (si < 16) {
		bx = (int)(unsigned)(loc_1c + si);
		cx3 = 16 - si;
		cx4 = cx3 >> 1;
		__stos2(MK_FP(SEG_STACK, bx), 0x2020, cx4 * 2);
		if (cx3 & 1) {
			*(char far *)MK_FP(SEG_STACK, bx + cx4 * 2) = (char)32;
		}
		si = si + cx3;
	}
	loc_1c[si] = (char)0;
	if (int2F_bcd_wrapper() != 2) {
		goto L1;
	}
	t2 = sample_ptr_access((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1c));
	ax = (int)t2;
	loc_4 = (int)(t2 >> 16);
	if (((int)(t2 >> 16) | ax) != 0) {
L2:
		return ((long)loc_4 << 16 | (unsigned)ax);
	}
L1:
	t3 = sample_access_caller((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1c), 0);
	if ((int)FP_OFF(t3) == 0) {
		return (long)(int)(int)FP_OFF(t3);
	}
	loc_2 = si;
	t4 = __repne_scas1((unsigned char far *)STR_EXT_SND_4, 0, -1);
	cx5 = ~t4;
	di3 = (int)(unsigned)(STR_EXT_SND_4 + (-1 - t4) - cx5);
	di4 = di3 + (-1 - __repne_scas1(MK_FP(SEG_STACK, di3), 0, -1));
	cx6 = cx5 >> 1;
	__movs2(MK_FP(SEG_STACK, di4 - 1), MK_FP(SEG_DATA, di3), cx6 * 2);
	__movs1(MK_FP(SEG_STACK, di4 - 1 + cx6 * 2), MK_FP(SEG_DATA, di3 + cx6 * 2), cx5 & 1);
	if (int2F_bcd_wrapper() != 2) {
		si2 = 0;
		loc_4 = 0;
		if (mem_block_process((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1c), 1) != 0) {
			t6 = midi_active_sense();
			si2 = (int)t6;
			loc_4 = (int)(t6 >> 16);
			t7 = int2F_dispatch_10();
		}
	} else {
		t5 = memcpy_far_handler((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1c));
		si2 = (int)t5;
		loc_4 = (int)(t5 >> 16);
	}
	if ((loc_4 | si2) != 0) {
		loc_1c[loc_2] = (char)0;
		bcd_convert(loc_4, si2, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_1c));
	}
	ax = si2;
	goto L2;
}
