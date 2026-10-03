/* differs: 150 size 256, image 226; +18 image `cmp ax, word ptr [0x85ac]` CL `mov ax, word ptr [0x85ac]`; 172 size 256, image 226; +18 image `cmp ax, word ptr [0x87ec]` CL `mov ax, word ptr [0x87ec]` */
char * __cdecl strcat(char *, const char *);
char * __cdecl strcpy(char *, const char *);
#pragma intrinsic(strcat, strcpy)
extern long PTR_DMA_STATE;
extern char far *PTR_SAMPLE_DATA;
extern char SMEM_POOL[1];
extern char STR_EXT_SND[1];
long __far __fastcall int40_disk_wrapper(char __near *, char far *);
int __far __pascal sample_check_active(int, int);
long __far __pascal smem_block_skip(long);

void __far sample_addr_from_disk(void)
{
	char l26[26];

	*(long *)(l26 + 22) = *(long far *)(PTR_SAMPLE_DATA + 40);
	if (*(long *)(l26 + 22) == PTR_DMA_STATE) goto br_078AD;
loop_077F7:
	switch (sample_check_active(*(int *)(l26 + 24), *(int *)(l26 + 22))) { case 0: goto br_07885; }
	strcpy(l26, *(long *)(l26 + 22));
	strcat(l26, STR_EXT_SND);
	*(long *)(SMEM_POOL + *(int far *)(*(long *)(l26 + 22) + 48) * 10) = smem_block_skip(int40_disk_wrapper(l26, l26));
br_07885:
	*(long *)(l26 + 22) = *(long far *)(*(long *)(l26 + 22) + 40);
	if (*(long *)(l26 + 22) != PTR_DMA_STATE) goto loop_077F7;
br_078AD:
	;
}
