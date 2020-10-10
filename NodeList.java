package com.example.calendar;

class Node<E> {
    E item;
    Node<E> next;

    Node(E element) {
        this.item = element;
        this.next = null;
    }
}

public class NodeList<E> {
    Node<E> head = null;
    Node<E> tail = null;

    NodeList(E element) {
        this.head = new Node<>(element);
        this.tail = this.head;
    }

    public void addNodel(E element) {
        tail.next = new Node<>(element);

        tail = tail.next;
    }

    public void printList() {
        Node<String> current = (Node<String>) head;
        while (current != null) {
            System.out.println(current.item);
            current = current.next;
        }
    }

    public void printListRev(Node<E> head) {
        if (head != null) {
            printListRev(head.next);
            System.out.println(head.item);
        }
    }

    public Node<E> revList(Node<E> head) {
        if (head == null) {
            return null;
        }

        Node<E> nodeResult = null;
        Node<E> nodePre = null;
        Node<E> current = head;

        while (current != null) {
            Node<E> nodeNext = current.next;
            if (nodeNext == null) {
                nodeResult = current;
            }

            current.next = nodePre;
            nodePre = current;
            current = nodeNext;
        }
        return nodeResult;
    }
}
