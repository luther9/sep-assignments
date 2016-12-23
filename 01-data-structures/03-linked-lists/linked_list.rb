require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if tail
      tail.next = node
    else
      @head = node
    end
    @tail = node
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    delete(tail)
  end

  # This method prints out a representation of the list.
  def print node=head
    if node
      puts(node.data)
      print(node.next)
    end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if head
      if node == head
        @head = head.next
        if node == tail
          @tail = nil
        end
      else
        find_delete(head, node)
      end
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if !head
      @tail = node
    end
    node.next = head
    @head = node
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    delete(head)
  end

  private

  # Starting from `current.next`, searches for `node` and deletes it. Sets @tail
  # accordingly.
  def find_delete current, node
    if current.next == node
      current.next = current.next.next
      if node == tail
        @tail = current
      end
    else
      find_delete(current.next, node)
    end
  end
end
