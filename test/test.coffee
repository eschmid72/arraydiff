assert = require('chai').assert

join = (a) ->
  JSON.stringify a
joinS = (a) ->
  JSON.stringify a.sort()

arraydiff = require('../index').arraydiff

test = (a1, a2, left, both, right, union) ->
  _a1 = join a1
  _a2 = join a2
  _left = joinS left
  _both = joinS both
  _right = joinS right
  _union = joinS union
  describe "arraydiff ( #{_a1}, #{_a2} )", () ->
    r = arraydiff a1, a2
    it "result.left should be: #{_left}", ->
      assert.equal _left, join r.left
    it "result.both should be: #{_both}", ->
      assert.equal _both, join r.both
    it "result.right should be: #{_right}", ->
      assert.equal _right, join r.right
    it "result.union should be: #{_union}", ->
      assert.equal _union, join r.union

test [], [], [], [], [], []

a1 = ['A', 'B']
a2 = []
left = union = a1
right = both = a2
test a1, a2, left, both, right, union

a1 = []
a2 = ['A', 'B']
left = both = a1
right = union = a2
test a1, a2, left, both, right, union

a1 = ['A', 'B', 'C', 'D']
a2 = ['C', 'D', 'E', 'F']
left = ['A', 'B']
both = ['C', 'D']
right = ['E', 'F']
union = ['A', 'B', 'C', 'D', 'E', 'F']
test a1, a2, left, both, right, union

a1 = ['A', 'A', 'B', 'C', 'C', 'D']
a2 = ['C', 'D', 'D', 'E', 'F', 'F']
left = ['A', 'A', 'B', 'C']
both = ['C', 'D']
right = ['D', 'E', 'F', 'F']
union = ['A', 'A', 'B', 'C', 'C', 'D', 'D', 'E', 'F', 'F']
test a1, a2, left, both, right, union
