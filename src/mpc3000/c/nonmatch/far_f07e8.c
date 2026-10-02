/* differs: 308 at +5, 133 bytes; 311 at +5, 84 bytes; 312 at +5, 84 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_7FD0;
extern char B_7FF0;
extern char B_8183;
extern char B_9447;
extern char B_F778;
extern int far far_d78b2(void);
extern int far far_d7903(void);
extern long far far_d79b0(int, int);
extern long far fn_f0875(void);
extern int far fn_f0b07(void);

long far far_f07e8(void)
{
    int loc_2;
    int loc_4;
    int loc_6;
    int ax;
    int ax2;
    int si;
    int t1;
    long t2;
    long t3;
    long t4;

    loc_4 = B_8183;
    loc_6 = B_7FD0;
    B_8183 = (char)0;
    B_7FD0 = (char)0;
    loc_2 = B_7FF0;
    B_7FF0 = (char)1;
    ax = far_d78b2();
    B_9447 = (char)1;
    si = 0;
    while (si == 0) {
        if (B_F778 != 0) {
            t1 = fn_f0b07();
            si = t1;
            continue;
        }
        t2 = fn_f0875();
        si = (int)t2;
    }
    B_9447 = (char)0;
    t3 = far_d79b0(1, 1);
    t4 = far_d79b0(2, 1);
    B_7FF0 = *(char *)((char *)&loc_2 + 0);
    B_8183 = *(char *)((char *)&loc_4 + 0);
    B_7FD0 = *(char *)((char *)&loc_6 + 0);
    far_d7903();
    return ((long)UNDEF << 16 | (unsigned)si);
}
long far fn_f0875(void) { return 0; }
int far fn_f0b07(void) { return 0; }
