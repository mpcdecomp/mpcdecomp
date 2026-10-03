/* differs: 150 size 16, image 19; +E image `pop ds` CL `retf`; 172 size 16, image 19; +E image `pop ds` CL `retf` */
extern char P_32FE[1];
void __far __pascal disp_list_run(char far *);
void __far __fastcall __loadds snd_edit_page_return(void);

void __far L_08A29(void)
{
	disp_list_run(P_32FE);
	snd_edit_page_return();
}
