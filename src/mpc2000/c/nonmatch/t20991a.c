/* differs: 150 size 64, image 58; +1 image `mov ax, word ptr [0x85a8]` CL `mov ax, word ptr [0x8d36]`; 172 size 64, image 58; +1 image `mov ax, word ptr [0x87e8]` CL `mov ax, word ptr [0x8f76]` */
extern unsigned long G_ZONE_END;
extern long G_ZONE_LEN;
extern long G_ZONE_START;
extern int G_ZONE_START_HI;
extern int ZONE_END_HI;

int __far X_09D06(void)
{
	if (((int *)&G_ZONE_END)[1] > ((int *)&G_ZONE_START)[1]) goto X_09D29;
	if (((int *)&G_ZONE_END)[1] < ((int *)&G_ZONE_START)[1]) goto X_09D1B;
	if ((unsigned)*(int *)&G_ZONE_END >= (unsigned)*(int *)&G_ZONE_START) goto X_09D29;
X_09D1B:
	G_ZONE_START = G_ZONE_END;
X_09D29:
	G_ZONE_LEN = G_ZONE_END - G_ZONE_START;
	return (int)(G_ZONE_END - G_ZONE_START);
}
