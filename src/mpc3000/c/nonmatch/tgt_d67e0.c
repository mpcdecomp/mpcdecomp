/* differs: 308 at +0, 122 bytes; 311 at +0, 122 bytes; 312 at +0, 122 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_9447;
extern int TBL_7144[];
extern char TBL_714A[];
extern char TBL_7150[];
extern long near br_d662d(void);
extern void near fn_d693e(void);
extern long near tgt_d651f();
long near br_d662d(void) { return 0; }
long near tgt_d651f(void) { return 0; }

long near tgt_d67e0(void)
{
    int ax;
    int bx;
    int bx2;
    int bx3;
    int dx;
    char near *si;
    int t1;

    TBL_7150[(unsigned int)(unsigned)si] = (char)(TBL_7150[(unsigned int)(unsigned)si] + 2);
    bx = ((char)(bx2 >> 8) << 8 | (unsigned char)TBL_7150[(unsigned int)(unsigned)si]);
    if ((unsigned char)(char)bx < 6) {
        si[(unsigned char)(char)bx + 27110] = (char)ax;
        bx3 = (int)(unsigned)tgt_d67e0;
        goto L1;
    }
    if (TBL_714A[(unsigned int)(unsigned)si] != 127) {
        if (TBL_714A[(unsigned int)(unsigned)si] == 126) {
            if (B_9447 == 0) {
                if ((char)ax != 4) {
L2:
L3:
                    TBL_7150[(unsigned int)(unsigned)si] = (char)0;
                    fn_d693e();
                    return br_d662d();
                }
L4:
                TBL_7150[(unsigned int)(unsigned)si] = (char)0;
                bx3 = (int)(unsigned)tgt_d651f;
L1:
                TBL_7144[(unsigned int)(unsigned)si] = bx3;
                return;
            }
            goto L3;
        }
        goto L2;
    }
    goto L4;
}
