/* differs: 308 absent; 311 at +0, 211 bytes; 312 at +0, 211 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define SEG_DATA _DS
extern char B_D5DD;
extern long far far_b08f7(int);
extern int far far_b1ad0(int, int);
extern int far far_b1b05(void far *);
extern long far far_b3b9f(int);
extern long far far_b3d1d(int, int, int);
extern long far far_b6cd3(void far *);
extern long far far_b90dd(void);
extern long far far_cad00();
extern long far far_d5b6a(int);

void far fn_b628b(void)
{
    int ax;
    int ax2;
    int ax3;
    long t1;
    long t10;
    long t2;
    int t3;
    int t4;
    long t5;
    long t6;
    long t7;
    long t8;
    long t9;

    B_D5DD = (char)94;
    t1 = far_b6cd3(MK_FP(SEG_DATA, 0x28dc));
    far_b1ad0(1, 0);
    far_b1b05(MK_FP(SEG_DATA, 0x28f1));
    t2 = far_b90dd();
    far_b1b05(MK_FP(SEG_DATA, 0x29b3));
    if ((int)far_b08f7(1) == 120) {
        t3 = far_b1ad0(7, 0);
        t4 = far_b1b05(MK_FP(SEG_DATA, 0x29bf));
        t5 = far_d5b6a(0);
        t6 = far_cad00(0);
        t7 = far_cad00(11, 0, 5);
        if ((int)t7 != 0) {
            if ((int)t7 == -254 || (int)t7 == -252 || (int)t7 == -240) {
                t9 = far_b3d1d(0, 26, (int)t7);
            } else {
                t8 = far_b3b9f((int)t7);
            }
        }
        t10 = far_cad00(0);
    }
    return;
}
long far far_b6cd3(void far *p0) { return 0; }
