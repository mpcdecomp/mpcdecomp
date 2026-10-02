/* differs: 308 absent; 311 at +3, 52 bytes; 312 at +3, 52 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define UNDEF 0
extern long far far_dcfb5(long, int, int, int);
extern int far far_dd0fb(void);

long far far_dcf84(int arg_4, int arg_6)
{
    int ax;

    ax = far_dd0fb();
    if ((*(char far *)MK_FP(UNDEF, UNDEF) & -8) == -64) {
        ax = (-128 << 8 | (unsigned char)(char)ax);
    }
    return far_dcfb5(((long)UNDEF << 16 | (unsigned)UNDEF), arg_4, ax, arg_6);
}
long far far_dcfb5(long p0, int p1, int p2, int p3) { return 0; }
int far far_dd0fb(void) { return 0; }
