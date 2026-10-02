/* differs: 308 at +0, 39 bytes; 311 at +0, 39 bytes; 312 at +0, 39 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_B_F21F {
    char pad_0[4];
    char f_4;
};
struct g_B_F21A {
    char pad_0[4];
    char f_4;
};
extern struct g_B_F21A B_F21A;
extern struct g_B_F21F B_F21F;
extern long far fn_c4122(void);
long far fn_c4122(void) { return 0; }

long far fn_c4174(void)
{
    __stos2((struct g_B_F21F far *)&B_F21F, 0, 4);
    B_F21F.f_4 = (char)0;
    __stos2((struct g_B_F21A far *)&B_F21A, 0, 4);
    B_F21A.f_4 = (char)0;
    return fn_c4122();
}
