/* differs: 308 at +3, 103 bytes; 311 at +3, 102 bytes; 312 at +3, 102 bytes */
struct g_W_8C35 {
    long f_0;
    char pad_4[31];
    int f_23;
};
extern char B_7FCC;
extern char B_A5CE;
extern int W_7FC8;
extern int W_8A98;
extern struct g_W_8C35 W_8C35;
extern int W_D610;
extern int W_D651;
extern long far far_de78c(void);
extern long far far_e259f(char);
extern long far far_e70e6(void);

long far fn_b4927(char arg_0)
{
    int ax;
    int ax2;
    int p6;
    long t1;

    ax = W_7FC8;
    W_8A98 = ax;
    if ((int)far_e259f(arg_0) == 0) {
        W_8A98 = *(int far *)((char far *)W_8C35.f_0 + 35);
    }
    p6 = W_D651;
    ax2 = W_8A98;
    t1 = (long)(int)ax2 << 12;
    W_D610 = (int)(t1 / (unsigned long)(unsigned int)p6);
    if (B_A5CE == 1) {
        W_D610 = 0x1000;
        return far_e70e6();
    }
    if (B_7FCC == 0) {
        W_D610 = 0x1000;
    }
    return far_de78c();
}
