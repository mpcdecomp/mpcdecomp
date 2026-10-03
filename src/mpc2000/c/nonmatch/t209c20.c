/* differs: 150 size 32, image 34; +1F image `pop ds` CL `retf`; 172 size 32, image 34; +1F image `pop ds` CL `retf` */
extern char STR_PRESSING_DO_IT[1];
extern char STR_SELECTED_EDIT[1];
void __far __pascal cmd_dispatch_1E(int, int, char far *);
void __far field_redraw(void);

void __far br_0A00C(void)
{
	cmd_dispatch_1E(0x49, 0x1c, STR_PRESSING_DO_IT);
	cmd_dispatch_1E(0x49, 0x25, STR_SELECTED_EDIT);
	field_redraw();
}
