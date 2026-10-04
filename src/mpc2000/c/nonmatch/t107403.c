/* differs: 150 size 2, image 21; +0 image `pop ds` CL `retf`; 172 +0 image `pop ds` CL `retf` */
extern char SAMPLE_INPUT;
int __far L_00116(void);
void __near fn_06786(void);

void __far L_07383(void)
{
	return;
	if (L_00116()) goto br_07394;
	SAMPLE_INPUT = 0;
br_07394:
	fn_06786();
}
