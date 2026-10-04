extern char STR_FAIL[1];
extern char STR_OKAY[1];
extern char STR_TESTING_MEMORY[1];
extern int W_4EFC;
void __far __pascal cmd_dispatch_1E(int, char, char __far *);
void __far cmd_far_stub(void);
void __far __pascal draw_unsigned_value(int, int, unsigned long, int);

void __near __pascal mpc_mode_setup(long p0)
{
	if (W_4EFC < 0) goto L_023CC;
	cmd_dispatch_1E(7, 0x1c, STR_TESTING_MEMORY);
	if (!W_4EFC) {
		draw_unsigned_value(0x73, 0x1c, (unsigned long)p0 >> 12, 6);
		cmd_far_stub();
		return;
	}
	cmd_dispatch_1E(0x7f, 0x1c, W_4EFC == 2 ? STR_OKAY : STR_FAIL);
L_023CC:
	;
}
