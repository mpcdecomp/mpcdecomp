/* differs: 172 size 104, image 102; +3B image `or al, 0x80` CL `cwde` */
void __far sample_error_handler(void);
void __far L_0162A(void);
void __far L_02720(void);
void __far L_05760(void);
void __far X_00DF6(void);
void __far X_01AD4(void);
void __far X_020AE(void);
void __far X_0286A(void);
void __far X_02C66(void);
void __far callback_set_main(void (far *)(void));
void __far far_012F0(void);
void __far far_01D98(void);
void __far far_074EE(void);
char __far port_c0_read(void);
void __far __fastcall port_c0_write(int);
void __far __pascal program_select(int);
int __far __pascal program_select_wrapper(int);

void __far L_00404(void)
{
	L_0162A();
	X_0286A();
	port_c0_write(0);
	L_02720();
	far_012F0();
	X_020AE();
	X_02C66();
	L_05760();
	far_074EE();
	program_select_wrapper(0);
	port_c0_write(port_c0_read() | 0x80);
	far_01D98();
	program_select(0);
	X_01AD4();
	X_00DF6();
	callback_set_main(sample_error_handler);
}
