/* differs: 308 at +0, 260 bytes; 311 at +0, 260 bytes; 312 at +0, 261 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8805;
extern char B_8A9F;
extern unsigned char B_8C41[];
extern unsigned char B_901B[];
extern char B_901C;
extern char B_9561;
extern char B_9562;
extern char B_D612;
extern char B_F744;
extern char TBL_F779;
extern int W_904B;
extern int W_904D;
extern int W_9563;
extern int W_9565;
extern int W_9567;
extern int far far_d7b8f(int, int);
extern long far far_d9b6e(int, char far *, int);
extern long far far_deeab(void);
extern long far far_deee8(unsigned char far *, int);
extern long far far_e0031(unsigned char far *);
extern long far far_e12dc(int, int);
extern long far far_e51be(unsigned char far *, int, int);
extern void far far_e598e(void);
extern void far far_e5a2b(void);
extern void far far_e5a58(void);
extern long far far_e5a99(unsigned char far *);
extern int far fn_e45d1(void);
extern void far fn_e483e(void);
extern void far fn_e4875(int, int);

void far far_e44c1(void)
{
    long t1;
    int t10;
    long t11;
    int t12;
    long t13;
    long t14;
    long t15;
    long t16;
    int t2;
    int t3;
    int t4;
    long t5;
    int t6;
    long t7;
    long t8;
    int t9;

    B_F744 = B_8805;
    B_8805 = (char)0;
    t1 = far_deeab();
    t2 = far_d7b8f(0, 1);
    B_9562 = (char)1;
    B_9561 = B_8A9F;
    far_e5a2b();
    far_e598e();
    t5 = far_e0031((unsigned char far *)B_901B);
    W_9563 = W_9565 - 1;
    if ((int)far_e12dc(B_9561, 0) != 0) {
        fn_e483e();
        return;
    }
    t7 = far_e51be((unsigned char far *)B_8C41, B_9561, 1);
    t8 = far_deee8((unsigned char far *)B_8C41, W_9565);
    if (fn_e45d1() != 0) {
        fn_e483e();
        return;
    }
    fn_e4875(W_9567, 1);
    TBL_F779 = (char)-1;
    t11 = far_d9b6e(1, (char far *)&TBL_F779, 1);
    W_904B = W_9567;
    far_e5a58();
    W_904D = 1;
    B_901C = (char)(B_901C | 1);
    t13 = far_e0031((unsigned char far *)B_901B);
    t14 = far_e0031((unsigned char far *)B_8C41);
    t15 = far_e51be((unsigned char far *)B_901B, 0, 0);
    t16 = far_e5a99((unsigned char far *)B_901B);
    B_D612 = (char)0;
    return;
}
int far fn_e45d1(void) { return 0; }
void far fn_e483e(void) { }
void far fn_e4875(int p0, int p1) { }
