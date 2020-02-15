# makua

育児に関する情報共有、支援サイトです。

## :family:サイトの説明・概要

育児における悩みを共有、相談し解決したり、あなたのとっておきの情報やスキルを発信する事ができます。

また、子供が成長したなどの理由で不要になった服やおもちゃなどをギフトとして、あなたと同じパパ、ママに譲ったり受け取る事が可能です。

<s>私事ですが、先日結婚式を終えてこれから父親になることもあり、</s><br>
育児に関するサイトを何件か拝見させて頂きましたが、男親のための情報、コミュニティサイトが少なく感じました。 <br>
日本の父親の育児への関心、協力が遅れているとされる要因の一つには、手伝いたい、参加したいと思っていても不慣れなことに不安を感じる父親もいるのでは？と思い、そんな方々のためのサイトを目指し作成しました。 

## :baby:サイトURL

http://makua.website

## :octocat:インストール

```
$ git clone https://github.com/kurahashitakahiro/makua.git
$ cd makua
```

## :runner:テストユーザー

name:test<br>
Email:test@test.com<br>
Password:tttttt<br>

上記テストユーザーでログインも可能です。

## :ok_woman:使い方

Gifts<br>
不要になった育児アイテムを必要としている方に譲ったり、あなたが必要なら譲り受ける事ができます。<br>
新規にGiftを投稿し、また編集、削除ができます。<br>
一覧、詳細の閲覧。コメントができます。<br>
気になるアイテムがありましたら、ユーザーとDMで直接やりとりができます。

Posts<br>
育児における悩みや不安の共有、相談、またそれらを解決。情報やスキルを発信する事ができます。<br>
新規にPostを投稿し、また編集、削除ができます。<br>
一覧、詳細の閲覧。コメントができます。<br>
気になる投稿がありましたら、お気に入り(ブックマーク)に登録する事ができます。

My page(User page)<br>
あなた専用のページです。<br>
ユーザ情報の編集(name:ニックネーム　image:あなたのイメージ)、退会ができます。

上記機能の内、GiftとPostの閲覧のみ会員登録(Sign up)、ログイン(Log in)なしで可能です。<br>
詳しくはAbout内のHow toをご確認下さい。

## :computer:使用しているバージョン・GEM等

ruby '2.5.7'

gem 'rails', '~> 5.2.4'

gem 'pry-byebug'

gem 'bootstrap', '~> 4.1.1'

gem 'jquery-rails'

gem 'cocoon'

gem "refile", require: "refile/rails", github: 'manfe/refile'

gem "refile-mini_magick"

gem 'kaminari','~> 1.1.1'

gem 'ransack'

gem 'devise'
