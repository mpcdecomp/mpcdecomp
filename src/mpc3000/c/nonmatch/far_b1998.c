/* differs: 308 absent; 311 at +5, 325 bytes; 312 absent */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
extern int far far_cb566(void far *, long, long, int);
extern long far far_cd003(int);

void far far_b1998(void)
{
    int far *loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    long t1;
    long t2;
    long t3;
    long t4;
    long t5;

    loc_2 = 128;
    __movs2(MK_FP(0xa283 /* SEG_A28F */, 0x5a00), MK_FP(SEG_DATA, 0x1d1e), 6);
    t1 = (long)(int)loc_2 * 36L;
    *(int far *)MK_FP(0xa283 /* SEG_A28F */, (int)t1 + 0x4822) = 1;
    *(int far *)MK_FP(0xa283 /* SEG_A28F */, (int)t1 + 0x4820) = 0;
    t2 = (long)(int)loc_2 * 36L;
    *(int far *)MK_FP(0xa283 /* SEG_A28F */, (int)t2 + 0x481e) = 0;
    *(int far *)MK_FP(0xa283 /* SEG_A28F */, (int)t2 + 0x481c) = 0x7d0;
    t3 = far_cd003(loc_2);
    *(char far *)MK_FP(0xa283 /* SEG_A28F */, loc_2 * 36 + 0x4813) = (char)0;
    *(char far *)MK_FP(0xa283 /* SEG_A28F */, loc_2 * 36 + 0x4811) = (char)-56;
    t4 = (long)(int)loc_2 * 36L;
    *(int far *)MK_FP(0xa283 /* SEG_A28F */, (int)t4 + 0x4818) = *(int far *)MK_FP(0xa283 /* SEG_A28F */, (int)t4 + 0x4818) + 0x373;
    *(int far *)MK_FP(0xa283 /* SEG_A28F */, (int)t4 + 0x481a) = (int)(*(long far *)MK_FP(0xa283 /* SEG_A28F */, (int)t4 + 0x4818) + 0x373L >> 16);
    __stos2(MK_FP(0xa283 /* SEG_A28F */, 0), 0, 0xfa0);
    loc_4 = 0xa283 /* SEG_A28F */;
    *(int *)((char *)&loc_6 + 0) = 0;
    ax = 0;
    do {
        *loc_6 = 0x7fff;
        *(int *)((char *)&loc_6 + 0) = *(int *)((char *)&loc_6 + 0) + 2;
        ax = ax + 1;
    } while (ax < 50);
    t5 = (long)(int)loc_2 * 36L;
    far_cb566(MK_FP(0xa283 /* SEG_A28F */, 0), *(long far *)MK_FP(0xa283 /* SEG_A28F */, (int)t5 + 0x4820), 0x7d0L, 0);
    return;
}
