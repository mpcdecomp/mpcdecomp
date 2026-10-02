/* differs: 308 at +7, 188 bytes; 311 at +7, 188 bytes; 312 at +7, 188 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
struct g_TBL_A3E7 {
    int f_0;
};
struct g_TBL_A267 {
    int f_0;
};
extern char B_817F;
extern char B_8180;
extern unsigned char B_8809;
extern char B_880B;
extern char B_8A9B;
extern char B_956B;
extern char B_A5C1;
extern char TBL_956E[];
extern char TBL_9FE7[];
extern struct g_TBL_A267 TBL_A267;
extern char TBL_A367[];
extern struct g_TBL_A3E7 TBL_A3E7;
extern char TBL_A4E7[];
extern int far far_daabc(int);
extern int far far_dd9ba(long, int);

void far far_dd4d8(void)
{
    char loc_a[10];
    int ax;
    int ax2;
    int bx;
    int cx;
    int cx2;
    int dx;
    int dx2;
    int es;
    int p16;
    int p18;
    int p20;
    int si;
    int t1;
    int t2;

    *(int *)((char *)&loc_a + 8) = 0;
    si = 0;
    do {
        if (TBL_956E[*(int *)((char *)&loc_a + 8)] != 0) {
            ax2 = B_956B;
            dx2 = ax2;
            if (ax2 == 0) {
                dx2 = 64;
            }
            if (B_817F != 0) {
                dx2 = B_8180;
            }
            if (B_A5C1 >= 8) {
                bx = *(int *)((char *)&loc_a + 8);
                TBL_9FE7[bx] = (char)0;
                TBL_A4E7[bx] = (char)dx2;
                *(int *)((char *)&TBL_A3E7 + 0 + si) = 0;
                TBL_A367[bx] = (char)64;
                cx2 = B_8809 - 4;
                if (cx2 <= 1) {
                    cx2 = 1;
                }
                *(int *)((char *)&TBL_A267 + 0 + si) = cx2;
                B_880B = (char)1;
            }
            loc_a[0] = (char)-104;
            loc_a[1] = B_8A9B;
            loc_a[2] = loc_a[8];
            loc_a[3] = (char)dx2;
            loc_a[4] = (char)64;
            t1 = far_daabc(B_8809 - 4);
            *(int *)((char *)&loc_a + 5) = t1;
            p16 = 7;
            p18 = SEG_STACK;
            p20 = (int)(unsigned)loc_a;
            t2 = far_dd9ba(((long)p18 << 16 | (unsigned)p20), p16);
            cx = UNDEF;
            es = UNDEF;
            ax = t2;
            dx = UNDEF;
        }
        si = si + 2;
        *(int *)((char *)&loc_a + 8) = *(int *)((char *)&loc_a + 8) + 1;
    } while (si != 0x100);
    return;
}
