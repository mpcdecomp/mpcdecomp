/* differs: 150 size 12, image 16; +9 image `pop si` CL `retf 0xa`; 172 size 12, image 16; +9 image `pop si` CL `retf 0xa` */
extern char P_2110[1];
void __far __pascal disp_list_run(char far *);

void __far __pascal X_05EDE(int x4, int x3, int x2, int x1, int x0)
{
	disp_list_run(P_2110);
}
