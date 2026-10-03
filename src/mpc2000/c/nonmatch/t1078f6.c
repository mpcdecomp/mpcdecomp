/* differs: 150 size 6, image 38; +6 image `push 0x1a` CL `ret`; 172 size 6, image 38; +6 image `push 0x1a` CL `ret` */
void __far __fastcall __loadds L_079CA(void);
void __far __fastcall __loadds L_07A58(void);
void __far L_090D4(void);
void __far __pascal sample_active_check_1(int, int, void (far *)(void));
void __far __pascal sample_active_check_2(int, int, void (far *)(void));

void __near X_07876(void)
{
	L_090D4();
	return;
	sample_active_check_1(0x1a, 0xc, (void (far *)(void))L_079CA);
	return;
	sample_active_check_2(0x7a, 0xc, (void (far *)(void))L_07A58);
}
