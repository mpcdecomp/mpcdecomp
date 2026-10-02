/* differs: 308 at +0, 276 bytes; 311 at +0, 276 bytes; 312 at +0, 276 bytes */
#define UNDEF 0
struct s1 {
    char pad_0[11];
    char f_b;
};
struct s2 {
    char f_0;
    char pad_1[31];
    char f_20;
};
extern int far fn_f9325();
extern int near fn_f948b(void);

int near fn_f90a9(void)
{
    int ax;
    int ax2;
    int bx;
    char near *bx2;
    int cx;
    int cx2;
    int cx3;
    struct s1 near *di;
    int flags;
    int flags2;
    int flags3;
    int si;
    struct s2 near *si2;
    char near *si3;
    long t1;

    t1 = fn_f9325(si, bx);
    si2 = (struct s2 near *)si;
    if (!CC(">=u", UNDEF)) {
        return (int)t1;
    }
    if ((char)((int)t1 >> 8) != -1) {
        return (-2 << 8 | (unsigned char)(char)(int)t1);
    }
    ax = (int)fn_f9325();
    if (!CC(">=u", UNDEF)) {
        return ax;
    }
    flags = (char)(ax >> 8) + 1;
    if (!CC("!=", flags)) {
        return (-1 << 8 | (unsigned char)(char)ax);
    }
    di = (struct s1 near *)si2;
    cx = 11;
    do {
        ax = ((char)(ax >> 8) << 8 | (unsigned char)si2->f_20);
        si2->f_0 = (char)ax;
        si2 = (struct s2 near *)((char near *)si2 + 1);
        flags = (int)(unsigned)si2;
        cx = cx - 1;
    } while (cx != 0);
    si3 = (char near *)(struct s2 near *)((char near *)si2 + 1);
    flags2 = (int)(unsigned)si3;
    cx2 = 8;
    do {
        ax = ((char)(ax >> 8) << 8 | (unsigned char)si3[32]);
        *si3 = (char)ax;
        si3 = si3 + 1;
        flags2 = (int)(unsigned)si3;
        cx2 = cx2 - 1;
    } while (cx2 != 0);
    ax2 = ((char)(ax >> 8) << 8 | (unsigned char)*(char *)(0xb + UNDEF));
    di->f_b = (char)ax2;
    bx2 = (char near *)(UNDEF + 20);
    flags3 = (int)(unsigned)bx2;
    cx3 = 12;
    do {
        ax2 = ((char)(ax2 >> 8) << 8 | (unsigned char)*bx2);
        *si3 = (char)ax2;
        bx2 = bx2 + 1;
        si3 = si3 + 1;
        flags3 = (int)(unsigned)si3;
        cx3 = cx3 - 1;
    } while (cx3 != 0);
    return fn_f948b();
}
int far fn_f9325(void) { return 0; }
int near fn_f948b(void) { return 0; }
