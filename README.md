# LuaLaTeX レポートテンプレート

## 役割を持つファイル

### `main.tex`

LaTeX のエントリポイント (？)

### `preamble.tex`

プリアンブルをまとめてある

### `root.rb`

`PROJECT_ROOT` を定義してある ruby ファイル

`scripts/` 以下の ruby はこれを `require` しておくと話が楽

python は親ディレクトリからの `import` とかを考えるのが少し難しいので ruby を介して実行すると楽になったりする．

## 役割を持つディレクトリ

### `build/`

- 成果物 (pdf)

### `resources/`

- フォント・画像ファイル等の添付アイテム
- csv などの加工前後の実験データ等
- `scripts/` 以下のコードの出力 (pgf など)

### `sections/`

- 各セクションの内容 (`main.tex` で `input` される内容)
  - `make watch` 等するので, `input` や `includegraphics` にはプロジェクトルートからの相対パスを渡すこと

### `scripts/`

- ruby や python などのスクリプト
  - グラフ出力や軽い数値計算
