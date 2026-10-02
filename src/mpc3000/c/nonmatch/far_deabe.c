/* differs: 308 at +0, 179 bytes; 311 at +0, 179 bytes; 312 at +0, 179 bytes */
struct g_W_8C39 {
    long f_0;
};
extern char B_8802;
extern char B_8AA0;
extern char B_8C41;
extern char B_8C42;
extern char B_901B;
extern char B_901C;
extern int W_8285;
extern int W_8A98;
extern int W_8C31;
extern int W_8C33;
extern struct g_W_8C39 W_8C39;
extern int W_8C3B;
extern int W_8C3D;
extern int W_8C3F;
extern int W_8C43;
extern int W_8C45;
extern int W_8C6F;
extern int W_901D;
extern int W_901F;
extern int W_9049;
extern int W_96F6;
extern int W_96F8;
extern int W_D610;
extern long far far_e2ce3(void);
extern long far far_e70e6(void);
extern long far far_fb932(void);

long far far_deabe(void)
{
    int ax;
    int dx;
    int dx2;
    long t1;
    long t2;
    long t3;

    if ((W_8C3D | W_8C3F) == 0) {
        t1 = far_fb932();
    }
    dx = *(int *)((char *)&W_8C39 + 0);
    W_8C33 = W_8C3B;
    W_8C31 = dx;
    *(char far *)((char far *)W_8C39.f_0) = (char)-1;
    W_8C45 = 0;
    W_8C43 = 0;
    W_901F = 0;
    W_901D = 0;
    B_8C41 = (char)-1;
    B_901B = (char)-1;
    B_901C = (char)0;
    B_8C42 = (char)-128;
    W_9049 = 1;
    W_8C6F = 3;
    B_8802 = (char)0;
    B_8AA0 = (char)0;
    t2 = far_e2ce3();
    ax = (int)t2;
    dx2 = (int)(t2 >> 16);
    W_96F8 = dx2;
    W_96F6 = ax;
    if (W_8285 != 0) {
        W_8A98 = W_8285;
        W_D610 = 0x1000;
        t3 = far_e70e6();
        ax = (int)t3;
        dx2 = (int)(t3 >> 16);
    }
    return ((long)dx2 << 16 | (unsigned)ax);
}
