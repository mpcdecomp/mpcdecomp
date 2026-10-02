/* differs: 308 at +5, 344 bytes; 311 at +5, 343 bytes; 312 at +5, 343 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_8C41[];
extern unsigned char B_901B[];
extern char B_946B;
extern int W_8C35;
extern int W_9466;
extern int W_946C;
extern int W_946E;
extern int W_9470;
extern long far far_deee8(unsigned char far *, int);
extern long far far_dfc02(int, int, int);
extern long far far_e0031(unsigned char far *);
extern long far far_e12dc(int, int);
extern long far far_e259f(char);
extern long far far_e26cc(long);
extern long far far_e2ce3(void);
extern long far far_e51be(unsigned char far *, int, int);
extern long far far_fa0c8(int, int, int);
extern void far fn_e0fae(int, int);
void far fn_e0fae(int p0, int p1) { }

int far fn_e1093(void)
{
    int loc_2;
    char loc_6[4];
    unsigned int loc_8;
    int loc_a;
    int loc_c;
    int ax;
    int ax2;
    unsigned int cx;
    int flags;
    long t1;
    long t10;
    int t11;
    long t12;
    long t13;
    long t2;
    long t3;
    long t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    t1 = far_e259f(B_946B);
    loc_c = (int)far_e26cc(*(long *)((char *)&W_8C35 + 0));
    t2 = far_dfc02(B_946B, W_9470, W_946E + 1);
    loc_2 = (int)(t2 >> 16);
    ax = W_9466;
    t3 = far_fa0c8((int)t2, ax + 1, -(ax + 1 < 0));
    ax2 = loc_c;
    cx = (int)t3 + ax2;
    *(int *)((char *)&loc_6 + 0) = (int)(((long)((int)(t3 >> 16) + -(ax2 < 0) + (cx < (unsigned int)(int)t3)) << 16 | (unsigned)cx) + 0x190L >> 16);
    loc_8 = cx + 0x190;
    t4 = far_e2ce3();
    flags = (int)(t4 >> 16) - *(int *)((char *)&loc_6 + 0);
    if (!CC(">", flags) && (CC("<", flags) || (unsigned int)(int)t4 < loc_8)) {
        return -3;
    }
    t5 = far_e0031((unsigned char far *)B_8C41);
    t6 = far_e0031((unsigned char far *)B_901B);
    t7 = far_e12dc(B_946B, 0);
    t8 = far_e51be((unsigned char far *)B_901B, 0, 0);
    t9 = far_e51be((unsigned char far *)B_8C41, B_946B, 0);
    t10 = far_deee8((unsigned char far *)B_8C41, W_9470);
    loc_a = W_946C;
    W_946C = 1;
    fn_e0fae(W_946E - W_9470 + 1, 1);
    W_946C = loc_a;
    t12 = far_e0031((unsigned char far *)B_8C41);
    t13 = far_e0031((unsigned char far *)B_901B);
    return 0;
}
