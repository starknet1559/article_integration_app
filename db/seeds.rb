# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = User.create!(
  [
    {email: 'user1@sample', name: 'user1', password: 'password', biography: '〇〇県出身のuser1です。大学時代は、〇〇部に入っていました。英語が得意なので、グローバル事業に取り組みたいと思っています。' },
    {email: 'user2@sample', name: 'user2', password: 'password', biography: '〇〇県出身のuser2です。大学時代は、〇〇部に入っていました。英語が得意なので、グローバル事業に取り組みたいと思っています。' },
    {email: 'user3@sample', name: 'user3', password: 'password', biography: 'One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin.' }
  ]
)

Post.create!(
  [
    {title: 'アリスとボブ', description: 'アリスとボブ（英: Alice and Bob）は、暗号通信などの分野で、プロトコル等を説明する際に、想定上の当事者として登場する典型的なキャラクター。"当事者Aが当事者Bに情報を送信するとして"のような説明文では、段階の増えた体系になるにつれ追いにくくなる。そのため、こういった具体的人名が好んで使われる。', content_url: 'https://ja.wikipedia.org/wiki/%E3%82%A2%E3%83%AA%E3%82%B9%E3%81%A8%E3%83%9C%E3%83%96', user_id: users[0].id },
    {title: 'コロンブスの卵', description: 'どんなに素晴らしいアイデアや発見も、ひとたび衆目に触れた後には非常に単純あるいは簡単に見えることを指す成句である。', content_url: 'https://ja.wikipedia.org/wiki/%E3%82%B3%E3%83%AD%E3%83%B3%E3%83%96%E3%82%B9%E3%81%AE%E5%8D%B5', user_id: users[1].id },
    {title: 'Ruby', description: 'Ruby（ルビー）は、まつもとゆきひろ（通称: Matz）により開発されたオブジェクト指向スクリプト言語（スクリプト言語とはプログラミング言語の一分類）。', content_url: 'https://ja.wikipedia.org/wiki/Ruby', user_id: users[1].id },
    {title: 'Fizz Buzz', description: 'Fizz Buzz（フィズ・バズ、Bizz BuzzやBuzzとも呼ばれる）は英語圏で長距離ドライブ中や飲み会の時に行われる言葉遊びである。', content_url: 'https://ja.wikipedia.org/wiki/Fizz_Buzz', user_id: users[2].id }
  ]
)

Genre.create!(
  [
    {name: 'Amazon' },
    {name: 'Twitter' },
    {name: 'Reddit' },
    {name: 'Substack' },
    {name: 'note' },
    {name: 'Medium' },
    {name: 'Notion' },
    {name: 'GitHub' },
    {name: 'Instagram' },
    {name: 'Telegram' },
    {name: 'Discord' }
  ]
)

GenrePost.create!(
  [
    {post_id: 1, genre_id: 1 },
    {post_id: 1, genre_id: 2 },
    {post_id: 1, genre_id: 3 },
    {post_id: 2, genre_id: 4 },
    {post_id: 2, genre_id: 5 },
    {post_id: 2, genre_id: 1 },
    {post_id: 3, genre_id: 1 },
    {post_id: 3, genre_id: 6 },
    {post_id: 3, genre_id: 7 },
    {post_id: 3, genre_id: 8 },
    {post_id: 4, genre_id: 9 },
    {post_id: 4, genre_id: 8 }
  ]
)

Admin.create!(
  [
    {email: 'admin1@sample', name: 'admin1', password: 'password'}
  ]
)