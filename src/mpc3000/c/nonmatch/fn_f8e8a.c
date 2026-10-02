/* differs: 308 at +0, 24 bytes; 311 at +0, 24 bytes; 312 at +0, 24 bytes */
#define UNDEF 0
struct s1 {
    char pad_0[70];
    char f_46;
};
extern void near fn_f8eb9(void);

int near fn_f8e8a(void)
{
    int ax;
    int ax2;
    struct s1 near *si;
    int t1;

L1:
    fn_f8eb9();
    ax = UNDEF;
    if (si->f_46 == 0) {
        goto L2;
    }
    ax2 = ((char)(ax >> 8) << 8 | (unsigned char)((char)ax + 1));
    if (UNDEF != 1) {
        goto L1;
    }
    ax = ((char)(ax2 >> 8) << 8 | (unsigned char)-1);
    goto L3;
L2:
    si->f_46 = (char)-1;
L3:
    return ax;
}
void near fn_f8eb9(void) { }
