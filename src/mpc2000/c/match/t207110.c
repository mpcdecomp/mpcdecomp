struct ent { char __far *p; char rest[0x32]; };
extern char __far *PTR_SAMPLE_BUF;
extern char P_6C7A[40];
extern struct ent TBL_6CA2[128];
extern char P_877A[40];
extern char P_87B0[54];
struct snd { char pad[0x28]; struct snd __far *next; struct snd __far *prev; };
extern struct snd __far *PTR_SAMPLE_DATA;
extern struct snd __far *PTR_DMA_STATE;

void __far far_074EE(void)
{
	int i;

	PTR_SAMPLE_BUF = P_6C7A;
	for (i = 0; i < 0x7f; i++)
		TBL_6CA2[i].p = (char __far *)&TBL_6CA2[i] + 0xe;
	TBL_6CA2[i].p = 0;
	PTR_SAMPLE_DATA = (struct snd __far *)P_877A;
	PTR_SAMPLE_DATA->next = PTR_DMA_STATE = (struct snd __far *)P_87B0;
	PTR_SAMPLE_DATA->prev = 0;
	PTR_DMA_STATE->next = 0;
	PTR_DMA_STATE->prev = PTR_SAMPLE_DATA;
}
