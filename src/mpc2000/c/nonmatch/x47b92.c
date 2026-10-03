/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C2_W_011F0[1];
extern char EP_L_3E59E_OFF[1];
extern char EP_L_3E59E_SEG[1];
extern char EP_L_5596A_OFF[1];
extern char EP_L_5596A_SEG[1];
void __far handler_set_install(char far *);
void __far ivt_set_vector(int, char __near *, char __near *);

void __far L_47B92(void)
{
	handler_set_install(C2_W_011F0);
	ivt_set_vector(0x41, EP_L_3E59E_OFF, EP_L_3E59E_SEG);
	ivt_set_vector(0x4c, EP_L_5596A_OFF, EP_L_5596A_SEG);
}
