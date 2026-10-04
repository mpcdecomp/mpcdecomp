#if FW_VERSION == 150
extern char P_03FC[1];
extern char TBL_WINKEYS_00562[1];
extern int W_4EFC;
void __far X_025D8(void);
void __far cmd_far_stub(void);
void __far __fastcall __loadds system_setup_2(void);
void __far __pascal win_keys_merge(char far *);

void __far __fastcall __loadds L_00DA6(void)
{
	win_keys_merge(P_03FC);
	win_keys_merge(TBL_WINKEYS_00562);
	W_4EFC = -1;
	system_setup_2();
	cmd_far_stub();
	X_025D8();
}
#else
extern char P_03C8[1];
extern char P_03FC[1];
extern char P_0572[1];
extern char TBL_WINKEYS_00562[1];
extern int W_4EFC;
void __far L_005B4(void);
void __far L_02720(void);
void __far cmd_far_stub(void);
void __far __pascal disp_list_run(char far *);
void __far __pascal win_keys_merge(char far *);

void __far __fastcall __loadds L_00DA6(void)
{
	disp_list_run(P_03C8);
	disp_list_run(P_0572);
	win_keys_merge(P_03FC);
	win_keys_merge(TBL_WINKEYS_00562);
	W_4EFC = -1;
	cmd_far_stub();
	L_02720();
	L_005B4();
}
#endif
