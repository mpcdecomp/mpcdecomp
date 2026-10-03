/* differs: 150 +18 image `pop ds` CL `retf`; 172 +18 image `pop ds` CL `retf` */
extern char FP_SND_SECONDARY[1];
extern char G_PLAY_MODE;
void __far __pascal far_035F2(char far *, int, int, int, long);

void __far X_0A0A2(void)
{
	G_PLAY_MODE = 1;
	far_035F2(FP_SND_SECONDARY, 0, 0x79, 0x23, 0L);
}
