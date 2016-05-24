random = require './random'

module.exports = (array) ->
  n = array.length
  l = n-1
  i = 0
  while i < l
    r = random n--
    a = array[r]
    array[r] = array[i]
    array[i] = a
    i++
  array
