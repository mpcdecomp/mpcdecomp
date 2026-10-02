/* differs: 308 at +5, 77 bytes; 311 at +5, 77 bytes; 312 at +5, 77 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern void far far_b20fd(void);
extern void far far_ba2a4(void);
extern long far far_caade(long);
extern long far far_cad00(int);
extern void far far_da72a(void far *, int);
extern int far far_da76f(void far *, int);
extern int far fn_d7fd0(int);

int far far_d7f67(int arg_0, int arg_2)
{
    int loc_2;
    int ax;
    long t1;
    long t2;
    int t3;
    int t4;
    int t5;
    int t6;

    t1 = far_cad00(0);
    t2 = far_caade(*(long *)((char *)&arg_0 + 0));
    if ((int)t2 < 0) {
        return (int)t2;
    }
    t3 = fn_d7fd0((int)t2);
    loc_2 = t3;
    if (t3 != 0) {
        far_da72a(MK_FP(SEG_DATA, 0x715d), 0x6c2);
        if (UNDEF != 0) {
            far_b20fd();
        }
    } else {
        ax = far_da76f(MK_FP(SEG_DATA, 0x715d), 0x6c2);
    }
    far_ba2a4();
    return loc_2;
}
int far fn_d7fd0(int p0) { return 0; }
