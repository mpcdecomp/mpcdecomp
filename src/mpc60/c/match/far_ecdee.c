extern char B_9FA8;
extern char B_9FA9;
extern char B_9FAA;
extern char B_9FAB;
extern char TBL_7DA2[];
extern char TBL_7DA3[];
extern char TBL_7DA4[];
extern char TBL_7DA5[];
extern char TBL_7DA6[];
extern char TBL_9FA7;

far_ecdee(a0)
{
	TBL_9FA7 = TBL_7DA2[a0 * 5];
	B_9FA8 = TBL_7DA3[a0 * 5];
	B_9FA9 = TBL_7DA4[a0 * 5];
	B_9FAA = TBL_7DA5[a0 * 5];
	B_9FAB = TBL_7DA6[a0 * 5];
	return;
}
