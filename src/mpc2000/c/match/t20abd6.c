struct s7 { char b[7]; };
struct s19 { char b[19]; };
struct s64 { char b[64]; };
extern struct s7 PGM_SLOT;
extern struct s19 B_9D77;
extern char P_9DA0[386];
extern struct s64 P_8F78;
void __far __pascal lcd_region_helper(char __far *, char __far *);
#if FW_VERSION == 172
extern char P_9D89[2];
void __far __pascal cmd_exec_1E_ext(int);
#endif

void __far __pascal lcd_cmd_wrapper(char __far *p)
{
	int i;

	PGM_SLOT = *(struct s7 __far *)(p + 0x16);
	B_9D77 = *(struct s19 __far *)(p + 0x15d);
	for (i = 0; i < 0x40; i++)
		lcd_region_helper(P_9DA0 + i * 6, p + 0x1d + i * 4);
	P_8F78 = *(struct s64 __far *)(p + 0x11d);
#if FW_VERSION == 172
	cmd_exec_1E_ext(P_9D89[0]);
#endif
}
