extern char B_5216;
extern char B_52AD;
extern char B_52AE;
extern char B_8CDA;
extern int W_8CDC;
extern int W_8CDE;
extern int W_8CE0;
extern int W_8CE2;
extern int W_8CE4;
extern int W_8CE6;
extern int W_8CE8;
extern int W_8CEA;

far_db8ab()
{
	int v2;

	v2 = 0;
	if (B_52AD == 0) {
		W_8CDE = -1;
		W_8CDC = -1;
		W_8CE2 = -1;
		W_8CE0 = -1;
		v2 |= 3;
	}
	if (B_52AE == 0) {
		W_8CE6 = -1;
		W_8CE4 = -1;
		v2 |= 4;
	}
	if (B_5216 == 0) {
		W_8CEA = -1;
		W_8CE8 = -1;
		v2 |= 8;
	}
	B_8CDA |= v2;
	return;
}
