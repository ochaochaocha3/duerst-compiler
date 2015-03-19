%%
&apos; { putchar('\''); }
&quot; { putchar('"'); }
&amp;  { putchar('&'); }
&lt;   { putchar('<'); }
&gt;   { putchar('>'); }
%%
int main(void) {
  yylex();
  return 0;
}

int yywrap(void) {
  return 1;
}
