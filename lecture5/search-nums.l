%{
  long sum_of_nums = 0;
  long num;
%}
%%
[0-9]+ {
  sscanf(yytext, "%ld", &num);
  sum_of_nums += num;
  printf(">>>%s<<<", yytext);
}
%%
int main(void) {
  yylex();
  printf("\nSum of numbers = %ld\n", sum_of_nums);

  return 0;
}

int yywrap(void) {
  return 1;
}
