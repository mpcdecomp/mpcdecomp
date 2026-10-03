/* differs: 150 +1B image `push 0` CL `push 0x18a2`; 172 matches */
#if FW_VERSION == 150
extern char G_SAMPLE_MODE;
void __far tgt_07326(void);
void __far callback_set_main(void (far *)(void));
void __near dma_06CFC(void);
void __near dma_06E9A(void);
void __near fn_06ECE(void);

void __near fn_0704C(void)
{
	callback_set_main(0L);
	fn_06ECE();
	G_SAMPLE_MODE = 2;
	dma_06CFC();
	dma_06E9A();
	callback_set_main(tgt_07326);
}
#else
extern char G_SAMPLE_MODE;
extern char tgt_07326[1];
void __far tgt_07326(void);
void __far callback_set_main(void (far *)(void));
void __near dma_06CFC(void);
void __near dma_06E9A(void);
void __near fn_06ECE(void);

void __near fn_0704C(void)
{
	callback_set_main(0L);
	fn_06ECE();
	G_SAMPLE_MODE = 2;
	dma_06CFC();
	dma_06E9A();
	callback_set_main(tgt_07326);
}
#endif
