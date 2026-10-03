/* differs: 150 size 24, image 32; +0 image `push word ptr [0x9a6e]` CL `push ds`; 172 size 24, image 32; +0 image `push word ptr [0x9cb0]` CL `push ds` */
extern char P_31EB[1];
extern char SND_CURRENT[1];
void __far __pascal disp_list_run(char far *);
void __far __fastcall __loadds snd_edit_page_return(void);
void __far __pascal voice_buffer_init(long);

void __far X_088D2(void)
{
	voice_buffer_init(SND_CURRENT);
	disp_list_run(P_31EB);
	snd_edit_page_return();
}
