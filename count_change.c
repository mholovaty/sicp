# include <stdio.h>
# include <stdlib.h>
# include <count_change.h>


int first_denomination (int kinds_of_coins)
{
  switch (kinds_of_coins)
{
  case 1:
    return 1;
  case 2:
    return 5;
  case 3:
    return 10;
  case 4:
    return 25;
  case 5:
    return 50;
  }
}


int cc (int amount, int kinds_of_coins)
{
  if (amount == 0)
    {
      return 1;
    };
  if (amount < 0)
    {
      return 0;
    };
  if (kinds_of_coins == 0)
    {
      return 0;
    };

  return 
    cc (amount, kinds_of_coins - 1) + 
    cc (amount - first_denomination ( kinds_of_coins), kinds_of_coins);
}


int count_change (int amount)
{
  return cc(amount, 5);
}


int main(int argc, char *argv[])
{

  if (argc != 2)
    {
      printf("Usage: %s AMOUNT\n", argv[0]);

      return EXIT_FAILURE;
    }
  else
    {
      int amount = atoi(argv[1]);

      int combinations = count_change(amount);

      printf("Ka-ching! %d\n", combinations);

      return EXIT_SUCCESS;
    }
}
