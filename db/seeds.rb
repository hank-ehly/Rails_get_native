Admin.new(first_name: "Henry", last_name: "Ehly", email: "hank.ehly@gmail.com", password: "aaaaaaaa").save(validate: false)
Language.create!([
  {name: "Japanese"},
  {name: "Chinese"},
  {name: "Spanish"}
])
Language::HABTM_Topics.create!([
  {language_id: 2, topic_id: 15},
  {language_id: 2, topic_id: 14},
  {language_id: 2, topic_id: 13},
  {language_id: 3, topic_id: 15},
  {language_id: 1, topic_id: 1},
  {language_id: 1, topic_id: 2},
  {language_id: 1, topic_id: 3},
  {language_id: 1, topic_id: 4},
  {language_id: 1, topic_id: 5},
  {language_id: 1, topic_id: 6},
  {language_id: 1, topic_id: 7},
  {language_id: 1, topic_id: 8},
  {language_id: 1, topic_id: 9},
  {language_id: 1, topic_id: 10},
  {language_id: 1, topic_id: 11},
  {language_id: 1, topic_id: 12},
  {language_id: 1, topic_id: 13},
  {language_id: 1, topic_id: 14},
  {language_id: 1, topic_id: 15}
])
Speaker.create!([
  {first_name: "Akemo", last_name: "Yuki", gender: false, age: 3, about: nil, language_id: 1},
  {first_name: "Eriko", last_name: "Ishikawa", gender: false, age: 1, about: nil, language_id: 1},
  {first_name: "Kazuko", last_name: "Kodama", gender: false, age: 4, about: nil, language_id: 1},
  {first_name: "Shoichi", last_name: "Katayama", gender: true, age: 5, about: nil, language_id: 1},
  {first_name: "Hiroaki", last_name: "Murakami", gender: true, age: 3, about: nil, language_id: 1},
  {first_name: "Keiko", last_name: "Watanabe", gender: false, age: 2, about: nil, language_id: 1},
  {first_name: "Takashi", last_name: "Nogami", gender: true, age: 2, about: nil, language_id: 1},
  {first_name: "Emiko", last_name: "Koishi", gender: false, age: 4, about: nil, language_id: 1},
  {first_name: "Hiroshi", last_name: "Shiode", gender: true, age: 3, about: nil, language_id: 1},
  {first_name: "Yutaro", last_name: "Yoshida", gender: true, age: 4, about: nil, language_id: 1},
  {first_name: "Akira", last_name: "Mukai", gender: true, age: 2, about: nil, language_id: 1},
  {first_name: "Haruko", last_name: "Uchida", gender: false, age: 2, about: nil, language_id: 1},
  {first_name: "Mimi", last_name: "Johnson", gender: false, age: 2, about: nil, language_id: 1},
  {first_name: "Koji", last_name: "Kodama", gender: true, age: 2, about: nil, language_id: 1},
  {first_name: "Motonobu", last_name: "Yoshida", gender: true, age: 2, about: nil, language_id: 1},
  {first_name: "Shoji", last_name: "Onishi", gender: true, age: 2, about: nil, language_id: 1},
  {first_name: "Keita", last_name: "Sugai", gender: true, age: 3, about: nil, language_id: 1},
  {first_name: "Fumiaki", last_name: "Nakayasu", gender: true, age: 2, about: nil, language_id: 1},
  {first_name: "Makoto", last_name: "Takahashi", gender: true, age: 4, about: nil, language_id: 1},
  {first_name: "Yukio", last_name: "Kumazawa", gender: true, age: 4, about: nil, language_id: 1},
  {first_name: "Hiroshi", last_name: "Urabe", gender: true, age: 3, about: nil, language_id: 1},
  {first_name: "Tsutomu", last_name: "Yasuda", gender: true, age: 3, about: nil, language_id: 1},
  {first_name: "Taro", last_name: "Matsumoto", gender: true, age: 2, about: nil, language_id: 1},
  {first_name: "Nobuya", last_name: "Inagaki", gender: true, age: 3, about: nil, language_id: 1},
  {first_name: "Masao", last_name: "Takano", gender: true, age: 5, about: nil, language_id: 1},
  {first_name: "Shigeki", last_name: "Kokubun", gender: true, age: 2, about: nil, language_id: 1},
  {first_name: "Seijo", last_name: "Arai", gender: true, age: 3, about: nil, language_id: 1},
  {first_name: "Naoki", last_name: "Futasubashi", gender: true, age: 3, about: nil, language_id: 1},
  {first_name: "Yoshinobu", last_name: "Suzuki", gender: true, age: 2, about: nil, language_id: 1},
  {first_name: "Thomas", last_name: "Zhuang", gender: true, age: 4, about: nil, language_id: 2},
  {first_name: "Houn-Gee", last_name: "Chen", gender: true, age: 4, about: nil, language_id: 2},
  {first_name: "Jiahai", last_name: "Zhang", gender: true, age: 3, about: nil, language_id: 2},
  {first_name: "Chuannan", last_name: "Mu", gender: true, age: 2, about: nil, language_id: 2},
  {first_name: "Pete", last_name: "Chong", gender: true, age: 4, about: nil, language_id: 2},
  {first_name: "Shuhui", last_name: "Wan", gender: false, age: 2, about: nil, language_id: 2},
  {first_name: "Thomas", last_name: "Chiang", gender: true, age: 4, about: nil, language_id: 2},
  {first_name: "Shouzheng", last_name: "Cheng", gender: true, age: 2, about: nil, language_id: 2},
  {first_name: "Jordi", last_name: "Planas", gender: true, age: 3, about: nil, language_id: 3}
])
Topic.create!([
  {name: "Formal vs. Informal Speech"},
  {name: "Gifts"},
  {name: "Alcohol, Vegetarian"},
  {name: "Invitations to Homes"},
  {name: "Greeting Others"},
  {name: "Clothes"},
  {name: "Names and Titles"},
  {name: "Degrees and Diplomas"},
  {name: "Deadlines"},
  {name: "Follow-Up After Negotiations"},
  {name: "Ratification from Superiors"},
  {name: "Reformulating Strategies"},
  {name: "Reacting to Initial Resistance"},
  {name: "Win-Win Situations"},
  {name: "Initial Fact-Finding Phase"}
])
Topic::HABTM_Languages.create!([
  {language_id: 2, topic_id: 15},
  {language_id: 2, topic_id: 14},
  {language_id: 2, topic_id: 13},
  {language_id: 3, topic_id: 15},
  {language_id: 1, topic_id: 1},
  {language_id: 1, topic_id: 2},
  {language_id: 1, topic_id: 3},
  {language_id: 1, topic_id: 4},
  {language_id: 1, topic_id: 5},
  {language_id: 1, topic_id: 6},
  {language_id: 1, topic_id: 7},
  {language_id: 1, topic_id: 8},
  {language_id: 1, topic_id: 9},
  {language_id: 1, topic_id: 10},
  {language_id: 1, topic_id: 11},
  {language_id: 1, topic_id: 12},
  {language_id: 1, topic_id: 13},
  {language_id: 1, topic_id: 14},
  {language_id: 1, topic_id: 15}
])
Video.create!([
  {speaker_id: 1, language_id: 1, topic_id: 1, original_url: "https://www.youtube.com/watch?v=gg8WFgSlfwM&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC", japanese_script: "えっとまず日本語の普通体と敬語体多分すごく一般的に考えられるのは友人たちの間では勿論普通体でビジネスの世界では敬語体っていうのが一般的なんですけれども、その中で特に私自身も仕事の中で敬語体の中でも多分自分が気づい多分意識して使っているんでしょうけれども例えばその人の役職がとても上の方例えば仕事柄私よく会長さんとか会社の社長さんにお会いすることが多いんですけれども、とてもとてもあのう必要以上に敬語を使っている感があります。で多分あのう何だろううんもう本当に本当にその人のそうですね役職とかそういうのにとても影響を受けているような気がします。で例え会社組織の中で仕事今フリーランスなんですけど組織の中で仕事をしていた時にはやはり同僚同士だと勿論とてもフランクなしゃべり方をするんですけれども、ただやっぱり肝心な時にはやっぱりどうしても敬語を使うで敬語を使った方がすごくこうなんて言うんだろうな仕事としてきちんとすみわけができるっていうそういう印象をとてもよく受けます。でそれに対してアメリカ人の方例えば仕事の上で日本語をお話になる方もとても増えているんですけれどもすごく一生懸命がんばって日本語をしゃべってくださってそれはとても日本とか日本語日本人に対して敬意を払ってくれているっていうのはわかるんですけれどもあんまり無理しなくてもいいかなっていう印象を受けます。だからいろんな敬語の中でも謙譲語とか尊敬語とかいろんな敬語の使い方がある中で日本語を母国語としない方が日本語をしゃべる場合本当に基本的な敬語でいいんじゃないかなって無理してがんばって使わなくてももう日本語を話してくださるっていうだけでとても敬語に匹敵するぐらいのとても敬意を表してくれているような 印象を受けます。", english_script: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Autem quam quasi, hic expedita beatae perferendis, voluptatibus animi itaque. Totam aliquid rerum dolorem officiis quo, beatae libero aut est maxime asperiores. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Autem quam quasi, hic expedita beatae perferendis, voluptatibus animi itaque. Totam aliquid rerum dolorem officiis quo, beatae libero aut est maxime asperiores. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Autem quam quasi, hic expedita beatae perferendis, voluptatibus animi itaque. Totam aliquid rerum dolorem officiis quo, beatae libero aut est maxime asperiores."},
  {speaker_id: 2, language_id: 1, topic_id: 1, original_url: "https://www.youtube.com/watch?v=KHpEPhzUS3E&index=3&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC", japanese_script: nil, english_script: nil},
  {speaker_id: 2, language_id: 1, topic_id: 2, original_url: "https://www.youtube.com/watch?v=NYKewOxDf_M&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=10", japanese_script: nil, english_script: nil},
  {speaker_id: 3, language_id: 1, topic_id: 2, original_url: "https://www.youtube.com/watch?v=GA5fTb_7pes&index=11&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC", japanese_script: nil, english_script: nil},
  {speaker_id: 4, language_id: 1, topic_id: 2, original_url: "https://www.youtube.com/watch?v=Z7G9Njm6Leg&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=12", japanese_script: nil, english_script: nil},
  {speaker_id: 1, language_id: 1, topic_id: 3, original_url: "https://www.youtube.com/watch?v=uUMa1K934NA&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=13", japanese_script: nil, english_script: nil},
  {speaker_id: 5, language_id: 1, topic_id: 3, original_url: "https://www.youtube.com/watch?v=9bCJY7a_P6U&index=14&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC", japanese_script: nil, english_script: nil},
  {speaker_id: 6, language_id: 1, topic_id: 3, original_url: "https://www.youtube.com/watch?v=LmTc4RmBc9M&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=15", japanese_script: nil, english_script: nil},
  {speaker_id: 7, language_id: 1, topic_id: 3, original_url: "https://www.youtube.com/watch?v=igutbBTvdtk&index=16&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC", japanese_script: nil, english_script: nil},
  {speaker_id: 8, language_id: 1, topic_id: 4, original_url: "https://www.youtube.com/watch?v=od7GM334om8&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=17", japanese_script: nil, english_script: nil},
  {speaker_id: 9, language_id: 1, topic_id: 4, original_url: "https://www.youtube.com/watch?v=LdHtO07QTsY&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=18", japanese_script: nil, english_script: nil},
  {speaker_id: 5, language_id: 1, topic_id: 5, original_url: "https://www.youtube.com/watch?v=W2G68H3xRyE&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=6", japanese_script: nil, english_script: nil},
  {speaker_id: 10, language_id: 1, topic_id: 4, original_url: "https://www.youtube.com/watch?v=LJg2grEuLDE&index=20&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC", japanese_script: nil, english_script: nil},
  {speaker_id: 11, language_id: 1, topic_id: 6, original_url: "https://www.youtube.com/watch?v=MhZMmaqm4mg&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=21", japanese_script: nil, english_script: nil},
  {speaker_id: 12, language_id: 1, topic_id: 6, original_url: "https://www.youtube.com/watch?v=8990okNLCtI&index=22&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC", japanese_script: nil, english_script: nil},
  {speaker_id: 3, language_id: 1, topic_id: 6, original_url: "https://www.youtube.com/watch?v=XamoqZ-XmKc&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=23", japanese_script: nil, english_script: nil},
  {speaker_id: 13, language_id: 1, topic_id: 6, original_url: "https://www.youtube.com/watch?v=mKtiZsY820g&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=24", japanese_script: nil, english_script: nil},
  {speaker_id: 14, language_id: 1, topic_id: 6, original_url: "https://www.youtube.com/watch?v=zmuJyUbiuy4&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=25", japanese_script: nil, english_script: nil},
  {speaker_id: 15, language_id: 1, topic_id: 7, original_url: "https://www.youtube.com/watch?v=p1jQfQ-DOT0&index=26&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC", japanese_script: nil, english_script: nil},
  {speaker_id: 16, language_id: 1, topic_id: 7, original_url: "https://www.youtube.com/watch?v=Pq8STWRqjkA&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=27", japanese_script: nil, english_script: nil},
  {speaker_id: 10, language_id: 1, topic_id: 7, original_url: "https://www.youtube.com/watch?v=d7VCeojtrek&index=28&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC", japanese_script: nil, english_script: nil},
  {speaker_id: 9, language_id: 1, topic_id: 8, original_url: "https://www.youtube.com/watch?v=z437PwEQ7GE&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=29", japanese_script: nil, english_script: nil},
  {speaker_id: 17, language_id: 1, topic_id: 8, original_url: "https://www.youtube.com/watch?v=EcH6ByBIS-w&index=30&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC", japanese_script: nil, english_script: nil},
  {speaker_id: 15, language_id: 1, topic_id: 8, original_url: "https://www.youtube.com/watch?v=ono0mT2Gq_8&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=31", japanese_script: nil, english_script: nil},
  {speaker_id: 18, language_id: 1, topic_id: 8, original_url: "https://www.youtube.com/watch?v=vKSd0visLCA&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=32", japanese_script: nil, english_script: nil},
  {speaker_id: 17, language_id: 1, topic_id: 9, original_url: "https://www.youtube.com/watch?v=uxfi4VRI_pY&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=76", japanese_script: "締め切りが大切ということはどこの国でもある程度はそうだと思いますけれども、日本では非常に重要視されます。特に取引先に対する納期納期などの約束事っていうのは絶対に守るということが前提条件です。それを守らないことは会社にとっては大きな信用問題となってペナルティーを課されたり、場合によっては取引停止になることもあると思います。個人の社員について言えば、例えばある社員の責任で取引先の納期が遅れたり信用上の問題が発生した場合には、その社員が取引先から担当替えを要求されたりそれからその社員が取引先の会社に出入り禁止になるということもあると思います。", english_script: nil},
  {speaker_id: 19, language_id: 1, topic_id: 10, original_url: "https://www.youtube.com/watch?v=7PXj3xHKKdo&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=100", japanese_script: "", english_script: ""},
  {speaker_id: 20, language_id: 1, topic_id: 11, original_url: "https://www.youtube.com/watch?v=txPkPYbruVA&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=99", japanese_script: "", english_script: ""},
  {speaker_id: 21, language_id: 1, topic_id: 11, original_url: "https://www.youtube.com/watch?v=ZiJ1Nkt1Xns&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=98", japanese_script: "", english_script: ""},
  {speaker_id: 22, language_id: 1, topic_id: 11, original_url: "https://www.youtube.com/watch?v=krqCjTsGORQ&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=97", japanese_script: "", english_script: ""},
  {speaker_id: 21, language_id: 1, topic_id: 12, original_url: "https://www.youtube.com/watch?v=QrL-1EY__9g&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=95", japanese_script: "", english_script: ""},
  {speaker_id: 23, language_id: 1, topic_id: 12, original_url: "https://www.youtube.com/watch?v=QAwS9MuCEbo&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=94", japanese_script: "", english_script: ""},
  {speaker_id: 24, language_id: 1, topic_id: 12, original_url: "https://www.youtube.com/watch?v=vfpsPoJFDW8&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=93", japanese_script: "", english_script: ""},
  {speaker_id: 25, language_id: 1, topic_id: 12, original_url: "https://www.youtube.com/watch?v=xexBV6kUxb8&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=92", japanese_script: "", english_script: ""},
  {speaker_id: 20, language_id: 1, topic_id: 13, original_url: "https://www.youtube.com/watch?v=6fSfvUj9SUU&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=91", japanese_script: "", english_script: ""},
  {speaker_id: 26, language_id: 1, topic_id: 13, original_url: "https://www.youtube.com/watch?v=JVZfmgHUFYo&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=90", japanese_script: "", english_script: ""},
  {speaker_id: 25, language_id: 1, topic_id: 13, original_url: "https://www.youtube.com/watch?v=lhIZQu4p9GU&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=89", japanese_script: "", english_script: ""},
  {speaker_id: 27, language_id: 1, topic_id: 13, original_url: "https://www.youtube.com/watch?v=yjc7RKgMNAk&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=88", japanese_script: "", english_script: ""},
  {speaker_id: 20, language_id: 1, topic_id: 14, original_url: "https://www.youtube.com/watch?v=pWa4cREq3hk&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=87", japanese_script: "", english_script: ""},
  {speaker_id: 28, language_id: 1, topic_id: 14, original_url: "https://www.youtube.com/watch?v=ohjigkY9Jdg&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=86", japanese_script: "えっと、人によってウィン・ウィンのアプローチについては、日本人でもかなり変わってくると思うんですけども。私の場合は、通常自分で譲れる範囲はどこまでかというのを最初に考えて、その譲れる範囲であれば、相手の考え方をなるべく尊重します。ただ、まあ、そこだけは譲れないという部分については、譲れないということでやっています。で、アメリカ人と交渉する時にこれをどう変えるかということなんですが、基本的には変えませんが、アメリカ人と交渉する時は、比較的日本人と交渉する時よりも、自分の考え方を強く先に言っておきます。で、相手の方もかなりアメリカ人の場合は比較的自分の考えを強く主張してきますんで、こちらの方も最初から強く要求していかないと、かなり向こうの方は有利な条件で進んでしまいますんで、そういうスタンスでアメリカ人と交渉する時は行っております。", english_script: ""},
  {speaker_id: 25, language_id: 1, topic_id: 14, original_url: "https://www.youtube.com/watch?v=rrOBB93EbfA&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=85", japanese_script: "", english_script: ""},
  {speaker_id: 27, language_id: 1, topic_id: 14, original_url: "https://www.youtube.com/watch?v=GMM5yv6LiWQ&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=84", japanese_script: "", english_script: ""},
  {speaker_id: 29, language_id: 1, topic_id: 15, original_url: "https://www.youtube.com/watch?v=V_fttUyF25M&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=83", japanese_script: "", english_script: ""},
  {speaker_id: 22, language_id: 1, topic_id: 15, original_url: "https://www.youtube.com/watch?v=WS9BgQBruyQ&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=82", japanese_script: "", english_script: ""},
  {speaker_id: 7, language_id: 1, topic_id: 15, original_url: "https://www.youtube.com/watch?v=kjzie_xihog&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=81", japanese_script: "", english_script: ""},
  {speaker_id: 27, language_id: 1, topic_id: 15, original_url: "https://www.youtube.com/watch?v=mloS-ES6ZI8&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=80", japanese_script: "", english_script: ""},
  {speaker_id: 26, language_id: 1, topic_id: 9, original_url: "https://www.youtube.com/watch?v=PfKxRNHe8k0&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=79", japanese_script: "", english_script: ""},
  {speaker_id: 28, language_id: 1, topic_id: 9, original_url: "https://www.youtube.com/watch?v=lpn6i8Ujj6Y&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=78", japanese_script: "", english_script: ""},
  {speaker_id: 18, language_id: 1, topic_id: 9, original_url: "https://www.youtube.com/watch?v=ka4KkU1LFJ0&list=PLgL8mKRDZ5BnxEYdtnCS9JVwF0fSFGPvC&index=77", japanese_script: "", english_script: ""},
  {speaker_id: 30, language_id: 2, topic_id: 15, original_url: "https://www.youtube.com/watch?v=P4LknBlOunA&index=1&list=PLgL8mKRDZ5BkJKgyc2nacM493TAvj6fLe", japanese_script: "", english_script: ""},
  {speaker_id: 32, language_id: 2, topic_id: 15, original_url: "https://www.youtube.com/watch?v=OXA9HKZlyXE&index=2&list=PLgL8mKRDZ5BkJKgyc2nacM493TAvj6fLe", japanese_script: "", english_script: ""},
  {speaker_id: 33, language_id: 2, topic_id: 15, original_url: "https://www.youtube.com/watch?v=owqja9rmBtY&index=3&list=PLgL8mKRDZ5BkJKgyc2nacM493TAvj6fLe", japanese_script: "", english_script: ""},
  {speaker_id: 34, language_id: 2, topic_id: 15, original_url: "https://www.youtube.com/watch?v=Tv9p9ytPeC0&index=4&list=PLgL8mKRDZ5BkJKgyc2nacM493TAvj6fLe", japanese_script: "", english_script: ""},
  {speaker_id: 33, language_id: 2, topic_id: 14, original_url: "https://www.youtube.com/watch?v=wSiUA8Pi1lo&index=5&list=PLgL8mKRDZ5BkJKgyc2nacM493TAvj6fLe", japanese_script: "", english_script: ""},
  {speaker_id: 35, language_id: 2, topic_id: 14, original_url: "https://www.youtube.com/watch?v=4VjApDf_tBo&index=6&list=PLgL8mKRDZ5BkJKgyc2nacM493TAvj6fLe", japanese_script: "", english_script: ""},
  {speaker_id: 1, language_id: 2, topic_id: 14, original_url: "https://www.youtube.com/watch?v=Vile8jWUN1s&index=7&list=PLgL8mKRDZ5BkJKgyc2nacM493TAvj6fLe", japanese_script: "", english_script: ""},
  {speaker_id: 2, language_id: 2, topic_id: 14, original_url: "https://www.youtube.com/watch?v=U0AkrDas6mY&index=8&list=PLgL8mKRDZ5BkJKgyc2nacM493TAvj6fLe", japanese_script: "", english_script: ""},
  {speaker_id: 32, language_id: 2, topic_id: 13, original_url: "https://www.youtube.com/watch?v=VBwA_9XJ1YE&index=10&list=PLgL8mKRDZ5BkJKgyc2nacM493TAvj6fLe", japanese_script: "", english_script: ""},
  {speaker_id: 33, language_id: 2, topic_id: 13, original_url: "https://www.youtube.com/watch?v=tT82WwZ6GoI&index=11&list=PLgL8mKRDZ5BkJKgyc2nacM493TAvj6fLe", japanese_script: "", english_script: ""},
  {speaker_id: 3, language_id: 2, topic_id: 13, original_url: "https://www.youtube.com/watch?v=vxHyPizmiBY&index=12&list=PLgL8mKRDZ5BkJKgyc2nacM493TAvj6fLe", japanese_script: "", english_script: ""},
  {speaker_id: 4, language_id: 3, topic_id: 15, original_url: "https://www.youtube.com/watch?v=59soEeBf_v4&index=1&list=PLgL8mKRDZ5BmBQcFgykA2qQq_W6ON6IOP", japanese_script: "", english_script: ""}
])
