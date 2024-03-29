# grokking_algorithmsメモ

## ch0

### 単語

* `impenetrable` 解せない
* `savor [séɪvə]` (ゆっくり)味わう
* `dense` 濃い、理解しにくい
* `stuff` 材料、資料
* `concurrency` 並行性
* `mediocre [mìːdióʊkə]` 平凡
* `gloss over` ごまかす
* `scratch` 引っ掻く
* `itch` かゆみ、むずむず
* `kudos [ kúːdɔs]` 賛辞
* `leap` 飛躍
* `assumption` 仮定、推定
* `chock-full` いっぱいの
* `curate` 必要な情報をたくさんの情報源から収集、整理、要約、公開する
* `recursion` 再帰
* `come across` 遭遇する
* `divide-and-conquer (method)` 分割統治法(そのままでは解決できない大きな問題を小さな問題に分割し、その全てを解決することで、最終的に最初の問題全体を解決する、という問題解決の手法)
* `breadth` 幅
* `verbatim [vəːrbéitəm]` 逐語的に
* `retain` 保持する
* `annotation` 注釈
* `conduct` 行動
* `venue` 会場
* `lest` 〜しないように
* `stray` 離れる、脱線する
* `in print` 印刷中

### 文

pxv
>  Instead of writing symbol soup, my goal is to make it easy for you to visualize these concepts.

=> 記号を並べ立てるのではなく、

pxv
>  Also, at the risk of stating the obvious, I’m a visual learner.

=> くどいようですが、分かりきったことを言いますが

## ch1

### 単語

* `bit` 断片
* `grasp` 把握
* `in a timely manner` はやく、適時に
* `flip` 弾く、ひっくり返す
* `threshold` しきい値
* `Big O notation` ランダウの漸近記法(Landau asymptotic notation)。「程度」を意味するorderから。
* `reassurance` 安心、再保険
* `neatly` きちんと、ぴったり
* `takeaway` 持ち帰り
* `collapse` 崩壊する
* `appalling [əpɔ́ːliŋ]` 驚愕の、最悪の
* `recap [ríːkæp]` 要約する

### コード

01_binary_search
```rb
def binary_search(list, item)
  # positions to search.
  low  = 0
  high = list.length - 1

  while low <= high
    mid   = (low + high) / 2
    guess = list[mid]

    if guess == item
      return mid
    elsif guess > item
      high = mid - 1
    else
      low = mid + 1
    end
  end

  return nil
end

list = [1, 3, 5, 7, 9]
puts binary_search(list, 3) #=> 1

# We need to use .inspect here to print nil.
puts binary_search(list, -1).inspect #=> nil
```

## ch2

### 単語

* `crucial` 極めて重要な
* `monsieur [məsjˈəː]` 紳士(フランス語)
* `contiguously [kəntígjuəs]` 連続して
* `take up` 取り上げる
* `workaround` 回避策
* `stick` 貼る
* `scummy [skˈʌmi]` 怖い
* `tactic` 戦術
* `villain [vílən]` 悪党
* `in a (flat) spin` 混乱状態で
* `gist` 要旨
* `strewn [ˈstrʊən]` ばらばらの、strew(撒き散らす)の過去分詞

### コード

02_selection_sort
```rb
# Finds the smallest value in an array
def find_smallest(arr)
  smallest = arr[0]
  smallest_index = 0
  (1...(arr.length)).each do |i|
    if arr[i] < smallest
      smallest = arr[i]
      smallest_index = i
    end
  end
  smallest_index
end

# Sort array
def selection_sort(arr)
  new_arr = []
  arr.length.times do
    # Finds the smallest element in the array and adds it to the new array
    smallest = find_smallest(arr)
    new_arr.push(arr.delete_at(smallest))
  end
  new_arr
end

p selection_sort([5, 3, 6, 2, 10])
```

## ch3

### 単語

* `divisive [dɪvάɪsɪv]` 不和を起こさせる
* `pseudo [súːdou]` 疑似の
* `attic` 屋根裏
* `a pile of` 山積みの
* `call stack` プログラムで実行中のサブルーチンに関する情報を格納するスタックである。 実行中のサブルーチンとは、呼び出されたが処理を完了していないサブルーチンを意味する。([Wikipedia](https://ja.wikipedia.org/wiki/%E3%82%B3%E3%83%BC%E3%83%AB%E3%82%B9%E3%82%BF%E3%83%83%E3%82%AF))
* `stack` 積む
* `take off` はずす、取り除く
* `take up` 取り上げる
* `tail recursion` [末尾再帰](https://ja.wikipedia.org/wiki/%E6%9C%AB%E5%B0%BE%E5%86%8D%E5%B8%B0)

### 文

p42
> Suppose you’re throwing a barbecue. You keep a todo list for the barbecue, in the form of a stack of sticky notes.

=> バーベキューの準備をしているとしましょう。

p43
> `print` is a function in Python, but to make things easier for this example, we’re pretending it isn’t. Just play along.

=> `print`はメソッド呼び出しだが、その分のコールスタックは無視して説明しているということ。

### コード

03_box_searching
```rb
# While approach
def look_for_key(main_box)
  pile = main_box.make_a_pile_to_look_through
  while !pile.empty?
    box = pile.grab_a_box
    box.each do |item|
      if item.is_a_box?
        pile.push(item)
      elsif item.is_a_key?
        puts "found the key!"
      end
    end
  end
end

# Recursion approach
def look_for_key(box)
  box.each do |item|
    if item.is_a_box?
      look_for_key(item) # Recursion
    elsif item.is_a_key?
      puts "found the key!"
    end
  end
end
```

03_countdown
```ruby
def countdown(i)
  puts i
  # Base case
  if i <= 0 
    return
  # Recursive case
  else
    countdown(i-1)
end

countdown(5)
```

03_call_stack
```rb
def greet(name)
  puts "hello, #{name}!"
  greet2(name)
  end
  puts "getting ready to say bye..."
  bye
end

def greet2(name)
  puts "how are you, #{name}?"
end

def bye
  puts "ok! bye!"
end

greet("Maggie")
```

03_factorial
```rb
def fact(x)
  if x == 1
    return 1
  else
    return x * fact(x-1)
  end
end

fact(5)
```

## ch4

### 単語

* `meat` 肉、内容、実質
* `stump` 悩ます、困らせる
* `plot` 小区画の地所
* `evenly` むらなく
* `stuck` 行き詰まった
* `sneak` コソコソする
* `sneak peak` 先行上映
* `nicety` 正確さ、機微
* `partition` 分割
* `inductive` 帰納的
* `rung` (はしごなどの)横木、段
* `hand in hand` 協力して
* `way` はるかに、うんと
* `multiplication` 掛け算

### 文

p54
>  If you find the biggest box that will work for this size, that will be the biggest box that will work for the entire farm.

=> このサイズに合った最大のボックスを見つけたら、それが農場全体にとっても最適な最大のボックスになるでしょう。

### コード

04_
```rb
# ユークリッドの互除法
def euclid(smaller, larger)
  mod = larger % smaller
  return smaller if mod == 0
  return euclid(mod, smaller)
end

euclid(1680, 640)

# Recursive sum
def sum(arr)
  return 0 if arr.empty?
  return arr.shift + sum(arr)
end

sum([1,2,3,4])

# Recursive count
def count(list)
  return 0 if list.empty?
  return 1 + count(list[1..-1])
end

count([1]*10)

# Recursive max
def max(list)
  return -Float::INFINITY if list.empty?
  first = list.shift
  remaining_max = max(list)
  return first > remaining_max ? first : remaining_max
end

max([1,3,5,7,2])

# Recursive binary search
#TODO 存在しない場合の例外処理ができていない
def binary_search(list, answer, index=0)
  row  = 0
  high = list.length - 1
  mid  = (row + high) / 2
  mid_value = list[mid]
  return nil if list.empty?
  if answer == mid_value
    return index + mid
  elsif answer < mid_value
    binary_search(list[0..(mid-1)], answer, index)
  elsif answer > mid_value
    binary_search(list[(mid+1)..-1], answer, index + mid + 1)
  end
end

binary_search([1, 3, 5, 7, 9], 3)
```

04_quicksort
```rb
def quicksort(arr)
  return arr if arr.length < 2
  pivot = arr[0]
  smaller = arr.select{|element| element < pivot}
  larger  = arr.select{|element| element > pivot}
  same    = arr.select{|element| element == pivot}
  return quicksort(smaller) + same + quicksort(larger)
end

quicksort([5,2,1,7,10,9,11,100,17])
```

## ch5

### 単語

* `collision [kəlíʒən]` 衝突
* `produce` 作物
* `darn` とても、ひどく
* `steam up` 怒る、怒らせる
* `buddy` 仲間
* `discernable [disə́ːrn]` 認識できる
* `map` 写像する
* `booth` 屋台店、小屋
* `niece` 姪
* `tailor` 仕立てる
* `Terms and Conditions` 規約と条件
* `white lie` 罪のない嘘
* `work around` 回避する
* `peek` ちらっと覗く
* `a rule of thumb` 経験則
* `business` 取引
* `beard` 髭

### 文

p75
> Let’s put on our data structure hats.

=> `put on one's hats` 〜の立場に立って考える

### コード

05_vote
```rb
@voted = {}

def check_voter(name)
  if @voted.key?(name)
    puts "kick them out."
  else
    @voted[name] = true
    puts "let them vote!"
  end
end

check_voter("tom")
check_voter("mike")
check_voter("mike")
```

05_cache
```rb
@cache = {}

def get_page(url)
  if cache.key?(url)
    return cache[url]
  else
    data = get_data_from_server(url)
    chache[url] = data
    return data
  end
end
```

## ch6

### 単語

* `topological` 位相幾何学の
* `breadth [brédθ]` 幅
* `radiate` 放射状に伸びる
* `queue` 列、並ぶ
* `double-ended` 両端の
* `vertice` 頂点


### 文

p98
> For example, suppose you and your friends are playing poker, and you want to model who owes whom money. 

=> 誰が誰にいくら借りがあるか。

p 107
>  In Python, you use the double-ended queue (deque) function for this:

=> 両端キューであるdequeを使います。

### コード

06_breadth_first_search
```rb
@graph = {}
@graph["you"]    = ["alice", "bob", "claire"]
@graph["bob"]    = ["anuj", "peggy"]
@graph["alice"]  = ["peggy"]
@graph["claire"] = ["thom", "jonny"]
@graph["anuj"]   = ["bob"]
@graph["peggy"]  = []
@graph["thom"]   = []
@graph["jonny"]  = []

def mango_seller?(name)
  name[-1] == "m"
end
def search(name)
  search_queue = []
  search_queue += @graph[name]
  searched = []
  while !search_queue.empty?
    person = search_queue.shift
    if !searched.include?(person)
      if mango_seller?(person)
        return "#{person} is a mango seller!"
      else
        search_queue += @graph[person]
        searched << person
      end
    end
  end
  return "No mango seller."
end

search("you")
```

## ch7

### 単語

* `Dijkstra’s algorithm` [ダイクストラ法](https://ja.wikipedia.org/wiki/%E3%83%80%E3%82%A4%E3%82%AF%E3%82%B9%E3%83%88%E3%83%A9%E6%B3%95)
* `segment` 区切り
* `put down` 置く
* `acyclic` 非環式の
* `I've been meaning to` ずっと～しようと思っていた
* `dough [dóu]` パン生地、金銭
* `red flag` (危険・警戒・停止信号としての)赤旗
* `Bellman–Ford algorithm` [ベルマン–フォード法](https://ja.wikipedia.org/wiki/%E3%83%99%E3%83%AB%E3%83%9E%E3%83%B3%E2%80%93%E3%83%95%E3%82%A9%E3%83%BC%E3%83%89%E6%B3%95)

### コード

07_dijkstras_algorithm
```rb
@graph = {
  start:{ a:   2,
          b:   6 },
  a:    { fin: 1 },
  b:    { a:   3,
          fin: 5 },
  fin:  {}
}

@costs = {
  a: 6,
  b: 2,
  fin: Float::INFINITY
}

@parents = {
  a:  :start,
  b:  :start,
  fin: nil
}

@processed = []

def find_lowest_cost_node(costs)
  min = @costs.select{|node,cost| !@processed.include?(node)}.
               min_by{|node, cost| cost}
  min[0] if !min.nil?
end

def dijkstra
  node = find_lowest_cost_node(@costs)
  while !node.nil?
    cost = @costs[node]
    neighbors = @graph[node]
    neighbors.each do |n, c|
      new_cost = cost + neighbors[n]
      if @costs[n] > new_cost
        @costs[n]   = new_cost
        @parents[n] = node
      end
    end
    @processed << node
    node = find_lowest_cost_node(@costs)
  end
end

dijkstra
puts @costs
puts @parents
```

## ch8

### 単語

* `loot` 略奪
* `takeaway` 持ち帰り
* `power set` 冪集合
* `at right` 右記
* `on ramp` 進入路
* `FedEx` 国際輸送サービスを提供する航空貨物輸送会社
* `flown` flyの過去分子 
* `NP-complete problem` NP完全問題(Non-deterministic Polynomial)
* `giveaways` プレゼント、景品
* `set-covering problem` [集合被覆問題](https://ja.wikipedia.org/wiki/%E9%9B%86%E5%90%88%E8%A2%AB%E8%A6%86%E5%95%8F%E9%A1%8C)
* `clique` (排他的な)徒党、派閥
* `adjacent` 隣接した
* `optimum` 最適

### 文

p152
> *EXERCISES*
> For each of these algorithms, say whether it’s a greedy algorithm or not.
> * 8.3 Quicksort
> * 8.4 Breadth-first search
> * 8.5 Dijkstra’s algorithm

### コード

08_greedy_algorithm
```rb
states_needed = ["mt", "wa", "or", "id", "nv", "ut", "ca", "az"]
stations = {
  "kone"   => ["id", "nv", "ut"],
  "ktwo"   => ["wa", "id", "mt"],
  "kthree" => ["or", "nv", "ca"],
  "kfour"  => ["nv", "ut"],
  "kfive"  => ["ca", "az"]
}
final_stations = []

while !states_needed.empty?
  best_station = nil
  states_covered = []
  stations.each do |station, covered_by_station|
    covered = states_needed & covered_by_station
    if covered.size > states_covered.size
      best_station   = station
      states_covered = covered
    end
  end
  states_needed -= states_covered
  final_stations << best_station
end

puts final_stations
```

## ch9

### 単語

* `address` 説明する、処理する
* `FAQ` Frequently Asked Questions
* `granularity [gr'ænjʊlˈærəṭi]` 粒度
* `lentils` レンズ豆
* `runs out` なくなる、尽きる
* `quinoa` キノア
* `itinerary [aitínərèri]` 旅程
* `discrete` 個別の、離散の
* `axis [ǽksis]` 軸。複数形は`axes [ˈæksiːz]`
* `whew [hwjuː]` うわー
* `strand` より糸
* `cure` 治療
* `sclerosis` 硬化症
* `word wrap` 文章の折り返し

### 文

p177
> Is it possible that the solution will require more than two sub-knapsacks?

=> ダイナミックプログラミングでは、多くとも2つのサブプロブレムを使うことしかないが、そのサブプロブレムが下位のサブプロブレムを内包していることはある。

p181
> Computer scientists are a fun bunch!

=> コンピュータ科学者というのは愉快な連中なのです。

### コード

## ch10

### 単語

* `classification` 分類
* `extraction` 抽出
* `coordinate` 座標
* `cheesy` 安っぽい
* `choosy` よいものだけを選ぶ、好みのうるさい
* `loaf/loaves [lóuf]` 大きなパンのひと塊
* `conservative` 保守的な
* `skewed` 歪んだ
* `OCR` optical character recognition
* `optical` 視覚的な
* `naive` 素朴な

## ch11

### 単語

* `frequency` 周波数
* `treble` 高音
* `note` 音、音符
* `run into` ぶつかる、突き当たる
* `bloom` 花
* `Reddit` 英語圏のウェブサイト。ニュース記事、画像のリンクやテキストを投稿し、コメントをつけることが可能。
* `malicious` 悪意のある
* `SHA` [Secure Hash Algorithm](https://ja.wikipedia.org/wiki/Secure_Hash_Algorithm)
* `foolproof` 絶対確実
* `Scribd` デジタルライブラリ、電子書籍、オーディオブック購読サービス
* `cipher [sáifər]` 暗号、エンコード
* `heck` 一体、とんでもない
* `brute-force` 強引な
* `gibberish` ちんぷんかんぷん
* `tote` 運ぶ、背負う
* `blow one's mind` 度肝を抜く
* `simplex method` [シンプレックス法](https://ja.wikipedia.org/wiki/%E3%82%B7%E3%83%B3%E3%83%97%E3%83%AC%E3%83%83%E3%82%AF%E3%82%B9%E6%B3%95)

### 文

[Bloom filters](https://ja.wikipedia.org/wiki/%E3%83%96%E3%83%AB%E3%83%BC%E3%83%A0%E3%83%95%E3%82%A3%E3%83%AB%E3%82%BF)がよくわからない。

p213
> Just like bloom filters, it won’t give you an exact answer, but it comes very close and uses only a fraction of the memory a task like this would otherwise take.

=> ブルームフィルタと同様に、正確な答えは返さないものの、非常に近い答えを返します。そして本来ならこのようなタスクに必要となるメモリのごく一部しか使いません。