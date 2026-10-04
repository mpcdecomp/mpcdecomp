/* differs: 150 size 112, image 184; +1 image `enter 0x3c, 0` CL `enter 0x16, 0`; 172 size 112, image 184; +1 image `enter 0x3c, 0` CL `enter 0x16, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int __far dma_status_rearm();
extern int __far __pascal voice_start();
extern long __far __pascal x_aFldiv();

int __far midi_note_process(unsigned char arg_1, unsigned char arg_2, unsigned char arg_3)
{
    char loc_3c[4];
    char loc_38;
    char loc_37;
    char loc_36;
    char loc_35;
    char loc_34;
    char loc_33;
    char loc_32;
    char loc_31[3];
    int loc_2e;
    int loc_2c;
    int loc_2a;
    int loc_28;
    int loc_26;
    char loc_24[14];
    int loc_16;
    int loc_14;
    int loc_12;
    int loc_10;
    int loc_e;
    int loc_c;
    int loc_a;
    int loc_8;
    int loc_6;
    int loc_4;
    int loc_2;
    int ax;
    int ax2;
    int ax3;
    int si;
    unsigned int si2;
    int t1;

    ax = arg_2 * arg_3;
    si = ax * 2;
    if (si != 0) {
        goto L1;
    }
    goto L2;
L1:
    si2 = (int)x_aFldiv(0, -0x398f, si, 0);
    if (si2 <= 0x7fff) {
        goto L3;
    }
    si2 = 0x7fff;
L3:
    loc_2c = si2;
    loc_2a = si2;
    loc_26 = 0x2280;
    *(int *)((char *)&loc_24 + 0) = 1;
    loc_2e = 0x1000;
    loc_16 = -1;
    loc_14 = 0x3fff;
    loc_12 = 0x7ff0;
    loc_e = 0x7ff0;
    loc_10 = 0;
    loc_c = 0;
    loc_38 = (char)0;
    loc_31[0] = (char)0;
    loc_37 = (char)0;
    loc_36 = (char)0;
    loc_a = 10;
    loc_8 = 0;
    loc_6 = 0;
    loc_28 = -0x100;
    loc_4 = 0;
    loc_2 = 0;
    if (arg_1 != 0) {
        goto L4;
    }
    loc_33 = (char)0;
    ax2 = 128;
    goto L5;
L4:
    ax3 = arg_1;
    loc_33 = (char)ax3;
    loc_32 = (char)127;
    ax2 = ((char)(ax3 >> 8) << 8 | (unsigned char)0);
L5:
    loc_34 = (char)ax2;
    loc_35 = (char)ax2;
    loc_3c[0] = (char)-1;
    t1 = voice_start((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)loc_3c), 100, 0, 0);
    ax = dma_status_rearm();
L2:
    return ax;
}
