#!/bin/sh
  echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"
while :
 do
  read select
  case "$select" in
	"Add Password" ) 
            gpg -d info.txt.gpg > info.txt
            rm info.txt.gpg
            echo "パスワードマネージャーへようこそ"
            echo "サービス名を入力してください:"
            read service
            echo "ユーザー名を入力してください:"
            read user
            echo "パスワードを入力してください:"
            read password
            echo "$service:$user:$password" >> info.txt
            gpg -c info.txt
            rm info.txt
             ;;
    "Get Password" ) 
            gpg -d info.txt.gpg > info.txt
            echo "サービス名を入力してください:"
            read service_grep
            info_grep=$(grep "$service_grep" info.txt)
            if [ -z "$info_grep" ]; then
                echo "そのサービスは登録されていません"
            else
                echo "$info_grep"
            fi
            rm info.txt
            ;;
    "Exit" ) echo "終了します"
           break;;
   esac
  echo "Add Password/Get Password/Exit から入力してください。"
  done
