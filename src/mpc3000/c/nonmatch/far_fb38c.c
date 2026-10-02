/* differs: 308 at +0, 78 bytes; 311 absent; 312 at +0, 78 bytes */
#define UNDEF 0
struct s1 {
    int f_0;
    char pad_2[6];
    int f_8;
};
struct s2 {
    char pad_0[17];
    char f_11;
};
extern int near fn_fb52d(void);

long far far_fb38c(void)
{
    struct s2 near *di;
    int p8;
    struct s1 near *si;
    int t1;

    t1 = fn_fb52d();
    if (!CC("s", UNDEF)) {
        p8 = __flags(UNDEF);
        _disable();
        si->f_8 = si->f_8 + 1;
        si->f_0 = si->f_0 | 1;
        if ((unsigned char)(char)UNDEF < (unsigned char)di->f_11) {
            di->f_11 = (char)UNDEF;
        }
        __insn("popf", p8);
    }
    return ((long)UNDEF << 16 | (unsigned)t1);
}
int near fn_fb52d(void) { return 0; }
