/* differs: 308 at +5, 1018 bytes; 311 at +5, 1010 bytes; 312 at +5, 1014 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
#define UNDEF 0
struct g_W_8C35 {
    long f_0;
};
extern char B_8806;
extern char B_8A9F;
extern char B_8C41;
extern char B_901B;
extern int W_8814;
extern struct g_W_8C35 W_8C35;
extern int W_8C37;
extern long far far_da9b8(int, int, int, int);
extern long far far_da9e4(int, int, int, int);
extern long far far_daa3c(int, int);
extern int far far_deee8(long, int);
extern int far far_e0031(long);
extern long far far_e259f(char);
extern void far far_e26a6(void);
extern long far far_e26cc(long);
extern long far far_e2ce3(void);
extern int far far_e344a(long);
extern long far far_e3d12(long, long);
extern long far far_e6d33(int, int);

long far far_e51be(long arg_0, int arg_2, unsigned int arg_4, int arg_6)
{
    int loc_18;
    int loc_16;
    int loc_14;
    int loc_12;
    int loc_10;
    int loc_e;
    int loc_c;
    int loc_a;
    int loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int bx;
    int bx10;
    int bx11;
    int bx12;
    int bx13;
    int bx14;
    int bx2;
    int bx3;
    int bx4;
    int bx5;
    int bx6;
    int bx7;
    int bx8;
    int bx9;
    int dx;
    unsigned int dx10;
    int dx11;
    int dx12;
    int dx2;
    int dx3;
    int dx4;
    unsigned int dx5;
    unsigned int dx6;
    unsigned int dx7;
    unsigned int dx8;
    unsigned int dx9;
    int es;
    int es10;
    int es11;
    int es12;
    int es2;
    int es3;
    int es4;
    int es5;
    int es6;
    int es7;
    int es8;
    int es9;
    long t1;
    long t10;
    long t11;
    int t12;
    int t13;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    int t7;
    long t8;
    long t9;

    if (arg_4 <= 99) {
        goto L1;
    }
    return ((long)dx << 16 | (unsigned)-1);
L1:
    if (arg_2 != SEG_DATA) {
        goto L2;
    }
    if (*(int *)((char *)&arg_0 + 0) != (unsigned int)(unsigned)&B_8C41) {
        goto L2;
    }
    if (B_901B != 0) {
        goto L3;
    }
    if (B_8A9F != arg_4) {
        goto L3;
    }
    far_e0031(arg_0);
    return ((long)UNDEF << 16 | (unsigned)-15);
L3:
    arg_6 = 1;
    B_8806 = *(char *)((char *)&arg_4 + 0);
    goto L4;
L2:
    B_8A9F = *(char *)((char *)&arg_4 + 0);
L4:
    loc_16 = 0;
    loc_18 = 0;
    bx = (int)arg_0;
    es = (int)(arg_0 >> 16);
    if (*(char far *)MK_FP(es, bx) < 0) {
        goto L5;
    }
    bx2 = (int)*(long far *)MK_FP(es, bx + 2);
    if ((*(char far *)MK_FP((int)(*(long far *)MK_FP(es, bx2 + 2) >> 16), bx2) & 127) != arg_4) {
        goto L5;
    }
    bx3 = (int)arg_0;
    es2 = (int)(arg_0 >> 16);
    if (*(char far *)MK_FP(es2, bx3) == arg_6) {
        goto L6;
    }
    if (*(char far *)MK_FP(es2, bx3) != 0) {
        goto L7;
    }
L6:
    return ((long)dx << 16 | (unsigned)0);
L7:
    bx4 = (int)arg_0;
    es3 = (int)(arg_0 >> 16);
    dx2 = *(int far *)MK_FP(es3, bx4 + 54);
    loc_16 = *(int far *)MK_FP(es3, bx4 + 56);
    loc_18 = dx2;
L5:
    t1 = far_e259f(*(char *)((char *)&arg_4 + 0));
    if ((int)t1 == 0) {
        goto L8;
    }
    return (long)MK_FP((int)(t1 >> 16), -1);
L8:
    bx5 = (int)arg_0;
    es4 = (int)(arg_0 >> 16);
    ax2 = W_8C37;
    dx3 = *(int *)((char *)&W_8C35 + 0);
    *(int far *)MK_FP(es4, bx5 + 4) = ax2;
    *(int far *)MK_FP(es4, bx5 + 2) = dx3;
    t2 = far_e26cc(((long)ax2 << 16 | (unsigned)dx3));
    loc_a = -((int)t2 < 0);
    loc_c = (int)t2;
    bx6 = (int)W_8C35.f_0;
    es5 = (int)(W_8C35.f_0 >> 16);
    dx4 = *(int far *)MK_FP(es5, bx6 + 1);
    loc_2 = *(int far *)MK_FP(es5, bx6 + 3);
    loc_4 = dx4;
    ax3 = *(int far *)MK_FP(es5, bx6 + 7);
    dx5 = *(int far *)MK_FP(es5, bx6 + 5);
    loc_6 = ax3;
    loc_8 = dx5;
    dx6 = dx5 + loc_c;
    bx7 = (int)arg_0;
    es6 = (int)(arg_0 >> 16);
    t3 = far_da9b8(*(int far *)MK_FP(es6, bx7 + 2), *(int far *)MK_FP(es6, bx7 + 4), dx6, ax3 + loc_a + (dx6 < dx5));
    loc_e = (int)(t3 >> 16);
    loc_10 = (int)t3;
    loc_12 = 0;
    loc_14 = 0;
    if (arg_6 != 0) {
        goto L9;
    }
    t4 = far_e2ce3();
    loc_12 = (int)(t4 >> 16);
    loc_14 = (int)t4;
    es7 = (int)(arg_0 >> 16);
    bx8 = (int)*(long far *)MK_FP(es7, (int)arg_0 + 2);
    *(char far *)MK_FP((int)(*(long far *)MK_FP(es7, bx8 + 2) >> 16), bx8) = (char)(*(char *)((char *)&arg_4 + 0) | -128);
    t5 = far_e6d33(loc_10, loc_e);
    if (B_8C41 < 0) {
        goto L10;
    }
    t6 = (*(long (far *)())far_e51be)((char far *)&B_8C41, B_8806, 1);
    goto L10;
L9:
    if (arg_2 != SEG_DATA) {
        goto L10;
    }
    if (*(int *)((char *)&arg_0 + 0) != (unsigned int)(unsigned)&B_901B) {
        goto L10;
    }
    far_e26a6();
L10:
    t8 = far_daa3c(loc_10, loc_e);
    bx9 = (int)arg_0;
    es8 = (int)(arg_0 >> 16);
    *(int far *)MK_FP(es8, bx9 + 24) = (int)(t8 >> 16);
    *(int far *)MK_FP(es8, bx9 + 22) = (int)t8;
    *(int far *)MK_FP(es8, bx9 + 16) = (int)(t8 >> 16);
    *(int far *)MK_FP(es8, bx9 + 14) = (int)t8;
    dx7 = *(int far *)MK_FP(es8, bx9 + 2);
    dx8 = dx7 + loc_c;
    t9 = far_daa3c(dx8, *(int far *)MK_FP(es8, bx9 + 4) + loc_a + (dx8 < dx7));
    bx10 = (int)arg_0;
    es9 = (int)(arg_0 >> 16);
    *(int far *)MK_FP(es9, bx10 + 12) = (int)(t9 >> 16);
    *(int far *)MK_FP(es9, bx10 + 10) = (int)t9;
    dx9 = loc_4;
    dx10 = dx9 + loc_14;
    t10 = far_da9e4(*(int far *)MK_FP(es9, bx10 + 10), *(int far *)MK_FP(es9, bx10 + 12), dx10, loc_2 + loc_12 + (dx10 < dx9));
    bx11 = (int)arg_0;
    es10 = (int)(arg_0 >> 16);
    *(int far *)MK_FP(es10, bx11 + 8) = (int)(t10 >> 16);
    *(int far *)MK_FP(es10, bx11 + 6) = (int)t10;
    t11 = far_da9e4(*(int far *)MK_FP(es10, bx11 + 22), *(int far *)MK_FP(es10, bx11 + 24), loc_14, loc_12);
    bx12 = (int)arg_0;
    es11 = (int)(arg_0 >> 16);
    *(int far *)MK_FP(es11, bx12 + 20) = (int)(t11 >> 16);
    *(int far *)MK_FP(es11, bx12 + 18) = (int)t11;
    if (*(int far *)MK_FP(es11, bx12 + 20) != *(int far *)MK_FP(es11, bx12 + 8)) {
        goto L11;
    }
    if (*(int far *)MK_FP(es11, bx12 + 18) != *(int far *)MK_FP(es11, bx12 + 6)) {
        goto L11;
    }
    dx11 = *(int far *)MK_FP(es11, bx12 + 10);
    *(int far *)MK_FP(es11, bx12 + 20) = *(int far *)MK_FP(es11, bx12 + 12);
    *(int far *)MK_FP(es11, bx12 + 18) = dx11;
L11:
    bx13 = (int)arg_0;
    es12 = (int)(arg_0 >> 16);
    *(int far *)MK_FP(es12, bx13 + 58) = 0;
    *(char far *)MK_FP(es12, bx13) = *(char *)((char *)&arg_6 + 0);
    t12 = far_e344a(((long)arg_2 << 16 | (unsigned)bx13));
    dx12 = UNDEF;
    bx14 = (int)arg_0;
    if ((*(char far *)MK_FP((int)(arg_0 >> 16), bx14 + 1) & -128) != 0) {
        goto L12;
    }
    W_8814 = 0;
    t13 = far_deee8(((long)arg_2 << 16 | (unsigned)bx14), 1);
    dx12 = UNDEF;
    if ((loc_18 | loc_16) == 0) {
        goto L13;
    }
    dx12 = (int)(far_e3d12(arg_0, *(long *)((char *)&loc_18 + 0)) >> 16);
L13:
    B_8A9F = *(char *)((char *)&arg_4 + 0);
    goto L14;
L12:
    B_8806 = *(char *)((char *)&arg_4 + 0);
L14:
    return ((long)dx12 << 16 | (unsigned)0);
}
