/* differs: 150 +9E image `add al, 0x41` CL `cwde`; 172 +9E image `add al, 0x41` CL `cwde` */
extern char DL_SOFTKEYS_MIDI_DUMP[1];
extern char far *PTR_LCD_STATE;
extern char P_4280[1];
extern char P_42E6[1];
extern char SDS_EXCL_CH;
extern unsigned char SDS_REQUEST_NUM;
extern char SDS_RX_PORT;
extern char SDS_STATE;
extern char SDS_STEREO_SIDE;
extern char SDS_TX_PORT;
extern char STR_EXCLUSIVE_CH[1];
extern char STR_NO_SOUND[1];
extern char STR_RECEIVE_READY[1];
extern char STR_RECEIVING[1];
extern char STR_REQUEST_NO[1];
extern char STR_SENDING[1];
extern char STR_SND_5[1];
extern char STR_THIS_PAGE_OPEN[1];
void __far __pascal cmd_build_dispatch(int, int, int, int);
void __far __pascal cmd_dispatch_1E(int, int, char far *);
void __far __pascal cmd_ratio_setup(int, int, int);
void __far __pascal disp_list_run(char far *);
void __far __pascal draw_unsigned_value(int, int, unsigned long, int);
void __far field_redraw(void);

void __far __fastcall __loadds data_far_write(void)
{
	char l4[4];

	disp_list_run(P_4280);
	cmd_build_dispatch(0, 0, 0x7b, 0x31);
	cmd_build_dispatch(0x7d, 0, 0x7a, 0x31);
	cmd_dispatch_1E(3, 0xf, STR_RECEIVE_READY);
	cmd_dispatch_1E(3, 0x18, STR_THIS_PAGE_OPEN);
	cmd_dispatch_1E(3, 0x25, STR_REQUEST_NO);
	cmd_dispatch_1E(0x80, 0xe, STR_SND_5);
	cmd_dispatch_1E(0x80, 0x25, STR_EXCLUSIVE_CH);
	draw_unsigned_value(0x69, 2, (long)(SDS_RX_PORT + 1), 1);
	draw_unsigned_value(0x4b, 0x25, (unsigned long)SDS_REQUEST_NUM, 3);
	cmd_ratio_setup(0xe6, 2, SDS_TX_PORT + 0x41);
	if (!PTR_LCD_STATE) goto br_0D1EE;
	cmd_dispatch_1E(0x80, 0x17, PTR_LCD_STATE);
	if (!PTR_LCD_STATE[19]) goto br_0D1FC;
	l4[0] = 0x3a;
	l4[1] = 0x4c;
	l4[2] = 0;
	if (!SDS_STEREO_SIDE) goto br_0D1E1;
	l4[1] = 0x52;
br_0D1E1:
	cmd_dispatch_1E(0xe0, 0x17, l4);
	goto br_0D1FC;
br_0D1EE:
	cmd_dispatch_1E(0x80, 0x17, STR_NO_SOUND);
br_0D1FC:
	draw_unsigned_value(0xce, 0x25, (unsigned long)SDS_EXCL_CH, 3);
	field_redraw();
	if (SDS_STATE & 3) goto br_0D234;
	if (!(SDS_STATE & 4)) goto br_0D22E;
	cmd_dispatch_1E(1, 0x34, STR_RECEIVING);
	disp_list_run(P_42E6);
	return;
br_0D22E:
	disp_list_run(DL_SOFTKEYS_MIDI_DUMP);
	return;
br_0D234:
	cmd_dispatch_1E(1, 0x34, STR_SENDING);
	disp_list_run(P_42E6);
}
