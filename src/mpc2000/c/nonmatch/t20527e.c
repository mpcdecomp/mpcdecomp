/* differs: 150 size 254, image 272; +19 image `mov si, ax` CL `mov word ptr [bp - 4], ax`; 172 size 254, image 5; +5 image `push di` CL `push si` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define UNDEF 0
extern unsigned char FXS_FIELD_14;
extern unsigned char FXS_FIELD_15;
extern unsigned char FXS_FIELD_40;
extern unsigned char FXS_FIELD_41;
extern unsigned char FXS_FIELD_42;
extern unsigned char FXS_FIELD_43;
extern unsigned char FXS_FIELD_44;
extern char G_STATE_9D8B;
extern unsigned char P_1C36[1];
extern long __far channel_validate();
extern void __far __pascal cmd_exec_1E();
extern int __far __pascal disp_list_run();
extern void __far __pascal draw_unsigned_value();
extern void __far field_redraw();

void __far __fastcall __loadds cmd_exec_7(void)
{
    int loc_2;
    int es;
    long t1;
    int t10;
    int t2;
    int t3;
    int t4;
    int t5;
    int t6;
    int t7;
    int t8;
    int t9;

    t1 = channel_validate(G_STATE_9D8B);
    loc_2 = (int)(t1 >> 16);
    t2 = disp_list_run((unsigned char far *)P_1C36);
    es = loc_2;
    draw_unsigned_value(169, 21, (unsigned long)(unsigned char)*(char far *)MK_FP(es, (unsigned)&FXS_FIELD_14 + (int)t1), 2);
    draw_unsigned_value(169, 31, (unsigned long)(unsigned char)*(char far *)MK_FP(es, (unsigned)&FXS_FIELD_40 + (int)t1), 2);
    draw_unsigned_value(169, 41, (unsigned long)(unsigned char)*(char far *)MK_FP(es, (unsigned)&FXS_FIELD_43 + (int)t1), 2);
    cmd_exec_1E(187, 21, *(char far *)MK_FP(es, (unsigned)&FXS_FIELD_15 + (int)t1));
    cmd_exec_1E(187, 31, *(char far *)MK_FP(es, (unsigned)&FXS_FIELD_41 + (int)t1));
    cmd_exec_1E(187, 41, *(char far *)MK_FP(es, (unsigned)&FXS_FIELD_44 + (int)t1));
    draw_unsigned_value(211, 31, (unsigned long)(unsigned char)*(char far *)MK_FP(es, (unsigned)&FXS_FIELD_42 + (int)t1), 2);
    field_redraw();
    return;
}
