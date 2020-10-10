package com.example.calendar;

import java.util.Arrays;

public class TreeNode<E> {
    E element;
    TreeNode<E> left;
    TreeNode<E> right;

    public TreeNode(E e) {
        element = e;
    }

    public static TreeNode makeTree(Integer[] tree) {

        TreeNode[] treeNodes = new TreeNode[tree.length+1];

        for (int i=1;i<treeNodes.length;i++) {
            if (tree[i-1] == null) {
                treeNodes[i] = null;
            }
            else {
                treeNodes[i] = new TreeNode(tree[i-1]);
            }
        }

        TreeNode treeNode = null;
        for (int i=1;i<=treeNodes.length/2;i++) {
            treeNode = treeNodes[i];
            if (treeNode == null) continue;
            treeNode.left = treeNodes[2*i];
            if (2*i+1 < treeNodes.length) {
                treeNode.right = treeNodes[2*i+1];
            }
        }
        return treeNodes[1];

    }

    protected void preorder(TreeNode<E> root) {
        if (root == null) {
            return;
        }
        System.out.println(root.element + " ");

        preorder(root.left);
        preorder(root.right);
    }
}

class MyBinSearchTree<E extends Comparable<E>> {

    private TreeNode<E> root;

    public MyBinSearchTree() {

    }

    public boolean search(E e) {

        TreeNode<E> current = root;

        while (current != null) {
            if (e.compareTo(current.element) < 0) {
                current = current.left;
            }
            else if (e.compareTo(current.element) > 0) {
                current = current.right;
            }
            else {
                return true;
            }
        }
        return false;
    }

    public boolean insert(E e) {

        if (root == null) {
            root = createNewNode(e);
        }
        else {
            TreeNode<E> parent = null;
            TreeNode<E> current = root;

            while (current != null) {
                if (e.compareTo(current.element) < 0) {
                    parent = current;
                    current = current.left;
                }
                else if (e.compareTo(current.element) > 0) {
                    parent = current;
                    current = current.right;
                }
                else {
                    return false;
                }
            }

            if (e.compareTo(parent.element) < 0) {
                parent.left = createNewNode(e);
            }
            else {
                parent.right = createNewNode(e);
            }
        }

        return true;
    }



    protected TreeNode<E> createNewNode(E e) {
        return new TreeNode(e);
    }


    public boolean delete(E e) {
        TreeNode<E> parent = null;
        TreeNode<E> current = root;

        while (current != null) {
            if (e.compareTo(current.element) < 0) {
                parent = current;
                current = current.left;
            }
            else if (e.compareTo(current.element) > 0) {
                parent = current;
                current = current.right;
            }
            else {
                break;
            }
        }

        if (current == null) {
            return false;
        }

        if (current.left == null) {
            if (parent == null) {
                root = current.right;
            }
            else {
                if (e.compareTo(parent.element) <0 ) {
                    parent.left = current.right;
                }
                else {
                    parent.right = current.right;
                }
            }
        }
        else {
            TreeNode<E> parentOfRightMost = current;
            TreeNode<E> rightMost = current.left;

            while (rightMost.right != null) {
                parentOfRightMost = rightMost;
                rightMost = rightMost.right;
            }

            current.element = rightMost.element;

            if (parentOfRightMost.right == rightMost) {
                parentOfRightMost.right = rightMost.left;
            }
            else {
                parentOfRightMost.left = rightMost.left;
            }
        }
        return true;
    }
}


