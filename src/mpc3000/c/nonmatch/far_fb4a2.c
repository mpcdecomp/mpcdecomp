/* differs: 308 at +0, 75 bytes; 311 at +0, 75 bytes; 312 at +0, 75 bytes */
#define UNDEF 0
struct s1 {
    int f_0;
    char pad_2[8];
    int f_a;
    int f_c;
};
struct s2 {
    char pad_0[17];
    char f_11;
};
extern int near fn_fb52d(void);

void far far_fb4a2(void)
{
    int ax;
    struct s2 near *di;
    int p8;
    struct s1 near *si;

    ax = fn_fb52d();
    if (!CC("s", UNDEF)) {
        p8 = __flags(UNDEF);
        _disable();
        if ((si->f_0 & 4) != 0) {
            si->f_0 = 2;
            if ((unsigned char)(char)UNDEF < (unsigned char)di->f_11) {
                di->f_11 = (char)UNDEF;
            }
            si->f_c = 4;
            si->f_a = 0;
        }
        __insn("popf", p8);
    }
    return;
}
int near fn_fb52d(void) { return 0; }
