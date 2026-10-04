extern unsigned char DL_SOUND_MEMORY[52];
extern unsigned char P_300E[0x24];
extern long SMEM_SIZE;
long __far X_00E76(void);
int __near fn_0683A(void);
void __far __pascal disp_list_run(void __far *);
void __far __pascal timer_value_read_5(int, int, int);
void __far __pascal draw_unsigned_value(int, int, unsigned long, int);
void __far __pascal cmd_dispatch_0E(int, int, int);
void __far __pascal cmd_track_setup(int, int, int);

/* SOUND MEMORY: the size in MB and the used part as a 200-pixel bar */
void __far __fastcall __loadds math_calc_handler(void)
{
	long free;
	int w;

	disp_list_run(DL_SOUND_MEMORY);
	timer_value_read_5(0x9d, 0xc, fn_0683A());
	draw_unsigned_value(0x43, 0x28, SMEM_SIZE / 0x80000L, 2);
	free = SMEM_SIZE - 0x12280L;
	if ((w = (int)((free - X_00E76()) * 200 / free)) != 0) {
		P_300E[3] = P_300E[0xb] = P_300E[0x13] = P_300E[0x1b] = w;
		P_300E[7] = P_300E[0xf] = P_300E[0x17] = P_300E[0x1f] = w - 1;
		disp_list_run(P_300E);
	}
	if (w < 200) {
		cmd_dispatch_0E(w + 0x17, 0x1a, 8);
		cmd_track_setup(w + 0x17, 0x1a, 200 - w);
	}
}
