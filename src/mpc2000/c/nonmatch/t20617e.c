/* differs: 150 +22 image `pop ds` CL `retf`; 172 +22 image `pop ds` CL `retf` */
extern char PGM_SLOT[1];
extern char TBL_WINKEYS_DELETE_PGM[1];
void __far X_064CC(void);
void __far __pascal seq_write_data(char far *, int, int, int, void (far *)(void), long);
void __far __pascal win_keys_merge(char far *);

void __far X_0655C(void)
{
	win_keys_merge(TBL_WINKEYS_DELETE_PGM);
	seq_write_data(PGM_SLOT, 1, 0x61, 0x11, X_064CC, 0L);
}
