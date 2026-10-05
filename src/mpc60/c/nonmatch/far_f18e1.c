/* differs: +1d mov ax,word ptr TBL_A66C_ [bx] | mov ax, word ptr [bp + 6] */
extern long TBL_A66C[];
extern int TBL_A678[];
extern int TBL_A67A[];
extern int TBL_A67C[];
extern char TBL_A68A[];
extern char TBL_A68B[];
extern char TBL_A68C[];
extern char TBL_A68D[];
extern char TBL_A68E[];
extern char TBL_A68F[];
extern char TBL_A690[];
extern int TBL_A6E4_V112[];
extern int TBL_A6E6_V112[];

far_f18e1(a0)
{
	*(int *)((char *)TBL_A678 + a0 * 59) = 0;
	*(int *)((char *)TBL_A67A + a0 * 59) = *(long *)((char *)TBL_A66C + a0 * 59) / 40L;
	*(int *)((char *)TBL_A67C + a0 * 59) = 0;
	*(int *)((char *)TBL_A6E4_V112 + a0 * 59) = 20;
	*(int *)((char *)TBL_A6E6_V112 + a0 * 59) = 0x1000;
	TBL_A68A[a0 * 59] = 0;
	TBL_A68B[a0 * 59] = 127;
	TBL_A68C[a0 * 59] = 64;
	TBL_A68E[a0 * 59] = -75;
	TBL_A68D[a0 * 59] = -75;
	TBL_A68F[a0 * 59] = -1;
	TBL_A690[a0 * 59] = 0;
	L_e36c4(a0);
	return;
}
