/* differs: 308 at +0, 35 bytes; 311 at +0, 35 bytes; 312 at +0, 35 bytes */
#define UNDEF 0
struct s1 {
    char pad_0[70];
    char f_46;
};
extern void near fn_f8eb9(void);

long near fn_f8eab(void)
{
    int ax;
    int dx;
    struct s1 near *si;
    int t1;

    if ((unsigned char)(char)ax <= 4) {
        fn_f8eb9();
        ax = UNDEF;
        dx = UNDEF;
        si->f_46 = (char)0;
    }
    return ((long)dx << 16 | (unsigned)ax);
}
void near fn_f8eb9(void) { }
