/*
Implement a Linked List
A linked list a fundamental data structure in computer science. Linked data structures are used in heaps,
 graphs and trees.
In this problem you need to implement a basic singly linked list. You are given a class and basic method 
signatures as well as a Node class. You will need to implement the following...
A constructor to set the initial state of the class
The method addToFront() it accepts an integer and puts it at the front of the list. This should be a 
constant time operation.
the method removeFromFront(). This removes the element at the front of the list and returns its value. 
It should be a constant time operation. If the list is empty return null
The method size(). This should return the current size of the list
The method addToTail(). This adds an element to the end of the list. See if you can find a way to do it 
in constant time as a challenge
The method removeFromTail(). Remove the last element in the list and return its value. 
If the list is empty return null


*/

public class LinkedList{

    public Node head {get;set;}
    public Node tail {get;set;}
    public Integer size {get;set;}

    public LinkedList(){
        this.head = null;
        this.tail = null;
        this.size = 0;
    }

    public void addToFront(Integer value){
        Node newNode = new Node(value);
        if(this.head == null){
            this.head = newNode;
            this.tail = this.head;
        }else{
            newNode.next = this.head;
            this.head = newNode;
        }
        this.size++;
    }

    public Integer removeFromFront(){
        if(this.size > 0){
            Node remove = this.head;
            this.head = this.head.next;
            this.size--;
            return remove.data;
        }
        return null;
    }

    public void addToTail(Integer value){
        Node newNode = new Node(value);
        if(this.head == null){
            this.head = newNode;
            this.tail = this.head;
        }else{
            this.tail.next = newNode;
            this.tail = newNode;
        }
        this.size++;
    }

    public Integer removeFromTail(){
        if(this.size > 0){
            if(this.size == 1){
                Node temp = this.head;
                this.head = null;
                this.size--;
                return temp.data;
            }

            Node current = this.head;
            Node newTail = null;
            while(current.next != null){
                newTail = current;
                current = current.next;
            }

            this.tail = newTail;
            tail.next = null;
            this.size--;
            return current.data;
        }
        return null;
    }

    public Integer size(){
        return this.size;
    }
}

public class Node{
    Integer data {get;set;}
    Node next;

    public Node(Integer data){
        this.data = data;
    }
}