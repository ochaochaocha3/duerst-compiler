/*
 * Hiki の見出し抽出
 * MediaWiki のように見出し番号をつけて表示する
 */
%{
  int n_bang_stack[7] = {0};
  int n_bang_stack_pos = 0;
  int heading_counter[7] = {0};

  // 見出しを表示する
  void print_heading(int* counter, const char* content);
%}

HEADING ^!{1,6}.+

%option main

%%

{HEADING} {
  int n_bang = 0;
  char* text_ptr = yytext;

  // '!' の数を調べる
  while (n_bang < 6 && *text_ptr == '!') {
    ++n_bang;
    ++text_ptr;
  }

  if (n_bang > n_bang_stack[n_bang_stack_pos]) {
    // 小見出しなので push する
    ++n_bang_stack_pos;
  } else {
    // 同レベルの見出しが見つかるまで pop する
    while (n_bang <= n_bang_stack[n_bang_stack_pos - 1]) {
      --n_bang_stack_pos;

      // 1 つ下のレベルの見出し番号をリセットする
      heading_counter[n_bang_stack_pos] = 0;
    }
  }

  n_bang_stack[n_bang_stack_pos] = n_bang;
  ++heading_counter[n_bang_stack_pos - 1];

  print_heading(heading_counter, text_ptr);
}

.  { }
\n { }

%%

void print_heading(int* counter, const char* content) {
  int i;

  putchar('0' + counter[0]);
  for (i = 1; i < 6 && counter[i] > 0; ++i) {
    putchar('.');
    putchar('0' + counter[i]);
  }
  putchar(' ');

  puts(content);
}
