#include <stdlib.h>


int* randomMapGeneration()
{
	int mines[25];
	int isDuplicate = 0;
	for (int i = 0; i < 25; i++)
	{
		int rand_num = rand() % 167;
		for (int j = 0; j < i; j++)
		{
			if (mines[j] == rand_num)
			{
				isDuplicate = 1;
				break;
			}
		}
		if (isDuplicate)
		{
			isDuplicate = 0;
			i--;
			continue;
		}
		mines[i] = rand_num;
	}
	return mines;
}

