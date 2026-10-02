/* differs: 308 at +0, 394 bytes; 311 at +0, 396 bytes; 312 at +0, 396 bytes */
#pragma option -k-
#define MK_FP(s, o) ((void far *)((void _seg *)(unsigned)(s) + (void near *)(o)))
#define FP_SEG(p) ((unsigned)(void _seg *)(void far *)(p))
#define FP_OFF(p) ((unsigned)(p))
#define SEG_DATA _DS
#define SEG_STACK _SS
#define UNDEF 0
extern unsigned char B_943C;
extern unsigned char B_943D;
extern unsigned char TBL_943B;
extern unsigned char W_9462;
extern int far far_fb14d(void);
extern int far far_fb18a(void);
extern int far fn_d6115(void);
extern int near fn_d64d7(void);

long interrupt far far_d6077(void)
{
    int ax;
    int ax2;
    int ax3;
    int dx;
    long t1;

    dx = (int)(far_fb14d() >> 16);
    *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9462) = 0;
    if ((inp(210) & 2) == 0) {
        *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9462) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9462) + 1;
        ax = (int)fn_d6115();
    }
    if ((inp(194) & 2) == 0) {
        *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9462) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9462) + 1;
        ax2 = fn_d64d7();
    }
    if ((inp(202) & 2) == 0) {
        *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9462) = *(int far *)MK_FP(-0x7ff0, (unsigned)&W_9462) + 1;
        ax3 = fn_d64d7();
    }
    _disable();
    *(char far *)MK_FP(-0x7ff0, (unsigned)&TBL_943B) = (char)(*(char far *)MK_FP(-0x7ff0, (unsigned)&TBL_943B) & -5);
    outp(198, *(char far *)MK_FP(-0x7ff0, (unsigned)&TBL_943B));
    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_943C) = (char)(*(char far *)MK_FP(-0x7ff0, (unsigned)&B_943C) & -5);
    outp(206, *(char far *)MK_FP(-0x7ff0, (unsigned)&B_943C));
    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_943D) = (char)(*(char far *)MK_FP(-0x7ff0, (unsigned)&B_943D) & -5);
    outp(214, *(char far *)MK_FP(-0x7ff0, (unsigned)&B_943D));
    outp(-0x3ff0, (char)101);
    outp(-0x3ff0, (char)-57);
    *(char far *)MK_FP(-0x7ff0, (unsigned)&TBL_943B) = (char)(*(char far *)MK_FP(-0x7ff0, (unsigned)&TBL_943B) | 4);
    outp(198, *(char far *)MK_FP(-0x7ff0, (unsigned)&TBL_943B));
    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_943C) = (char)(*(char far *)MK_FP(-0x7ff0, (unsigned)&B_943C) | 4);
    outp(206, *(char far *)MK_FP(-0x7ff0, (unsigned)&B_943C));
    *(char far *)MK_FP(-0x7ff0, (unsigned)&B_943D) = (char)(*(char far *)MK_FP(-0x7ff0, (unsigned)&B_943D) | 4);
    outp(214, *(char far *)MK_FP(-0x7ff0, (unsigned)&B_943D));
    t1 = far_fb18a();
    return 0L;
}
int far fn_d6115(void) { return 0; }
int near fn_d64d7(void) { return 0; }
