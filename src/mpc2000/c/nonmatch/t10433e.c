/* differs: 150 size 10, image 12; +9 image `pop si` CL `ret`; 172 size 10, image 12; +9 image `pop si` CL `ret` */
extern char G_FLAG_1589;
void __far X_04E24(void);

void __near X_042B8(void)
{
	X_04E24();
	G_FLAG_1589--;
}
