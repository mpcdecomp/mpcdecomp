/* differs: XL v1.20; the oracle matches it, the check cannot place it: callee frame */
extern char EP_PGM_PARAMS_ENTER_OFF[1];
extern char EP_PGM_PARAMS_ENTER_SEG[1];
void __far __fastcall __loadds audition_stop(void);
void __far far_4DBAA(char __near *, char __near *);

void __far __fastcall __loadds L_4E34A(void)
{
	audition_stop();
	far_4DBAA(EP_PGM_PARAMS_ENTER_OFF, EP_PGM_PARAMS_ENTER_SEG);
}
