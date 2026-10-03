/* differs: 150 +2E image `pop ds` CL `retf`; 172 +2E image `pop ds` CL `retf` */
extern char DL_SAVING[1];
extern char P_8D44[1];
extern int W_5BAE;
extern int W_5BB0;
void __far __pascal disp_list_run(char far *);
int __near __pascal event_handler(char far *, int, int);
void __far int2F_dispatch_21(void);
void __far __pascal int43_wrapper(int);

void __far tgt_09FFA(void)
{
	disp_list_run(DL_SAVING);
	int2F_dispatch_21();
	if (event_handler(P_8D44, W_5BB0 << 0xf >> 0xf, W_5BAE)) goto X_0A028;
	int43_wrapper(5);
X_0A028:
	;
}
