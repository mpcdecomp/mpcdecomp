/* differs: 150 size 180, image 92; +0 image `push di` CL `enter 0x74, 0`; 172 size 180, image 168; +0 image `push di` CL `enter 0x74, 0` */
#define MK_FP(s, o) ((void __far *)(((_segment)(s)) :> ((char __based(void) *)(o))))
#define FP_SEG(p) ((unsigned)((unsigned long)(void __far *)(p) >> 16))
#define FP_OFF(p) ((unsigned)(unsigned long)(void __far *)(p))
#define SEG_DATA ((unsigned)__segname("_DATA"))
#define SEG_STACK ((unsigned)__segname("_STACK"))
#define UNDEF 0
extern int SDS_LOOP_LEN;
extern int SDS_LOOP_LEN_HI;
extern int W_8D24;
extern int W_8D26;
extern void __far L_0B5DC();
extern void __far __fastcall __loadds L_0D272();
extern void __far X_00610();
extern long __far addr_calc_segment();
extern void __far __fastcall __loadds far_0AD74();
extern long __far __pascal install_handler();
extern int __far __pascal timer_fdc_sync();
extern void __far ui_enter_sound_dialog();

void __near fn_0B53E(void)
{
	char stk_3e[62];
	int ax;
	int p14;
	int p16;
	int p18;
	int p20;
	int p22;
	int p24;
	int p26;
	int p28;
	int p30;
	int p32;
	int p34;
	int p36;
	int p38;
	int p40;
	int p42;
	int p44;
	int p46;
	int p48;
	int p50;
	int p52;
	int p54;
	int p56;
	int p58;
	int p60;
	int p62;
	int t1;
	char far *t2;
	int t3;
	long t4;
	int t5;

	far_0AD74();
	t2 = addr_calc_segment(SDS_LOOP_LEN, SDS_LOOP_LEN_HI, 0);
	W_8D24 = (int)FP_OFF(t2);
	W_8D26 = (int)FP_SEG(t2);
	timer_fdc_sync(MK_FP(SEG_DATA, -0x754e));
	X_00610();
	t4 = install_handler(52, MK_FP(0x0b50 /* TEXT2_SEG */, (unsigned int)(unsigned)L_0D272));
	__movs2((char far *)MK_FP(SEG_STACK, (unsigned int)(unsigned)stk_3e), MK_FP(SEG_DATA, -0x754e), 54);
	ui_enter_sound_dialog(p62, p60, p58, p56, p54, p52, p50, p48, p46, p44, p42, p40, p38, p36, p34, p32, p30, p28, p26, p24, p22, p20, p18, p16, MK_FP(0x0000, p14), L_0D272, MK_FP(0x0000 /* TEXT1_SEG */, (unsigned int)(unsigned)L_0B5DC));
	return;
}
