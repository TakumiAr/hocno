# README

# Hocno(ほしーの) 欲しいもの相談SNS型アプリ
## 概要
自分が欲しいと思っているものを投稿することに特化したSNS型アプリ。
画像や内容を投稿したり、いいねやコメントをすることができます。

## コンセプト
欲しいものを投稿して、その商品についての情報をコメント、いいねをしてもらうことで、
有意義な買い物ができる。

## バージョン
ruby 2.6.3

Rails 5.2.3

psql (PostgreSQL) 11.3

## 機能一覧
##### 投稿機能
- 画像、タイトル、内容は必須。
##### コメント機能
- コメントをすることができる。
##### 検索機能
- カテゴリー、文字列で検索できる。
##### いいね機能
##### ユーザー登録機能
- 名前、メールアドレス、パスワードは必須。
- ユーザーアイコンはユーザー編集で変更可能。
##### ソート機能
- 投稿の状態やいいねでソートできる。
##### ログイン機能
##### マイページ機能
- ユーザー情報の変更ができる。
##### 管理者権限機能
- 他のユーザーの投稿やコメント削除、カテゴリーの作成ができる。
##### カテゴリー機能
- 投稿にカテゴリーをつけることができる。
- 管理者のみカテゴリーの作成ができる。
##### 通知機能
- 自分の投稿にいいねやコメントがつくと通知が来る。

## カタログ設計
https://docs.google.com/spreadsheets/d/1hk5GonRw4VUu28gDsvvEhp7tp5ZFtZs0ohqORre2cQA/edit?usp=sharing
## テーブル定義
https://docs.google.com/spreadsheets/d/1hk5GonRw4VUu28gDsvvEhp7tp5ZFtZs0ohqORre2cQA/edit?usp=sharing
## ER図
https://github.com/yujihirai/Hocno/blob/master/docs/ER%E5%9B%B3.png
## 画面遷移図
https://github.com/yujihirai/Hocno/blob/master/docs/%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3.png

## 画面ワイヤーフレーム
https://xd.adobe.com/view/132b4e1e-14d3-438e-41b1-9b642d99b6bb-651a/

## 使用予定gem
carrierwave

mini_magick

devise

ransuck
