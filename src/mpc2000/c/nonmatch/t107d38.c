/* differs: 150 size 16, image 32; +10 image `push 0x7a` CL `ret`; 172 size 16, image 32; +10 image `push 0x7a` CL `ret` */
void __far __fastcall __loadds L_07DF4(void);
void __far __fastcall __loadds L_07E7C(void);
void __far __pascal ui_edit_zone_end(int, int, void (far *)(void));
void __far __pascal ui_edit_zone_start(int, int, void (far *)(void));

void __near T1_br_07CB8(void)
{
	ui_edit_zone_start(0x1a, 0xc, (void (far *)(void))L_07DF4);
	return;
	ui_edit_zone_end(0x7a, 0xc, (void (far *)(void))L_07E7C);
}
