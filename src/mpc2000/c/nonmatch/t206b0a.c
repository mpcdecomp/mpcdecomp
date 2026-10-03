/* differs: 150 size 148, image 146; +1E image `mov al, byte ptr es:[bx + di]` CL `mov cl, byte ptr es:[bx + di]`; 172 size 148, image 146; +1E image `mov al, byte ptr es:[bx + di]` CL `mov cl, byte ptr es:[bx + di]` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
struct g_PTR_TRACK_DATA {
    long f_0;
};
extern char B_8D42;
extern char B_8D43;
extern unsigned char G_PAD_BANK;
extern unsigned char G_PAD_INDEX;
extern char G_PAD_NOTE_BASE;
extern struct g_PTR_TRACK_DATA PTR_TRACK_DATA;
extern unsigned char TBL_WINKEYS_CHANNEL_SETTINGS[1];
extern unsigned char X_06F1E[1];
extern long __far timer_str_handler();
extern int __far __pascal win_keys_merge();

void __far __pascal sample_dispatch_table(int arg_0)
{
    int ax;
    int t1;
    long t2;

    ax = (unsigned char)*(char far *)((char far *)PTR_TRACK_DATA.f_0 + G_PAD_INDEX + (G_PAD_BANK << 4));
    B_8D42 = (char)arg_0;
    if ((unsigned int)(arg_0 - 1) > 5) {
        goto L1;
    }
    switch ((unsigned int)(unsigned)(X_06F1E + (arg_0 - 1) * 2)) {
    case 0:
        goto L2;
    case 1:
        goto L3;
    case 2:
        goto L4;
    case 3:
        goto L5;
    case 4:
        goto L6;
    case 5:
        goto L7;
    }
L2:
    B_8D43 = (char)1;
    goto L1;
L3:
    B_8D43 = (char)2;
    goto L1;
L4:
    B_8D43 = (char)5;
    goto L1;
L5:
    B_8D43 = (char)6;
    goto L1;
L6:
    B_8D43 = (char)3;
    goto L1;
L7:
    B_8D43 = (char)4;
L1:
    if ((unsigned int)((char)ax - 35) > 63) {
        goto L8;
    }
    G_PAD_NOTE_BASE = (char)ax;
    t1 = win_keys_merge((unsigned char far *)TBL_WINKEYS_CHANNEL_SETTINGS);
    t2 = timer_str_handler();
L8:
    return;
}
