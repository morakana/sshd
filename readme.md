# 概要
これは、Dockerコンテナにsshで接続できるようにしたものです。<br>
これ自体では素の ubuntu:20.04 でしかありませんのであまり意味はありません、<br>
どちらかというと、コンテナにsshdの機能を追加したい時の参考にしてください。<br>
<br>
# 使い方
このリポジトリの内容を適当なディレクトリに展開してください<br>
<br>
**.env**の内容を確認してください
```
SSHD_LISTEN_ADDRESS=192.168.0. ＜− hosts.allowの sshd: 192.168.0. として設定されます
SSHD_LISTEN_PORT=22000         ＜− ホスト側の待ち受けポートとして設定されます
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
**ssh root@＜ホストのアドレス＞ -p ＜待ち受けポート＞**<br>
公開鍵は使用していません、ログイン時はパスワードを入力してください<br>
（初期パスワードは root です）<br>
<br>
X11フォワーディングを行いたい（GUIアプリも表示させたい）場合は<br>
**ssh -XC root@＜ホストのアドレス＞ -p ＜待ち受けポート＞**<br>
として **-XC**オプションを追加して接続してください<br>
LinuxのGUI環境だと xhostで権限の設定が必要になるかもしれません<br>
WindowsのMobaXTermのTerminalだと特に設定をすることなくウインドウが表示されるかと思います<br>
WSLからの場合は、VcXsrvなどの Xサーバを立て、
WSLの環境変数 DISPLAY に localhost:0.0 と設定してから<br>
sshで接続すればウインドウが表示されるかと思います<br>
<br>
<br>
**接続後は 各自パスワードを変更しておいてください**<br>
docker-compose exec または ssh でログインした後に<br>
**passwd** を実行し、新しいパスワードを二度入力すれば<br>
次回接続時から新しいパスワードでログインできるようになります<br>
<br><br><br><br><br>
