/* differs: XL v1.20; the oracle matches it, the check cannot place it: below its part's frame */
extern char C1_SEG[1];
extern char C2_B_08EBE;
extern char C2_B_08FCA;
extern char C2_B_098BC;
extern char C2_B_REC_CANCEL_REQ;
extern char EP_L_487FC_OFF[1];
void __far event_cb_set_main(char __near *, char __near *);
void __far far_49092(void);
int __far far_490A6(void);
void __far far_49266(void);
void __far far_49308(int);

void __far far_487C2(void)
{
	far_49092();
	switch (far_490A6()) { case 0: goto br_487FB; }
	far_49266();
	far_49308(0);
	C2_B_098BC = 0;
	C2_B_REC_CANCEL_REQ = 0;
	C2_B_08EBE = 0;
	C2_B_08FCA = 0;
	event_cb_set_main(EP_L_487FC_OFF, C1_SEG);
br_487FB:
	;
}
