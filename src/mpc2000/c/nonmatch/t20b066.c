/* differs: 150 size 116, image 88; +0 image `push bp` CL `enter 4, 0`; 172 size 116, image 88; +0 image `push bp` CL `enter 4, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define UNDEF 0
extern long __far __pascal x_aFlmul();
extern long __far __pascal x_aFuldiv();

void __far __pascal midi_out_io(int arg_2, unsigned int arg_0)
{
    int flags;
    long t1;
    long t2;

    flags = arg_2 - 1;
    if (CC("<u", flags)) {
        goto L1;
    }
    if (CC(">u", flags)) {
        goto L2;
    }
    if (arg_0 < 0x5888) {
        goto L1;
    }
L2:
    return;
L1:
    if (arg_2 != 0) {
        goto L3;
    }
    if (arg_0 > 0x5622) {
        goto L3;
    }
    return;
L3:
    t1 = x_aFlmul(0, 100, arg_2, arg_0);
    t2 = x_aFuldiv(0, -0x53bc, (int)(t1 + 0x5622L >> 16), (int)t1 + 0x5622);
    return;
}
