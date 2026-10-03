/* differs: 150 size 62, image 56; +E image `je +2A` CL `je +30`; 172 size 62, image 24; +6 image `nop` CL `mov ax, word ptr [0x9d14]` */
extern int G_ERRNO;
extern long PGM_CURRENT;
extern char PGM_SLOT;
extern char PGM_TABLE[1];
void __far err_msg_report(void);
void __far __fastcall __loadds pgm_assign_enter(void);

void __far __fastcall __loadds L_0619E(void)
{
	if (!PGM_CURRENT) goto X_0624C;
	if ((unsigned)*(int far *)((long *)PGM_TABLE)[PGM_SLOT] > 2) {
		pgm_assign_enter();
		return;
	}
X_0624C:
	G_ERRNO = 5;
	err_msg_report();
}
