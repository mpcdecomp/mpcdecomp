/* differs: XL v1.20 +53, 73 bytes */
extern char far *C0_W_0989A;
extern long C0_W_098BE;
extern long C0_W_098DC;
extern int C0_W_098DE;
extern long C0_W_0D7C2;
extern char PGM_ARRAY_DS[1];
void __far drum_program_select(int, int);
void __far far_3EEE6(void);
void __far far_3F906(void);
long __far far_to_dma_linear(char far *);
void __far pad_route_mode_set(int);
void __far pgm_init_default(int);

void __far pgm_memory_init(void)
{
	int si_;
	int di_;

	far_3EEE6();
	far_3F906();
	C0_W_0D7C2 = C0_W_098DC;
	C0_W_0989A = ((far_to_dma_linear(PGM_ARRAY_DS) + 0xfL & 0xfffffff0L) << 12) + 0x10L;
	si_ = 0;
	di_ = si_;
	goto br_3F04E;
loop_3F040:
	C0_W_0989A[si_ + 2] = 0;
	si_ += 0x99e;
	di_++;
br_3F04E:
	if (di_ <= 0x17) goto loop_3F040;
	pgm_init_default(0);
	si_ = 0;
loop_3F05F:
	drum_program_select(si_, 0);
	si_++;
	if (si_ <= 3) goto loop_3F05F;
	C0_W_098BE = 0L;
	pad_route_mode_set(0);
}
