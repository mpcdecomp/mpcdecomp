/* differs: 308 absent; 311 at +5, 471 bytes; 312 at +5, 471 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define UNDEF 0
struct g_W_8C35 {
    long f_0;
};
extern unsigned char B_8C41[];
extern char B_901B;
extern char B_9561;
extern struct g_W_8C35 W_8C35;
extern int W_8C37;
extern int W_903D;
extern int W_903F;
extern int W_9567;
extern long far far_deee8(char far *);
extern long far far_e0031(char near *);
extern long far far_e259f(void);
extern long far far_e2ce3(int);
extern void far far_e481e(void);
extern long far far_e51be(char far *, int);
extern long far far_e6cb9(void);
extern void far fn_e483e(void);
extern void far fn_e4875(int);
extern void far fn_e4912(int);

void far far_e46a8(void)
{
    int loc_10;
    int loc_e;
    int loc_c;
    long loc_a;
    int loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    unsigned int cx;
    int cx2;
    unsigned int cx3;
    int cx4;
    int di;
    int dx;
    int dx2;
    int dx3;
    int es;
    int es2;
    int flags;
    int si;
    int si2;
    long t1;
    long t10;
    long t11;
    int t12;
    int t13;
    int t14;
    long t2;
    long t3;
    int t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    t1 = far_e0031(&B_901B);
    t2 = far_e6cb9();
    t3 = far_e2ce3((int)(t2 >> 16));
    flags = (int)(t2 >> 16) - (int)(t3 >> 16);
    if (!CC("<", flags) && (CC(">", flags) || (unsigned int)(int)t2 > (unsigned int)(int)t3)) {
        far_e481e();
        return;
    }
    t5 = far_e259f();
    dx = *(int *)((char *)&W_8C35 + 0);
    loc_8 = W_8C37;
    *(int *)((char *)&loc_a + 0) = dx;
    t6 = far_e259f();
    dx2 = *(int *)((char *)&W_8C35 + 0);
    loc_4 = W_8C37;
    loc_6 = dx2;
    ax = loc_8;
    si = *(int *)((char *)&loc_a + 0);
    es = (int)(W_8C35.f_0 >> 16);
    cx = ~__repne_scas1(MK_FP(es, (int)W_8C35.f_0 + 9), 0, -1);
    cx2 = cx >> 1;
    __movs2(((long)ax << 16 | (unsigned)(si + 9)), MK_FP(es, si + 9), cx2 * 2);
    __movs1(((long)ax << 16 | (unsigned)(si + 9 + cx2 * 2)), MK_FP(es, si + 9 + cx2 * 2), cx & 1);
    ax2 = loc_6;
    loc_10 = ax2 + 35;
    cx3 = loc_6 + 0x14f - (ax2 + 35);
    di = (int)loc_a;
    es2 = (int)(loc_a >> 16);
    ax3 = loc_4;
    si2 = loc_10;
    cx4 = cx3 >> 1;
    __movs2(MK_FP(es2, di + 35), ((long)ax3 << 16 | (unsigned)si2), cx4 * 2);
    __movs1(MK_FP(es2, di + 35 + cx4 * 2), ((long)ax3 << 16 | (unsigned)(si2 + cx4 * 2)), cx3 & 1);
    t7 = far_e51be((char far *)&B_901B, B_9561);
    t8 = far_deee8((char far *)&B_901B);
    B_901B = (char)1;
    t9 = far_deee8((char far *)&B_901B);
    B_901B = (char)0;
    t10 = far_e51be((unsigned char far *)B_8C41, 0);
    t11 = far_deee8((unsigned char far *)B_8C41);
    dx3 = W_903D;
    loc_c = W_903F;
    loc_e = dx3;
    fn_e4875(W_9567);
    W_903F = loc_c;
    W_903D = loc_e;
    fn_e4912(0);
    loc_2 = UNDEF;
    fn_e483e();
    return;
}
void far far_e481e(void) { }
void far fn_e483e(void) { }
void far fn_e4875(int p0) { }
void far fn_e4912(int p0) { }
