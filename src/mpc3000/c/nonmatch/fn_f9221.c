/* differs: 308 absent; 311 at +0, 393 bytes; 312 at +0, 393 bytes */
#define UNDEF 0
struct s1 {
    char pad_0[64];
    int f_40;
    char f_42;
};
extern int near fn_f95a6(void);
extern void near fn_f95cf(void);
extern void near fn_f95ec(void);
extern void near fn_f9626(void);
extern void near fn_f9654();
extern long near fn_f967a(void);

int near fn_f9221(void)
{
    char up_a[54];
    int ax;
    int ax2;
    int bx;
    int bx2;
    unsigned int di;
    int di2;
    int flags;
    int p56;
    int p60;
    unsigned int p62;
    int p64;
    int p66;
    int p68;
    struct s1 near *si;
    int t1;
    int t2;
    int t3;
    int t4;
    int t5;
    int t6;
    long t7;
    long t8;

    p62 = 0;
    p64 = (unsigned char)(char)ax;
    p60 = bx;
    p56 = 0;
    for (;;) {
        if ((unsigned char)si->f_42 < (unsigned char)*(char *)0x2) {
            goto L1;
        }
        si->f_42 = (char)0;
        fn_f95cf();
        if ((unsigned int)UNDEF <= 1 || (UNDEF & 0xff8) == 0xff8) {
            t2 = fn_f95a6();
            if ((char)(t2 >> 8) == 0) {
                si->f_40 = UNDEF;
                fn_f95ec();
                goto L1;
            }
            p56 = -1;
        } else {
            si->f_40 = UNDEF;
L1:
            fn_f9626();
            bx2 = UNDEF + (unsigned char)si->f_42;
            si->f_42 = (char)(si->f_42 + 1);
            di = p62;
            if (di == 0) {
                goto L2;
            }
            if (di >= (unsigned int)*(int *)0xd) {
                goto L3;
            }
            p66 = bx2;
            p68 = di;
            di2 = (di - 1) * 2;
            flags = bx2 - 1 - *(int *)((char *)&up_a + 0 + di2);
            di = p68;
            bx2 = p66;
            if (CC("!=", flags)) {
                goto L3;
            }
            p66 = bx2;
            fn_f9654(p66);
            bx2 = p66;
            if ((unsigned char)(char)UNDEF != 1) {
L2:
                *(int *)((char *)&up_a + 0 + di * 2) = bx2;
                p62 = p62 + 1;
                p64 = ((char)(p64 >> 8) << 8 | (unsigned char)((char)p64 - 1));
                if ((char)p64 != 1) {
                    continue;
                }
            } else {
L3:
                p56 = bx2;
            }
        }
        fn_f9654();
        t7 = fn_f967a();
        ax2 = (int)t7;
        if (CC("<u", UNDEF)) {
            goto L4;
        }
        p62 = 0;
        p64 = ((char)(p64 >> 8) + (char)p62 << 8 | (unsigned char)(char)p64);
        t8 = (unsigned long)(unsigned int)*(int *)0x0 * (unsigned long)(unsigned int)p62;
        p60 = p60 + (int)t8;
        ax2 = p56;
        if (ax2 == -1) {
            break;
        }
        if (ax2 == 0) {
            goto L5;
        }
        bx2 = ax2;
        di = 0;
        p56 = 0;
        goto L2;
    }
    ax2 = (-1 << 8 | (unsigned char)(char)ax2);
L5:
L4:
    __insn("popf", UNDEF);
    return ((char)(ax2 >> 8) << 8 | (unsigned char)(char)(p64 >> 8));
}
int near fn_f95a6(void) { return 0; }
void near fn_f95cf(void) { }
void near fn_f95ec(void) { }
void near fn_f9626(void) { }
void near fn_f9654(void) { }
long near fn_f967a(void) { return 0; }
