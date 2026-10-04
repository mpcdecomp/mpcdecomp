#include "mpc2krec.h"

extern char P_8CF2[54];
extern long SDS_LOOP_LEN;
extern long W_8D24;
long __far addr_calc_segment(long, int);
void __far __fastcall __loadds far_0AD74(void);
void __far L_0B5DC(void);
void __far ui_enter_sound_dialog(struct SND, void (__far *)(void));
void __far __pascal install_handler(int, void (__far *)(void));
void __far X_00610(void);
int __far __pascal timer_fdc_sync(char __far *);
void __far __fastcall __loadds L_0D272(void);
#if FW_VERSION == 172
extern char B_8CED[1];
struct SND __far * __far __pascal sample_pool_add(struct SND);
void __near midi_txrx_arm_field(void);
#endif

void __near fn_0B53E(void)
{
#if FW_VERSION == 172
	if (B_8CED[0]) {
#endif
		far_0AD74();
		W_8D24 = addr_calc_segment(SDS_LOOP_LEN, 0);
		timer_fdc_sync(P_8CF2);
		X_00610();
		install_handler(WIN_K_REFRESH, (void (__far *)(void))L_0D272);
		ui_enter_sound_dialog(*(struct SND *)P_8CF2, L_0B5DC);
#if FW_VERSION == 172
	} else {
		W_8D24 = addr_calc_segment(SDS_LOOP_LEN, 0);
		timer_fdc_sync(P_8CF2);
		sample_pool_add(*(struct SND *)P_8CF2);
		midi_txrx_arm_field();
	}
#endif
}
