# https://leetcode.com/problems/tree-node/description/

# Table: Tree

# +-------------+------+
# | Column Name | Type |
# +-------------+------+
# | id          | int  |
# | p_id        | int  |
# +-------------+------+
# id is the column with unique values for this table.
# Each row of this table contains information about the id of a node and the id of its parent node in a tree.
# The given structure is always a valid tree.
 

# Each node in the tree can be one of three types:

# "Leaf": if the node is a leaf node.
# "Root": if the node is the root of the tree.
# "Inner": If the node is neither a leaf node nor a root node.
# Write a solution to report the type of each node in the tree.

# Return the result table in any order.

# Write your MySQL query statement below
SELECT
 t1.id,
 CASE
    WHEN t1.p_id IS NULL THEN 'Root'
    WHEN t1.id = t2.p_id AND t1.p_id IS NOT NULL THEN 'Inner'
    WHEN t2.id IS NULL THEN 'Leaf'
 END AS type
FROM Tree AS t1
LEFT JOIN Tree AS t2
ON t1.id = t2.p_id
GROUP BY t1.id;