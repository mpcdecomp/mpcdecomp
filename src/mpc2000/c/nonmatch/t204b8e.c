/* differs: 150 size 14, image 16; +D image `pop ds` CL `retf`; 172 size 14, image 16; +D image `pop ds` CL `retf` */
extern int FP_UI_RETURN_SCREEN;
extern int FP_UI_RETURN_SCREEN_SEG;
void __far __pascal ui_screen_enter_edit(int, int);

void __far L_04CDE(void)
{
	ui_screen_enter_edit(FP_UI_RETURN_SCREEN_SEG, FP_UI_RETURN_SCREEN);
}
