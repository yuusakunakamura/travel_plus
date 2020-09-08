# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8

domestic = Trip.create(:name=>"国内")

hokkaidou = domestick.children.create(:name=>"北海道地方")

touhoku = domestick.children.create(:name=>"東北地方")

kanntou = domestick.children.create(:name=>"関東地方")

chuubu = domestick.children.create(:name=>"中部地方")

kinki = domestick.children.create(:name=>"近畿地方")

chuugoku = domestick.children.create(:name=>"中国地方")

sikoku = domestick.children.create(:name=>"四国地方")

kyuusyuu = domestick.children.create(:name=>"九州・沖縄地方")

hokkaidou.children.create([{:name=>"北海道"}])

touhoku.children.create([{:name=>"青森県"},{:name=>"岩手県"},{:name=>"宮城県"},{:name=>"秋田県"},{:name=>"山形県"},{:name=>"福島県"}])

kanntou.children.create([{:name=>"茨城県"},{:name=>"栃木県"},{:name=>"群馬県"},{:name=>"埼玉県"},{:name=>"千葉県"},{:name=>"東京都"},{:name=>"神奈川県"}])

chuubu.children.create([{:name=>"新潟県"},{:name=>"富山県"},{:name=>"石川県"},{:name=>"福井県"},{:name=>"長野県"},{:name=>"山梨県"},{:name=>"岐阜県"},{:name=>"静岡県"},{:name=>"愛知県"}])

kinki.children.create([{:name=>"三重県"},{:name=>"滋賀県"},{:name=>"京都府"},{:name=>"大阪府"},{:name=>"兵庫県"},{:name=>"奈良県"},{:name=>"和歌山県"}])

chuugoku.children.create([{:name=>"鳥取県"},{:name=>"島根県"},{:name=>"岡山県"},{:name=>"広島県"},{:name=>"山口県"}])

sikoku.children.create([{:mame=>"徳島県"},{:mame=>"佐賀県"},{:mame=>"長崎県"},{:mame=>"熊本県"},{:mame=>"大分県"},{:mame=>"宮崎県"},{:mame=>"鹿児島県"},{:mame=>"沖縄県"}])



