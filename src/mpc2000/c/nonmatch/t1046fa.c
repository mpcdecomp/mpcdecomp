/* differs: 150 size 10, image 12; +9 image `pop si` CL `ret`; 172 size 10, image 12; +9 image `pop si` CL `ret` */
extern char G_FLAG_1589;
void __far L_050DC(void);

void __near L_04674(void)
{
	L_050DC();
	G_FLAG_1589--;
}
