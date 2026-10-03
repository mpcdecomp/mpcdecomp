/* differs: 150 size 112, image 182; +0 image `mov ax, word ptr [0x8d34]` CL `enter 4, 0`; 172 size 112, image 182; +0 image `mov ax, word ptr [0x8f74]` CL `enter 4, 0` */
extern long G_ZONE_END;
extern long G_ZONE_LEN;
extern long G_ZONE_START;
extern int G_ZONE_START_HI;
extern char far *SND_CURRENT;
extern int ZONE_END_HI;

int __far X_09BDE(void)
{
	if (*(long far *)(SND_CURRENT + 28) >= G_ZONE_END) goto X_09C06;
	G_ZONE_END = *(long far *)(SND_CURRENT + 28);
X_09C06:
	if (*(long far *)(SND_CURRENT + 28) >= G_ZONE_START) goto L_09C2A;
	G_ZONE_START = *(long far *)(SND_CURRENT + 28);
L_09C2A:
	G_ZONE_LEN = G_ZONE_END - G_ZONE_START;
	return (int)G_ZONE_LEN;
}
