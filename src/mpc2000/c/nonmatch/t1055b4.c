/* differs: 150 size 40, image 38; +9 image `and ax, 0x33` CL `and al, 0xc`; 172 size 40, image 38; +9 image `and ax, 0x33` CL `and al, 0xc` */
extern char G_PAD_INDEX;
void __near L_054DC(void);

void __far __fastcall __loadds L_05534(void)
{
	if ((G_PAD_INDEX & 0xc) >= 0xc) goto L_05558;
	G_PAD_INDEX = (char)(G_PAD_INDEX & 0xc) + (char)(G_PAD_INDEX & 0x33) + 4;
	L_054DC();
L_05558:
	;
}
