%%
'  { printf("&apos;"); }
\" { printf("&quot;"); }
&  { printf("&amp;"); }
\< { printf("&lt;"); }
\> { printf("&gt;"); }
%%
int main(void) {
  yylex();
  return 0;
}

int yywrap(void) {
  return 1;
}
