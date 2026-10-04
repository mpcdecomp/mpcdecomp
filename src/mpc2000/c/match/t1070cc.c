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
