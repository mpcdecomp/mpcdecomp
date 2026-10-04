/* differs: 172 size 10, image 12; +9 image `pop ds` CL `retf` */
extern char STR_NO_WAVE_RAM[1];
void __far __pascal string_fill_stosb(char far *);

void __far L_02448(void)
{
	string_fill_stosb(STR_NO_WAVE_RAM);
}
