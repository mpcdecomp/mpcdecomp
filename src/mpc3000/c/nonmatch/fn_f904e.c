/* differs: 308 at +0, 168 bytes; 311 at +0, 168 bytes; 312 at +0, 168 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    char f_0;
    char pad_1[25];
    int f_1a;
};
extern int far fn_f9325(int);
extern int near fn_f948b(void);
extern int near fn_f950a(void);
extern void near fn_f95cf(void);
extern void near fn_f95ec(int);

int near fn_f904e(void)
{
    int ax;
    char near *bx;
    int bx2;
    int cx;
    int dx;
    int flags;
    struct s1 near *p6;
    char near *si;
    int t1;
    int t2;

    bx = (char near *)UNDEF;
    ax = (int)fn_f9325(bx2);
    if (!CC(">=u", UNDEF)) {
        return ax;
    }
    flags = (char)(ax >> 8) + 1;
    if (!CC("!=", flags)) {
        return (-1 << 8 | (unsigned char)(char)ax);
    }
    p6 = (struct s1 near *)si;
    cx = 32;
    do {
        ax = ((char)(ax >> 8) << 8 | (unsigned char)*bx);
        *si = (char)ax;
        bx = bx + 1;
        si = si + 1;
        flags = (int)(unsigned)si;
        cx = cx - 1;
    } while (cx != 0);
    p6->f_0 = (char)-27;
    if (!CC(">=u", UNDEF)) {
        return fn_f948b();
    }
    dx = p6->f_1a;
    for (;;) {
        if (dx != 0) {
            fn_f95cf();
            fn_f95ec(UNDEF);
            if ((unsigned int)UNDEF > 1) {
                dx = UNDEF;
                if ((UNDEF & 0xff8) != 0xff8) {
                    continue;
                }
                break;
            }
            break;
        }
        break;
    }
    return fn_f950a();
}
int far fn_f9325(int p0) { return 0; }
int near fn_f948b(void) { return 0; }
int near fn_f950a(void) { return 0; }
void near fn_f95cf(void) { }
void near fn_f95ec(int p0) { }
