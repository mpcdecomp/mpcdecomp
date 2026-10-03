/* differs: 150 size 210, image 202; +1 image `enter 6, 0` CL `enter 4, 0`; 172 size 210, image 202; +1 image `enter 6, 0` CL `enter 4, 0` */
extern char G_EDIT_FIELD_VAL[1];
extern char LOOP_CURSOR;
extern long SND_CURRENT;
void __far __fastcall __loadds L_07C5E(void);
void __far L_09900(void);
void __far L_090D4(void);
void __far X_090B2(void);
void __far __pascal install_handler_15(long);
void __far __pascal sample_active_check_3(int, int, void (far *)(void));
int __far __pascal sample_check_active(long);
void __far __pascal ui_edit_position(int, int, void (far *)(void));
void __far __pascal voice_trigger_full(int, unsigned, char, int, int, int);

void __near string_byte_scan(void)
{
	char l1;
	int l4;
	int si_;

	if (SND_CURRENT) goto br_07A86;
	switch (LOOP_CURSOR) { case 1: goto br_07A86; }
	LOOP_CURSOR = 0;
br_07A86:
	if (LOOP_CURSOR) goto br_07A91;
	goto X_07B2E;
br_07A91:
	switch (LOOP_CURSOR) { case 1: goto br_t1_07AA6; case 2: goto br_07AAE; case 3: goto br_07AC0; case 4: goto br_07AD2; }
	LOOP_CURSOR = 0;
	goto X_07B2E;
br_t1_07AA6:
	L_090D4();
	return;
br_07AAE:
	ui_edit_position(0x14, 0xc, (void (far *)(void))L_07C5E);
	return;
br_07AC0:
	sample_active_check_3(0x7a, 0xc, (void (far *)(void))L_07C5E);
	return;
br_07AD2:
	install_handler_15(0L);
	switch (sample_check_active(SND_CURRENT)) { case 0: goto br_07AFE; }
	si_ = G_EDIT_FIELD_VAL;
	((char __near *)si_)[0] = 0;
	l1 = 0;
	goto br_07B11;
br_07AFE:
	l4 = ((int *)&SND_CURRENT)[1];
	l1 = 1;
br_07B11:
	voice_trigger_full(l4, FP_OFF(SND_CURRENT + 0x24), l1, 0xda, 0xc, 4, L_09900);
	return;
X_07B2E:
	X_090B2();
}
