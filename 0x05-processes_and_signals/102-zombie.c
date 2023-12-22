#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

/**
 * zombie_processes- creates 5 zombie_processes
 * Return: void
 */
void zombie_processes(void)
{
	if (!fork())
	{
		printf("Zombie process created, PID: %d", getpid());
		exit(0);
	}
}
/**
 * infinite_while - loops forever
 * Return: 0 success
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * main - creates 5 zombie_processes
 * Return: 0 success
 */
int main(void)
{
	int i = 0;

	while (i < 5)
	{
		zombie_processes();
		i++;
	}
	infinite_while();
	return (0);
}
