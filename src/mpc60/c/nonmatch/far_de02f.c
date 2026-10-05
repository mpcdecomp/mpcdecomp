/* differs: +3 mov word ptr W_8CEA_,-1 | mov dx, 0ffffh */
extern char B_8CDA;
extern int W_8CDC;
extern int W_8CDE;
extern int W_8CE0;
extern int W_8CE2;
extern int W_8CE4;
extern int W_8CE6;
extern int W_8CE8;
extern int W_8CEA;

far_de02f()
{
	W_8CEA = -1;
	W_8CE6 = W_8CE8 = -1;
	W_8CE4 = W_8CE8;
	W_8CE2 = W_8CE6;
	W_8CE0 = W_8CE4;
	W_8CDE = W_8CE2;
	W_8CDC = W_8CE0;
	B_8CDA = 15;
	return;
}
