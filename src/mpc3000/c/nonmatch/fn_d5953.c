/* differs: 308 at +8, 156 bytes; 311 at +5, 177 bytes; 312 at +5, 177 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct s1 {
    int f_0;
    int f_2;
};
extern char B_7ACE;
extern char B_7ACF;
extern char W_7ACC;
extern int far far_d565e(int, int, int, int, char far *);
int far far_d565e(int p0, int p1, int p2, int p3, char far *p4) { return 0; }

long far fn_d5953(void)
{
    char loc_200[512];
    char loc_202[2];
    struct s1 near *bx;
    int cx;
    int dx;
    int si;
    int t1;

    do {
        t1 = far_d565e(W_7ACC, 0, 0, 1, (char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_202));
    } while (t1 == 0x306);
    if (t1 == 0x302) {
        return ((long)t1 << 16 | (unsigned)6);
    }
    if (t1 != 0) {
        return ((long)t1 << 16 | (unsigned)4);
    }
    if (loc_200[506] != 85 && loc_200[507] != -86) {
        return ((long)t1 << 16 | (unsigned)5);
    }
    si = 64;
    *(int *)((char *)&loc_200 + 510) = 0;
    cx = 0x6eab;
    do {
        dx = *(int *)((char *)&loc_202 + 0 + si);
        bx = (struct s1 near *)cx;
        bx->f_2 = *(int *)((char *)&loc_200 + 0 + si);
        bx->f_0 = dx;
        if (*(int *)((char *)&loc_200 + 510) != 0 && (bx->f_0 | bx->f_2) == 0) {
            break;
        }
        si = si + 4;
        cx = cx + 4;
        *(int *)((char *)&loc_200 + 510) = *(int *)((char *)&loc_200 + 510) + 1;
    } while (cx != 0x6f13);
    *(char *)0x6ea6 = loc_200[510];
    B_7ACF = loc_200[22];
    B_7ACE = loc_200[24];
    return ((long)dx << 16 | (unsigned)0);
}
