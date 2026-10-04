#include "mpc2k.h"

void __far __fastcall __loadds program_new(void)
{
    int ax;
    long t1;
    long t2;
    long t3;

    if (int4B_wrapper() != 0) {
        t1 = ((long (__far __pascal *)(unsigned char __far *))string_fill_stosb)((unsigned char far *)STR_CANT_CREATE_PLAYING);
        return;
    }
    t2 = ((long (__far __pascal *)(unsigned char __far *, int))_memcpy_2)((unsigned char far *)((unsigned char *)TBL_SOUND_NAMES), far_059BC());
    ((int (__far __pascal *)(unsigned char __far *))win_keys_merge)((unsigned char far *)TBL_WINKEYS_0292E);
    t3 = ((long (__near *)(void))copy_program_arm_field)();
    return;
}
