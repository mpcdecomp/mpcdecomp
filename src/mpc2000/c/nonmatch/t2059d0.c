/* differs: 150 size 56, image 48; +1 image `enter 6, 0` CL `enter 4, 0`; 172 size 56, image 48; +1 image `enter 6, 0` CL `enter 4, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct s1 {
    int f_0;
    int f_2;
    int f_4;
};
struct g_P_1DB6 {
    int f_0;
    int f_2;
    int f_4;
};
extern struct g_P_1DB6 P_1DB6;

void __far __pascal far_memop_str_1(int arg_2, int arg_0)
{
	int loc_6;
	struct s1 far *loc_4;
	int loc_2;
	int ax;

	loc_6 = 64;
L1:
	ax = arg_0;
	arg_0 = arg_0 + 6;
	*(int *)((char *)&loc_4 + 0) = ax;
	loc_2 = arg_2;
	loc_4->f_0 = P_1DB6.f_0;
	loc_4->f_2 = P_1DB6.f_2;
	loc_4->f_4 = P_1DB6.f_4;
	loc_6 = loc_6 - 1;
	if (loc_6 != 1) {
		goto L1;
	}
	return;
}
