/* differs: 308 at +5, 595 bytes; 311 at +5, 593 bytes; 312 at +5, 594 bytes */
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_8181;
extern char B_8182;
extern char B_8183;
extern char B_8184;
extern char B_977D;
extern char B_977E;
extern char B_977F;
extern char B_D4AC;
extern char TBL_8E77[];
extern char TBL_9251[];
extern long far far_d9b6e(int, void far *, int);
extern int far far_dce14(void far *, int, int);

long far far_dcfb5(long arg_0, int arg_4, int arg_6, int arg_8)
{
    int loc_2;
    unsigned int ax;
    int ax2;
    int bx;
    int bx2;
    int cx;
    int cx2;
    int cx3;
    int di;
    int dx;
    int dx2;
    int es;
    int p12;
    int p14;
    int si;
    long t1;
    int t2;

    di = (int)arg_0;
    es = (int)(arg_0 >> 16);
    p12 = *(int far *)MK_FP(es, di);
    p14 = *(int far *)MK_FP(es, di + 2);
    ax = (unsigned char)*(char far *)MK_FP(es, di + 2);
    si = ax;
    bx = ((char)(bx2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, di + 1));
    *(char far *)MK_FP(es, di + 1) = (char)(*(char far *)MK_FP(es, di + 1) & 127);
    if (((char)bx & -128) == 0) {
        dx = ((char)(dx2 >> 8) << 8 | (unsigned char)TBL_9251[bx & 127]);
    } else {
        dx = ((char)(dx2 >> 8) << 8 | (unsigned char)TBL_8E77[bx & 127]);
    }
    cx = ((char)(cx2 >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, di));
    cx3 = ((char)(cx >> 8) << 8 | (unsigned char)((char)cx & -16));
    if ((unsigned char)(char)cx3 <= 144) {
        ax = (unsigned char)*(char far *)MK_FP(es, di + 3) * (unsigned char)(char)dx + 50;
        if (ax >= 0x3200) {
            *(char far *)MK_FP(es, di + 3) = (char)127;
        } else {
            dx = ((char)(dx >> 8) << 8 | (unsigned char)100);
            ax = ((char)(ax % (unsigned char)(char)dx) << 8 | (unsigned char)(char)(ax / (unsigned char)(char)dx));
            *(char far *)MK_FP(es, di + 3) = (char)ax;
        }
    }
    if (arg_8 == 0) {
        loc_2 = 4;
        if ((arg_6 & 64) != 0) {
            loc_2 = loc_2 | 1;
        }
    } else if (arg_8 == 1) {
        loc_2 = 3;
        if ((arg_6 & 64) != 0) {
            loc_2 = loc_2 | 4;
        }
    } else {
        loc_2 = 12;
        if ((arg_6 & 64) != 0) {
            loc_2 = loc_2 | 1;
        }
    }
    if ((loc_2 & 1) != 0 && ((loc_2 & 2) == 0 || B_8184 != 0)) {
        if (B_D4AC != 0 && (char)cx3 == -112) {
            ax = si;
            if ((char)ax == B_977F) {
                ax2 = ((char)(ax >> 8) << 8 | (unsigned char)*(char far *)MK_FP(es, di));
                ax = ((char)(ax2 >> 8) << 8 | (unsigned char)((char)ax2 & 3));
                if ((char)ax == B_977E) {
                    ax = ((char)(ax >> 8) << 8 | (unsigned char)B_977D);
                    *(char far *)MK_FP(es, di + 4) = (char)ax;
                }
            }
        }
        if (((char)cx3 != -64 || B_8182 != 0) && ((char)cx3 != -80 || si != 7 || B_8181 != 0)) {
            t1 = far_d9b6e(8, MK_FP(es, di), arg_4);
            es = UNDEF;
            ax = (int)t1;
            dx = (int)(t1 >> 16);
        }
    }
    if ((loc_2 & 4) != 0) {
        if ((loc_2 & 8) == 0 || B_8183 != 0) {
            t2 = far_dce14(MK_FP(es, di), arg_4, arg_6);
            es = UNDEF;
            ax = t2;
            dx = UNDEF;
        }
    }
    *(int far *)MK_FP(es, di + 2) = p14;
    *(int far *)MK_FP(es, di) = p12;
    return ((long)dx << 16 | (unsigned)ax);
}
