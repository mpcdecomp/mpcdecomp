/* differs: 150 size 38, image 34; +9 image `and ax, 0x3c` CL `and al, 3`; 172 size 38, image 34; +9 image `and ax, 0x3c` CL `and al, 3` */
extern unsigned char G_PAD_INDEX;
void __near L_054DC(void);

void __far __fastcall __loadds X_05580(void)
{
	if ((G_PAD_INDEX & 3) <= 0) goto L_055A0;
	G_PAD_INDEX = (char)(G_PAD_INDEX & 3) + (char)(G_PAD_INDEX & 0x3c) - 1;
	L_054DC();
L_055A0:
	;
}
