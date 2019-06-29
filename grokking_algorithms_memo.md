# grokking_algorithmsメモ

## 進捗

ch1(p2)

(注)全 11 Chapters

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
pxv
>  Also, at the risk of stating the obvious, I’m a visual learner.

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
* `recap [ríːkæp]` 要約する

### 文

p19
> One final note: if you’re an advanced reader, check out binary search trees! There’s a brief description of them in the last chapter.

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

### 文

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

### 文

p42
> Suppose you’re throwing a barbecue. You keep a todo list for the barbecue, in the form of a stack of sticky notes.
p43
> `print` is a function in Python, but to make things easier for this example, we’re pretending it isn’t. Just play along.
p44
> Now that you’re done with the greet2 function, you’re back to the greet function, and you pick up where you left off.

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

