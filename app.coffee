timers = []
nums = []

# 初期メソッド
startSlot = ->
  document.getElementById("start-btn").removeEventListener "click", startSlot

  runSlot 0
  runSlot 1
  runSlot 2

  # クリックイベント
  document.getElementById("stop-btn1").addEventListener "click", ((e) ->
    self = this
    stopSlot self
    this.removeEventListener "click", arguments.callee
  )
  document.getElementById("stop-btn2").addEventListener "click", (->
    self = this
    stopSlot self
    this.removeEventListener "click", arguments.callee
  )
  document.getElementById("stop-btn3").addEventListener "click", (->
    self = this
    stopSlot self
    this.removeEventListener "click", arguments.callee
  )

# ストップメソッド
stopSlot = (self) ->
  str = self.getAttribute "id"
  n = str.replace "stop-btn", ""
  clearTimeout timers[n - 1]
  nums.push +document.getElementById('num' + n).innerHTML

  checkSlot() if nums.length == 3

# チェックメソッド
checkSlot = ->
  nums.sort()

  if nums[0] == nums[1] == nums[2]
    alert "全部揃った！"
  else if nums[0] == nums[1] || nums[1] == nums[2]
    alert "2つ揃った！"
  else
    alert "残念"

  nums = []
  document.getElementById("start-btn").addEventListener "click", startSlot

# 実行メソッド
runSlot = (n) ->
  document.getElementById('num' + (n + 1)).innerHTML = Math.floor(Math.random() * 10)
  clearTimeout(timers[n]) if(timers[n])
  timers[n] = setInterval ->
    runSlot n
  , 50

# スタート
startSlot()
