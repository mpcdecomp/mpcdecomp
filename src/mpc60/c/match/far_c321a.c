extern char B_8CCB;
extern char B_9D36;
extern char B_B23E;
extern char B_B23F;
extern char B_B240;
extern char B_B241;
extern char B_B242;
extern char B_B243;
extern char B_B244;
extern char B_B245;
extern char TBL_95B0[];
extern char TBL_9614[];
extern char TBL_9678[];
extern int W_B246;

far_c321a()
{
	far_d656b();
	TBL_9678[B_9D36] = W_B246;
	TBL_95B0[B_9D36] = far_c35da(B_B240, B_B23E);
	TBL_9614[B_9D36] = far_c35da(B_B241, B_B23F);
	B_B242 = B_B23E;
	B_B243 = B_B23F;
	B_B244 = B_B240;
	B_B245 = B_B241;
	far_c32d9(far_d65f7(B_9D36), 4);
	--B_8CCB;
	return;
}
