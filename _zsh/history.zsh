if [ -z "$HISTFILE" ]; then
	HISTFILE=$HOME/.zsh_history
fi

HISTSIZE=10000 # メモリ上に保存される件数（検索できる件数）
SAVEHIST=10000 # ファイルに保存される件数

# rootユーザーの履歴は残さない
if [ $UID = 0 ]; then
	unset HISTFILE
	SAVEHIST=0
fi

setopt append_history # zshを複数使用した時，履歴ファイルを上書きせず追加する
setopt extended_history # 履歴ファイルにzshの開始・終了時刻を記録
setopt hist_expire_dups_first # 履歴を削除する必要がある時，重複したものから削除
setopt hist_ignore_all_dups # 重複するコマンドは古い方を削除
setopt hist_ignore_dups # ファイルに書き出す時，古いコマンドと同じなら無視
setopt hist_ignore_space # スペースで始まる場合は履歴に追加しない
setopt hist_save_no_dups # 重複するコマンドが保存される時に古い方を削除する
setopt hist_verify # 履歴を呼び出してから実行する間に一旦編集できる状態になる
setopt inc_append_history # コマンド実行時に履歴をファイルに保存する
setopt share_history # 履歴を複数端末で共有する
