/* differs: 308 at +5, 364 bytes; 311 at +5, 362 bytes; 312 at +5, 365 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern int W_F760;
extern long far far_c812b(void far *, char far *, char far *);
extern long far far_caa9c(char far *);
extern long far far_caade(char far *);
extern long far far_cab20(int);
extern int far far_cad90(char far *, int, int);
extern int far fn_e9185(int, int, int, int, int);

int far fn_e9041(int arg_0)
{
    char loc_6[6];
    char loc_c[6];
    char loc_20[20];
    int dx;
    unsigned int dx2;
    long t1;
    long t2;
    int t3;
    int t4;
    long t5;
    int t6;

    __movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_c), MK_FP(SEG_DATA, 0x7488), 4);
    loc_c[4] = *(char *)(0x748c);
    t1 = far_c812b(MK_FP(0xa283 /* SEG_A28F */, arg_0 * 36 + 0x4800), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_c), (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_20));
    if ((int)far_caade((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_20)) >= 0) {
        return -0x800;
    }
    t2 = far_caa9c((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_20));
    W_F760 = (int)t2;
    if ((int)t2 < 0) {
        return (int)t2;
    }
    loc_6[0] = (char)1;
    loc_6[1] = (char)2;
    t3 = far_cad90((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_6), W_F760, 2);
    if (t3 != 0) {
        return t3;
    }
    t4 = far_cad90(MK_FP(0xa283 /* SEG_A28F */, arg_0 * 36 + 0x4800), W_F760, 36);
    if (t4 != 0) {
        return t4;
    }
    t5 = (long)(int)arg_0 * 36L;
    if (*(char far *)MK_FP(0xa283 /* SEG_A28F */, (int)t5 + 0x4813) == 0) {
        dx = *(int far *)MK_FP(0xa283 /* SEG_A28F */, (int)t5 + 0x481c);
        *(int *)((char *)&loc_6 + 4) = *(int far *)MK_FP(0xa283 /* SEG_A28F */, (int)t5 + 0x481e);
        *(int *)((char *)&loc_6 + 2) = dx;
    } else if (*(char far *)MK_FP(0xa283 /* SEG_A28F */, (int)t5 + 0x4813) == 1) {
        dx2 = *(int far *)MK_FP(0xa283 /* SEG_A28F */, (int)t5 + 0x481c);
        *(int *)((char *)&loc_6 + 4) = *(int far *)MK_FP(0xa283 /* SEG_A28F */, (int)t5 + 0x481e) << 1 | dx2 >> 15 & 1;
        *(int *)((char *)&loc_6 + 2) = dx2 << 1;
    }
    t6 = fn_e9185(W_F760, *(int far *)MK_FP(0xa283 /* SEG_A28F */, (int)t5 + 0x4820), *(int far *)MK_FP(0xa283 /* SEG_A28F */, (int)t5 + 0x4822), *(int *)((char *)&loc_6 + 2), *(int *)((char *)&loc_6 + 4));
    if (t6 != 0) {
        return t6;
    }
    return (int)far_cab20(W_F760);
}
int far fn_e9185(int p0, int p1, int p2, int p3, int p4) { return 0; }
