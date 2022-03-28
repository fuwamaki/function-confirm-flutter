## flutter 機能確認

flutter の機能確認 Repository。

## 公式ドキュメント

- Lab: https://flutter.dev/docs/get-started/codelab
- Cookbook: https://flutter.dev/docs/cookbook
- get-started: https://flutter.dev/docs/get-started/install/macos

## セットアップ

flutter を PC でセットアップする方法。

### 1. development フォルダを作成

```bash
$ mkdir development
```

### 2. SDK ファイルインストール

macOS ならここから。
https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_2.2.0-stable.zip

### 3. ファイルを解凍

```bash
$ cd development
$ unzip ~/Downloads/flutter_macos_2.2.0-stable.zip
```

### 4. Path を登録

zsh 利用なら.zshrc。

```
export PATH=$PATH:~/development/flutter/bin
```

確認

```bash
$ flutter -v
```

### 5. セットアップ

ディレクトリはどこでも OK。

```bash
$ flutter doctor
```

### 6. VSCode セットアップ

VSCode Extension で`Flutter`をインストール

※ `launch.json` とかが勝手に作られたら、不要なので削除。

### 7. ビルド

右下で起動するデバイスを指定（iOS Sumulator, Android Emulator, Chrome）
F5 で起動
Shift + F5 でストップ
