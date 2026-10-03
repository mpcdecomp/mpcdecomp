/* differs: 150 size 194, image 202; +1 image `enter 8, 0` CL `enter 0xa, 0`; 172 size 194, image 202; +1 image `enter 8, 0` CL `enter 0xa, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    char pad_0[19];
    char f_13;
    int f_14;
    int f_16;
    int f_18;
    int f_1a;
    int f_1c;
    int f_1e;
    char pad_20[16];
    int f_30;
};
extern char G_REC_MODE;
extern int REC_LENGTH;
extern int REC_LENGTH_HI;
extern int REC_PREREC_LEN;
extern long __far __pascal sample_desc_init(long);
extern long __far __pascal smem_alloc(long);
extern int __far __pascal timer_fdc_sync(struct s1 far *);

long __near __pascal lcd_clear_display(int arg_2, int arg_0)
{
	struct s1 far *loc_8;
	int loc_6;
	unsigned int loc_4;
	int loc_2;
	int ax;
	int ax2;
	int dx;
	int dx2;
	int dx3;
	long t1;
	long t2;
	int t3;

	dx = REC_LENGTH_HI;
	loc_4 = REC_LENGTH;
	loc_2 = dx;
	if (G_REC_MODE != 2) {
		goto L1;
	}
	loc_4 = loc_4 << 1;
	loc_2 = loc_2 << 1 | loc_4 >> 15 & 1;
L1:
	t1 = smem_alloc(*(long *)((char *)&loc_4 + 0));
	*(int *)((char *)&loc_8 + 0) = arg_0;
	loc_6 = arg_2;
	t2 = sample_desc_init(((long)loc_6 << 16 | (unsigned)arg_0));
	t3 = timer_fdc_sync(loc_8);
	loc_8->f_30 = (int)t1;
	if (G_REC_MODE != 2) {
		goto L2;
	}
	ax = ((char)(t3 >> 8) << 8 | (unsigned char)1);
	goto L3;
L2:
	ax = ((char)(t3 >> 8) << 8 | (unsigned char)0);
L3:
	loc_8->f_13 = (char)ax;
	loc_8->f_14 = REC_PREREC_LEN;
	loc_8->f_16 = 0;
	dx2 = REC_LENGTH_HI;
	loc_8->f_18 = REC_LENGTH;
	loc_8->f_1a = dx2;
	ax2 = REC_LENGTH;
	dx3 = REC_LENGTH_HI;
	loc_8->f_1c = ax2;
	loc_8->f_1e = dx3;
	return ((long)dx3 << 16 | (unsigned)ax2);
}
