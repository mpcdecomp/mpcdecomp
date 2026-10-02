/* differs: 308 at +A, 296 bytes; 311 at +A, 302 bytes; 312 at +A, 302 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8802;
extern unsigned char B_8C41[];
extern char B_8C42;
extern unsigned char B_901B[];
extern char B_901C;
extern char B_9469;
extern char B_946B;
extern int W_9466;
extern int W_946C;
extern int W_946E;
extern int W_9470;
extern long far far_deeab(void);
extern long far far_deee8(unsigned char far *, int);
extern long far far_e0031(unsigned char far *);
extern long far far_e1e11(int);
extern long far far_e259f(char);
extern void far far_e2a44(int, int, int);
extern long far far_e51be(unsigned char far *, int, int);
extern void far far_e5902(int);
extern void far far_e598e(void);
extern long far far_e59bd(void);
extern void far fn_e0fae(int, int);
extern int far fn_e1093(void);
extern void far fn_e11b1(void);

int far far_e0e31(void)
{
    int ax;
    int si;
    int si2;
    int t1;
    long t10;
    long t11;
    long t12;
    long t13;
    long t14;
    long t15;
    long t16;
    long t17;
    int t18;
    int t19;
    long t2;
    int t20;
    long t21;
    long t22;
    long t23;
    long t24;
    long t25;
    long t3;
    int t4;
    long t5;
    long t6;
    long t7;
    long t8;
    int t9;

    si = W_946E - W_9470;
    if (si == -1) {
        return 0;
    }
    if ((int)far_e259f(B_946B) != 0) {
        return 0;
    }
    B_901C = (char)(B_901C & -3);
    B_8C42 = (char)(B_8C42 & -3);
    B_8802 = (char)0;
    far_e598e();
    t2 = far_e0031((unsigned char far *)B_8C41);
    t3 = far_e0031((unsigned char far *)B_901B);
    t4 = fn_e1093();
    if (t4 != 0) {
        t5 = far_e0031((unsigned char far *)B_8C41);
        t6 = far_e0031((unsigned char far *)B_901B);
        t7 = far_e1e11(0);
        t8 = far_e59bd();
        return t4;
    }
    if (B_9469 != B_946B) {
        fn_e11b1();
        if (UNDEF != 0) {
            t10 = far_e0031((unsigned char far *)B_8C41);
            t11 = far_e0031((unsigned char far *)B_901B);
            t12 = far_e1e11(0);
            t13 = far_e59bd();
            return;
        }
L1:
        t14 = far_e51be((unsigned char far *)B_901B, B_9469, 0);
        t15 = far_deee8((unsigned char far *)B_901B, W_946C);
        t16 = far_e51be((unsigned char far *)B_8C41, 0, 1);
        t17 = far_deee8((unsigned char far *)B_8C41, 1);
        fn_e0fae(si + 1, W_9466);
        si2 = W_946C + (si + 1) * W_9466;
        far_e5902(si2);
        far_e2a44(W_946C, si2, 1);
        t21 = far_e0031((unsigned char far *)B_8C41);
        t22 = far_e0031((unsigned char far *)B_901B);
        t23 = far_e1e11(0);
        t24 = far_e51be((unsigned char far *)B_901B, B_9469, 0);
        t25 = far_deeab();
        return 0;
    }
    goto L1;
}
void far fn_e0fae(int p0, int p1) { }
int far fn_e1093(void) { return 0; }
void far fn_e11b1(void) { }
