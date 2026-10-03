/* differs: 150 size 90, image 76; +0 image `push bp` CL `enter 4, 0`; 172 size 90, image 76; +0 image `push bp` CL `enter 4, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    char pad_0[50];
    int f_32;
    int f_34;
};
extern long __far addr_calc_segment(int, int, int);
extern long __far __pascal sample_desc_init(int, int);

void __far __pascal _memcpy_5(int arg_6, struct s1 far *arg_4, int arg_2, int arg_0)
{
	int di;
	int si;
	long t1;
	long t2;

	t1 = sample_desc_init(arg_6, *(int *)((char *)&arg_4 + 0));
	si = arg_0;
	di = FP_OFF(arg_4);
	__movs2(MK_FP(FP_SEG(arg_4), di), ((long)arg_2 << 16 | (unsigned)si), 40);
	t2 = addr_calc_segment(*(int far *)MK_FP(arg_2, arg_0 + 32), *(int far *)MK_FP(arg_2, arg_0 + 34), 0);
	arg_4->f_32 = (int)t2;
	arg_4->f_34 = (int)(t2 >> 16);
	return;
}
