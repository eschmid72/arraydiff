assert = require('chai').assert

join = (a) ->
  JSON.stringify a

arraydiff = require('../index').arraydiff

empty = []
a1 = ['A', 'B', 'C', 'D']
a2 = ['C', 'D', 'E', 'F']
left = ['A', 'B']
both = ['C', 'D']
right = ['E', 'F']
union = ['A', 'B', 'C', 'D', 'E', 'F']#

_empty = join empty
_a1 = join a1
_a2 = join a2
_both = join both
_right = join right
_left = join left
_union = join union

describe "arraydiff #{_empty}, #{_empty}", () ->
  r = arraydiff empty, empty
  it "left should be #{_empty}", ->
    assert.equal _empty, join r.left
  it "both should be #{_empty}", ->
    assert.equal _empty, join r.both
  it "right should be #{_empty}", ->
    assert.equal _empty, join r.right
  it "union should be #{_empty}", ->
    assert.equal _empty, join r.union

describe "arraydiff #{_a1}, #{_empty}", () ->
  r = arraydiff a1, empty
  it "left should be #{_a1}", ->
    assert.equal _a1, join r.left
  it "both should be #{_empty}", ->
    assert.equal _empty, join r.both
  it "right should be #{_empty}", ->
    assert.equal _empty, join r.right
  it "union should be #{_a1}", ->
    assert.equal _a1, join r.union

describe "arraydiff #{_empty}, #{_a2}", () ->
  r = arraydiff empty, a2
  it "left should be #{_empty}", ->
    assert.equal _empty, join r.left
  it "both should be #{_empty}", ->
    assert.equal _empty, join r.both
  it "right should be #{_a2}", ->
    assert.equal _a2, join r.right
  it "union should be #{_a2}", ->
    assert.equal _a2, join r.union

describe "arraydiff #{_a1}, #{_a2}", () ->
  r = arraydiff a1, a2
  it "left should be #{_left}", ->
    assert.equal _left, join r.left
  it "both should be #{_both}", ->
    assert.equal _both, join r.both
  it "right should be #{_right}", ->
    assert.equal _right, join r.right
  it "union should be #{_union}", ->
    assert.equal _union, join r.union
