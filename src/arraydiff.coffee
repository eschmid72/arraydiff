it = (a) ->
  i = 0
  a = a.sort()
  () -> a[i++]

module.exports = (array1, array2) ->
  next1 = it(array1)
  next2 = it(array2)
  left = []
  both = []
  right = []
  union = []

  i1 = next1()
  i2 = next2()

  while i1 != undefined || i2 != undefined
    if i2 == undefined || i1 < i2
      left.push i1
      union.push i1
      i1 = next1()
    else if i1 == i2
      both.push i1
      union.push i1
      i1 = next1()
      i2 = next2()
    else if i1 == undefined || i1 > i2
      right.push i2
      union.push i2
      i2 = next2()
  left: left, both: both, right: right, union: union
