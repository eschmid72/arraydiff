module.exports = (array) ->
  l = array.length
  r = Array(l)
  i = 0
  while i < l
    r[i] = array[i++]
  r
