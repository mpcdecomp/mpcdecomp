/* differs: +3 push word ptr W_9B98_ | callf SEG_D621:far_d6216 */
extern int W_9B92;
extern int W_9B94;
extern int W_9B96;
extern int W_9B98;
long far_d6216();
long far_daa02();

far_d62a9()
{
	far_daa02(W_9B92, W_9B94, W_9B96, W_9B98);
	return far_d6216() * 100L / far_daa02(W_9B92, W_9B94, W_9B96, W_9B98);
}
