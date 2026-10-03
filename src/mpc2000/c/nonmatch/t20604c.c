/* differs: 150 +C image `pop ds` CL `retf`; 172 +C image `pop ds` CL `retf` */
void __far __pascal int44_wrapper(int);
void __far __fastcall __loadds pgm_params_enter(void);

void __far L_0642A(void)
{
	pgm_params_enter();
	int44_wrapper(1);
}
