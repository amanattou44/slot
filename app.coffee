timers = []
nums = []
stopCount = 0

# 初期メソッド
startSlot = ->
  for key in timers
    console.log key
    return unless key?

  runSlot 0
  runSlot 1
  runSlot 2

# ストップメソッド
stopSlot = (n) ->
  clearTimeout timers[n]
  unless nums[n]
    nums[n] = document.getElementById('num' + n).innerHTML
    stopCount++

  checkSlot() if stopCount == 3

# チェックメソッド
checkSlot = ->
  return unless nums
  return unless nums.length == 3

  nums.sort

  if nums[0] == nums[1] && nums[0] == nums[2]
    alert "全部揃った！"
  else if nums[0] == nums[1] || nums[1] == nums[2]
    alert "2つ揃った！"
  else
    alert "残念"

# 実行メソッド
runSlot = (n) ->
  document.getElementById('num' + n).innerHTML = Math.floor(Math.random() * 10)
  timers[n] = setTimeout ->
    runSlot n
  , 50

# スタート
startSlot()

# クリックイベント
document.getElementById("stop-btn0").onclick = ->
  stopSlot 0

document.getElementById("stop-btn1").onclick = ->
  stopSlot 1
 
document.getElementById("stop-btn2").onclick = ->
  stopSlot 2

document.getElementById("start-btn").onclick = ->
  startSlot()
