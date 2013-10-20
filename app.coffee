timers = []
nums = []

# 初期メソッド
startSlot = ->
  document.getElementById("start-btn").removeEventListener "click", startSlot

  runSlot 0
  runSlot 1
  runSlot 2

  # クリックイベント
  document.getElementById("stop-btn0").addEventListener "click", (->
    stopSlot 0
    this.removeEventListener "click", arguments.callee
  )
  document.getElementById("stop-btn1").addEventListener "click", (->
    stopSlot 1
    this.removeEventListener "click", arguments.callee
  )
  document.getElementById("stop-btn2").addEventListener "click", (->
    stopSlot 2
    this.removeEventListener "click", arguments.callee
  )

# ストップメソッド
stopSlot = (n) ->
  clearTimeout timers[n]
  nums.push +document.getElementById('num' + n).innerHTML

  checkSlot() if nums.length == 3

# チェックメソッド
checkSlot = ->
  nums.sort()

  if nums[0] == nums[1] && nums[0] == nums[2] && nums[1] == nums[2]
    alert "全部揃った！"
  else if nums[0] == nums[1] || nums[1] == nums[2]
    alert "2つ揃った！"
  else
    alert "残念"

  nums = []
  document.getElementById("start-btn").addEventListener "click", startSlot

# 実行メソッド
runSlot = (n) ->
  document.getElementById('num' + n).innerHTML = Math.floor(Math.random() * 10)
  clearTimeout(timers[n]) if(timers[n])
  timers[n] = setInterval ->
    runSlot n
  , 50

# スタート
startSlot()
