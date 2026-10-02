/* differs: 308 at +0, 16 bytes; 311 at +0, 16 bytes; 312 at +0, 16 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_A3E7 {
    int f_0;
};
struct g_TBL_A267 {
    int f_0;
};
extern char B_96F5;
extern void far far_d99e6(void);

long near fn_dcc08(void)
{
    int bx;
    int t1;
    int t2;

    far_d99e6();
    far_d99e6();
    B_96F5 = (char)1;
    return;
}
