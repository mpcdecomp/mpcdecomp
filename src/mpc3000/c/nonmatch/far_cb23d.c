/* differs: 308 absent; 311 at +0, 132 bytes; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
struct g_TBL_D65F {
    int f_0;
};
struct g_TBL_D65D {
    int f_0;
};
struct g_TBL_D663 {
    int f_0;
};
struct g_TBL_D661 {
    int f_0;
};
extern char TBL_D65B[];
extern char TBL_D65C[];
extern struct g_TBL_D65D TBL_D65D;
extern struct g_TBL_D65F TBL_D65F;
extern struct g_TBL_D661 TBL_D661;
extern struct g_TBL_D663 TBL_D663;
extern long far far_cca3a(void);

long far far_cb23d(void)
{
    int si;
    long t1;

    __stos2(MK_FP(0xa283 /* SEG_A28F */, 0x4800), 0, 0x1200);
    __stos2((char far *)TBL_D65B, 0, 0xbc2);
    TBL_D65B[0] = (char)-1;
    TBL_D65C[0] = (char)-1;
    TBL_D65F.f_0 = 1;
    TBL_D65D.f_0 = 0x7d0;
    t1 = far_cca3a();
    TBL_D663.f_0 = (int)(t1 >> 16);
    TBL_D661.f_0 = (int)t1;
    si = 10;
    do {
        TBL_D65B[si] = (char)0;
        TBL_D65C[si] = (char)-1;
        *(int *)((char *)&TBL_D65F + 0 + si) = -1;
        *(int *)((char *)&TBL_D65D + 0 + si) = -1;
        *(int *)((char *)&TBL_D663 + 0 + si) = -1;
        *(int *)((char *)&TBL_D661 + 0 + si) = -1;
        si = si + 10;
    } while (si != 0xbb8);
    return t1;
}
