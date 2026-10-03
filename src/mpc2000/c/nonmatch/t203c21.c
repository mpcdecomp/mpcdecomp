/* differs: 150 size 30, image 33; +1A image `pop si` CL `retf 4`; 172 size 30, image 33; +1A image `pop si` CL `retf 4` */
extern char G_PAD_BANK;
extern char P_10CC[1];
extern char TBL_WINKEYS_0100E[1];
void __far __pascal disp_list_run(char far *);
char __far pad_bank_get(void);
void __far __pascal win_keys_merge(char far *);

void __far __pascal L_03CD7(int x1, int x0)
{
	G_PAD_BANK = pad_bank_get();
	win_keys_merge(TBL_WINKEYS_0100E);
	disp_list_run(P_10CC);
}
