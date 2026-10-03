extern char EP_PGM_PARAMS_ENTER_OFF[1];
extern char EP_PGM_PARAMS_ENTER_SEG[1];
void __far __fastcall __loadds audition_stop(void);
void __far far_50972(char __near *, char __near *);

void __far __fastcall __loadds tgt_4E98A(void)
{
	audition_stop();
	far_50972(EP_PGM_PARAMS_ENTER_OFF, EP_PGM_PARAMS_ENTER_SEG);
}
