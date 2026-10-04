struct id { int maker, device; };
extern char P_03FC[40];
extern unsigned char TBL_WINKEYS_004F8[15];
extern int W_4EFC;
extern struct id P_4EFE[4];
void __far far_012F0(void);
struct id __far __pascal flash_read_identifier(unsigned long);
void __far __pascal win_keys_merge(void __far *);

void __far __fastcall __loadds disk_media_check(void)
{
	int i;

	win_keys_merge(P_03FC);
	win_keys_merge(TBL_WINKEYS_004F8);
	far_012F0();
	for (i = 0; i < 4; i++)
		P_4EFE[i] = flash_read_identifier((unsigned long)(i + 16) << 20);
	far_012F0();
	for (i = 0; i < 4; i++)
		if (P_4EFE[i].maker != 0x89 || P_4EFE[i].device != 0x66a0) {
			W_4EFC = 0;
			return;
		}
	W_4EFC = 1;
}
