/* differs: 308 at +0, 47 bytes; 311 at +0, 47 bytes; 312 at +0, 47 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern char B_713E;
extern int W_713C;
extern long near tgt_d6158();
extern void near tgt_d626d();
extern long near tgt_d628c();
extern void near tgt_d6494();

void near tgt_d612d(void)
{
    int ax;
    int bx;

    B_713E = (char)ax;
    if ((char)ax == -112) {
        bx = (int)(unsigned)tgt_d6158;
    } else if ((char)ax == -96) {
        bx = (int)(unsigned)tgt_d628c;
    } else if ((char)ax == -80) {
        bx = (int)(unsigned)tgt_d626d;
    } else if ((char)ax == -32) {
        bx = (int)(unsigned)tgt_d6494;
    }
    W_713C = bx;
    return;
}
long near tgt_d6158(void) { return 0; }
void near tgt_d626d(void) { }
long near tgt_d628c(void) { return 0; }
void near tgt_d6494(void) { }
