/* differs: 150 size 40, image 38; +9 image `and ax, 0x3c` CL `and al, 3`; 172 size 40, image 38; +9 image `and ax, 0x3c` CL `and al, 3` */
extern char G_PAD_INDEX;
void __near L_054DC(void);

void __far __fastcall __loadds L_055A2(void)
{
	if ((G_PAD_INDEX & 3) >= 3) goto br_055C5;
	G_PAD_INDEX = (char)(G_PAD_INDEX & 3) + (char)(G_PAD_INDEX & 0x3c) + 1;
	L_054DC();
br_055C5:
	;
}
