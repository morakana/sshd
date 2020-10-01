# 概要
これは、Dockerコンテナにsshで接続できるようにしたコンテナです。<br>
これ自体では素の ubuntu:20.04 でしかありませんのであまり意味はありません<br>
どちらかというと、コンテナにsshdの機能を追加したい時の参考にしてください <br>
<br>
# 使い方
このリポジトリの内容を適当なディレクトリに展開してください<br>
<br>
**.env**の内容を確認してください
```
SSHD_LISTEN_ADDRESS=192.168.0. ＜− hosts.allowに設定する 待ち受け許可アドレス
SSHD_LISTEN_PORT=22000         ＜− 待ち受けポート
```
**docker-compose build**<br>
で、イメージのビルドを行います<br>
<br>
**docker-compose up -d**<br>
で、コンテナを起動します<br>
<br>
**docker-compose exec sshd bash**<br>
で、コンテナに接続して操作できます<br>
<br>
<br>
sshで接続するには<br>
**ssh root@＜アドレス＞ -p ＜ポート＞**
公開鍵は使用していません、パスワードを入力してください<br>
（初期パスワードは root です）<br>
<br>
接続後は 各自パスワードを変更しておいてください<br>
**passwd** を実行した後 新しいパスワードを二度入力すれば<br>
次回接続時から新しいパスワードでログインできるようになります<br>

<br><br><br><br><br>
