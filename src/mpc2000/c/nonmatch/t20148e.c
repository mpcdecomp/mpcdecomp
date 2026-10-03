/* differs: 150 size 104, image 114; +4 image `push word ptr [bp + 8]` CL `push di`; 172 size 104, image 114; +4 image `push word ptr [bp + 8]` CL `push di` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern long __far __pascal flash_write_words();
extern void __far __pascal io_delay_wait();
extern void __far __pascal mem_op_wrapper_2();
extern void __far port_c0_read();
extern void __far __fastcall port_c0_write();

void __far __pascal io_delay_wait2(int arg_2, int arg_0)
{
    int loc_6;
    char loc_4[2];
    int loc_2;
    int ax;
    int ax2;
    int t1;
    int t2;
    int t3;
    int t4;

L1:
    mem_op_wrapper_2(arg_2, arg_0, loc_4);
    loc_2 = *(int far *)MK_FP(SEG_STACK, UNDEF);
    if ((*(char *)((char *)&loc_2 + 0) & -128) == 0) {
        goto L1;
    }
    io_delay_wait(arg_2, arg_0);
    port_c0_read();
    ax = ((char)(UNDEF >> 8) << 8 | (unsigned char)((char)UNDEF & -2));
    port_c0_write(((char)(ax >> 8) << 8 | (unsigned char)((char)ax | 2)));
    if ((*(char *)((char *)&loc_2 + 0) & 120) != 0) {
        goto L2;
    }
    return;
L2:
    if ((*(char *)((char *)&loc_2 + 0) & 32) == 0) {
        goto L3;
    }
    if ((*(char *)((char *)&loc_2 + 0) & 16) == 0) {
        goto L3;
    }
    loc_6 = 80;
    ax2 = (int)flash_write_words(arg_2, arg_0, (int far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)&loc_6), 1);
L3:
    return;
}
