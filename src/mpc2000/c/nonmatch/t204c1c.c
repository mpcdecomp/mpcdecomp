/* differs: 150 size 6, image 18; +6 image `lcall 0, 0x4254` CL `retf`; 172 size 6, image 18; +6 image `lcall 0, 0x41ce` CL `retf` */
void __far __fastcall __loadds X_04058(void);
void __far __fastcall __loadds X_041CE(void);
void __far __fastcall __loadds X_04352(void);

void __far X_04D6C(void)
{
	X_04058();
	return;
	X_041CE();
	return;
	X_04352();
}
