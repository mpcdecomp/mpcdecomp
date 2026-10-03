/* differs: 150 size 188, image 248; +0 image `push si` CL `enter 4, 0`; 172 size 188, image 248; +0 image `push si` CL `enter 4, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern unsigned char G_PAD_NOTE_BASE;
extern unsigned char G_VELOCITY_MAX[1];
extern char WIN_FIELD_BOX_W;
extern char VELO_PITCH_CURSOR;
extern long __far __pascal field_register_s8();
extern long __far __pascal status_read_6A_2();
extern long __far __pascal status_read_6A_3();
extern long __far __pascal timer_value_read_1();
extern long __near __pascal track_calc_offset2();

long __near velo_pitch_arm_field(void)
{
    int ax;
    int ax2;
    long t1;
    long t2;

    t1 = track_calc_offset2(G_PAD_NOTE_BASE);
    ax = ((char)((int)t1 >> 8) << 8 | (unsigned char)VELO_PITCH_CURSOR);
    if ((char)ax == 0) {
        goto L1;
    }
    ax2 = (char)ax - 1;
    if (ax2 == 0) {
        goto L2;
    }
    if (ax2 == 1) {
        goto L3;
    }
    if (ax2 == 2) {
        goto L4;
    }
    VELO_PITCH_CURSOR = (char)1;
    goto L2;
L1:
    t2 = timer_value_read_1((unsigned char far *)&G_PAD_NOTE_BASE, 55, 11, 0);
    WIN_FIELD_BOX_W = (char)-94;
    return t2;
L3:
    return field_register_s8((int)(t1 >> 16), (int)t1 + 28, -120, 120, 3, 205, 28, 0, 0, 0, 0);
L4:
    return status_read_6A_3((unsigned char far *)G_VELOCITY_MAX, 1, 127, 3, 205, 40, 0, 0, 0, 0);
L2:
    return status_read_6A_2((int)(t1 >> 16), (int)t1 + 13, -240, 240, 3, 97, 28, 0, 0, 0, 0);
}
