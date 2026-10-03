/* differs: 150 size 14, image 15; +D image `pop ds` CL `retf`; 172 size 14, image 15; +D image `pop ds` CL `retf` */
void __far L_00026(void);
void __near fn_0761C(void);
void __far voice_release_all(void);

void __far X_06AA3(void)
{
	voice_release_all();
	L_00026();
	fn_0761C();
}
