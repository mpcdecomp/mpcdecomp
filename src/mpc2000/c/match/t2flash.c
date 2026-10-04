/* MPC2000 SYS text2: the ABOUT and FLASH MEMORY TEST windows
 * (../2k/common/sys/text2.asm). */

void __pascal disp_list_run(void far *list);
void __pascal win_keys_merge(void far *set);
void __pascal cmd_dispatch_1E(int x, int y, char far *s);
void __pascal cmd_dispatch_setup(int x, int y, int w);
void __far __pascal install_handler(int, void (__far *)(void));
void __far __pascal voice_trigger_full();
void field_redraw(void);

extern char P_03FC[1], P_03C8[1], SYS_BUILD_DATE[1], TBL_OFF_ON_LABELS[1][4];
extern char P_03C7, DL_REC_OUT_8PARA[1], DL_FLASH_MEMORY_TEST[1];
extern char STR_FLASH_TEST_STATUS[1];
extern int P_4EFE[4][2];

void __fastcall __loadds X_00AF2(void)
{
	win_keys_merge(P_03FC);
	disp_list_run(P_03C8);
	cmd_dispatch_1E(0, 0, SYS_BUILD_DATE);
}

void __fastcall __loadds L_00B1A(void)
{
	cmd_dispatch_1E(0xa9, 0x13, TBL_OFF_ON_LABELS[P_03C7]);
	field_redraw();
}

void __fastcall __loadds X_00B3E(void)
{
	win_keys_merge(P_03FC);
	install_handler(0x32, (void (far *)(void))L_00B1A);
	disp_list_run(P_03C8);
	disp_list_run(DL_REC_OUT_8PARA);
	voice_trigger_full(&P_03C7, 1, 0xa9, 0x13, 4, 0, 0);
}

/* Each of the four flash banks' two result words, a row apiece. */
void __fastcall __loadds cmd_dispatch_handler_1(void)
{
	int i, y;
	int __near *p;

	disp_list_run(P_03C8);
	disp_list_run(DL_FLASH_MEMORY_TEST);
	for (i = 0, p = (int __near *)P_4EFE, y = 10; i < 4; i++) {
		STR_FLASH_TEST_STATUS[0] = i + '0';
		cmd_dispatch_1E(1, y, STR_FLASH_TEST_STATUS);
		cmd_dispatch_setup(0x19, y, p[0]);
		cmd_dispatch_setup(0x43, y, p[1]);
		p += 2;
		y += 9;
	}
}
