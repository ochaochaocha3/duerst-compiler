第 5 回：字句解析ツール flex
============================

http://www.sw.it.aoyama.ac.jp/2014/Compiler/lecture5.html

flex の入力形式
---------------

* 宣言部は `%{ %}` で囲んだ方が無難に感じた。インデントが面倒なので。
* 同じく、C 言語の実行文も `{ }` で囲んだ方が無難。

```
%{
  宣言等
%}
%%
正規表現 { 実行文 }
%%
関数等
```

flex のマニュアル
-----------------

* 英語のマニュアル: http://flex.sourceforge.net/manual/
* 日本語のマニュアル: http://www.geocities.co.jp/SiliconValley-Oakland/3432/man/flex/flex-ja.html
