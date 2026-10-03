/* differs: XL v1.20 +1, 146 bytes */
extern char far *C1_FP_00998;
extern char C1_W_00898[1];
extern int C1_W_08B04;
extern int C1_W_08B06;
extern int C1_W_08B08;
extern int C1_W_08B0A;
extern char EP_FAR_43C44_OFF[1];
extern char EP_FAR_43C44_SEG[1];
void __far disp_request_flush(void);
int __far far_37E82(void);
void __far handler_install_one(int, char __near *, char __near *);
void __far handler_set_install(char far *);

void __far far_43BA0(int p0, int p1, int p2)
{
	char far *l4;
	int si_;
	int cx_;

	C1_W_08B06 = p0;
	C1_W_08B08 = p1;
	C1_W_08B0A = p2;
	cx_ = 0;
	si_ = p1;
	((int *)&l4)[1] = p2;
loop_43BBF:
	if (!*(char far *)MK_FP(FP_SEG(l4), si_)) {
		si_ += 0x11;
		cx_++;
		if (cx_ <= 0xff) goto loop_43BBF;
	} else {
		C1_W_08B04 = cx_;
	}
	handler_set_install(C1_W_00898);
	if (far_37E82()) goto br_43BFD;
	handler_install_one(6, EP_FAR_43C44_OFF, EP_FAR_43C44_SEG);
br_43BFD:
	((int (__far *)(void))C1_FP_00998)();
	disp_request_flush();
}
