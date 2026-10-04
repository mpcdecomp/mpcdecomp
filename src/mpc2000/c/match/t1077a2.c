#include "mpc2k.h"

struct s54 { char b[54]; };
extern char LCD_BLOCK_COPY_7700[1];

void __near lcd_block_copy(void)
{
	char l54[54];

	lcd_update_handler_70E2();
	((void (__near __pascal *)(char __far *))lcd_clear_display)(l54);
	((void (__far *)(void (__far *)(void)))callback_set_main)(sample_error_handler);
	X_00610();
	((void (__far *)(struct s54, void (__far *)(void)))ui_enter_sound_dialog)(*(struct s54 *)l54, lcd_block_copy_7700);
}
