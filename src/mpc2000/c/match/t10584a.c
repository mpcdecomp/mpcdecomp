extern char G_PAD_NOTE_BASE[1];
extern char PARAMS_CURSOR;
extern char PGM_SLOT[1];
extern char WIN_FIELD_BOX_W;
void __far __fastcall __loadds L_05D2A(void);
void __far L_05EEE(void);
void __far __fastcall __loadds L_05FC0(void);
void __far __fastcall __loadds L_0620E(void);
void __far __fastcall __loadds L_063DE(void);
void __far __fastcall __loadds L_06570(void);
void __far __fastcall __loadds T1_L_06702(void);
void __far __pascal install_handler_15(void (__far *)(void));
void __far __pascal seq_write_data();
void __far __pascal status_read_6A_2(char far *, int, int, int, int, int, long, long);
void __far __pascal status_read_6A_3();
void __far __pascal timer_value_read_1(char far *, int, int, int);
char far * __near __pascal track_calc_offset2(int);
void __far __pascal voice_trigger_full();

void __near timer_dma_sync(void)
{
	int si_;
	char far *v0;
	void (far *v1)(void);

	v0 = track_calc_offset2((unsigned char)G_PAD_NOTE_BASE[0]);
	switch (PARAMS_CURSOR) { case 0: goto X_0592C; case 1: goto X_0580A; case 2: goto L_05834_1; case 3: goto X_05852; case 4: goto X_0586E; case 5: goto X_05890; case 6: goto X_058B0; case 7: goto X_058D0; case 8: goto X_058FC; default: goto X_05802; }
X_05802:
	PARAMS_CURSOR = 0;
	goto X_0592C;
X_0580A:
	v1 = (void (far *)(void))L_05D2A;
	status_read_6A_3(v0 + 0xf, 0, 0x64, 3, 0x2c, 0x16, 0L, 0L);
	goto X_0591E;
L_05834_1:
	v1 = (void (far *)(void))L_05D2A;
	status_read_6A_3(v0 + 0x10, 0, 0x64, 3, 0x2c, 0x1f, 0L, 0L);
	goto X_0591E;
X_05852:
	v1 = (void (far *)(void))L_05D2A;
	voice_trigger_full(v0 + 0x11, 1, 0x2c, 0x28, 6, 0L);
	goto X_0591E;
X_0586E:
	v1 = (void (far *)(void))T1_L_06702;
	timer_value_read_1(G_PAD_NOTE_BASE, 0x4a, 2, 0);
	WIN_FIELD_BOX_W = 0xa6;
	goto X_0591E;
X_05890:
	v1 = (void (far *)(void))L_05FC0;
	status_read_6A_3(v0 + 0x12, 0, 0x64, 3, 0xa4, 0x19, 0L, 0L);
	goto X_0591E;
X_058B0:
	v1 = (void (far *)(void))L_05FC0;
	status_read_6A_3(v0 + 0x13, 0, 0xf, 2, 0xaa, 0x24, 0L, 0L);
	goto X_0591E;
X_058D0:
	v1 = (void (far *)(void))L_0620E;
	status_read_6A_2(v0 + 0xd, -0xf0, 0xf0, 3, 0xdc, 0xc, 0L, 0L);
	goto X_0591E;
X_058FC:
	v1 = (void (far *)(void))L_063DE;
	voice_trigger_full(v0 + 0xa, 2, 0xbe, 0x28, 9, 0L);
X_0591E:
	install_handler_15(v1);
	return;
X_0592C:
	seq_write_data(PGM_SLOT, 1, 0x1a, 2, L_05EEE, (void (far *)(void))L_06570);
	WIN_FIELD_BOX_W = 0xc;
}
