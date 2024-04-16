# What does shift do in the following code? How can we find out?

hash = { a: 'ant', b: 'bear' }
hash.shift

# According to documentation, the Hash#shift value does the following:

# Removes the first hash entry (see Entry Order); returns a 2-element Array 
# containing the removed key and value. Returns nil if the hash is empty.

# Similar to the Array#shift method, the first k-v pair is removed and returned.
# Unlike arrays, hashes are not indexed by integer values, so it removes based
# on the order items were added to the hash, rather than any index or key value.
# In this case, hash.shift will remove the key :a and its associated value 'ant'
# and return [:a, 'ant']. 