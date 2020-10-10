package com.example.calendar;

public class MyClass {

    public static void main(String[] args) {
        Integer[] integers = {1,2,3,4,5,6,7,8,9,10};
        TreeNode treeNode = TreeNode.makeTree(integers);

        MyBinSearchTree myBinSearchTree = new MyBinSearchTree();
        for (int i=0; i<integers.length;i++) {
            myBinSearchTree.insert(integers[i]);
        }

        if (myBinSearchTree.search(3)) {
            System.out.println("asd");
        }

//        treeNode.preorder(treeNode);
    }

}
