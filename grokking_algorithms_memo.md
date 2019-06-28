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



### 文



### コード