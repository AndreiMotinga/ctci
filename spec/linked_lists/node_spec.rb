require_relative "../../linked_lists/node"

describe Node do
  it "is kind of Node" do
    expect(Node.new(1)).to be_instance_of Node
  end

  describe "#next" do
    it "can be updated" do
      node = Node.new(1)
      next_node = Node.new(2)

      node.next = next_node

      expect(node.next).to eq next_node
      expect(next_node.prev).to eq node
    end
  end

  describe "#prev" do
    it "can be updated" do
      node = Node.new(1)
      prev = Node.new(2)

      node.prev = prev

      expect(node.prev).to eq prev
      expect(prev.next).to eq node
    end
  end

  # ex: remove duplicates from an unsorted linked list.
  describe "#remove_dups" do
    it "removes nodes with duplicate values" do
      head = Node.generate_nodes([1, 3, 2, 2, 4, 3, 5])
      head.remove_dups
      # todo swap terms
      expected = Node.list(head)
      result = "1 -> 3 -> 2 -> 4 -> 5"

      expect(expected).to eq result
    end
  end

  describe "#remove" do
    context "when prev and next exist" do
      it "removes node by linking previous to the next" do
        prev = Node.new 1
        current = Node.new 2
        next_node = Node.new 3
        prev.next = current
        current.prev = prev
        current.next = next_node
        next_node.prev = current

        current.remove

        expect(prev.next).to eq next_node
        expect(next_node.prev).to eq prev
      end
    end

    context "when next doesn't exist" do
      it "links only previous" do
        prev = Node.new 1
        current = Node.new 2
        current.prev = prev

        current.remove

        expect(prev).to be_instance_of Node
        expect(prev.next).to eq nil
      end
    end

    context "when prev doesn't exist" do
      it "links only next" do
        current = Node.new 2
        next_node = Node.new 3
        current.next = next_node

        current.remove

        expect(next_node).to be_instance_of Node
        expect(next_node.prev).to eq nil
      end
    end
  end

  describe ".generate_nodes" do
    it "generates nodes from array of values returning head" do
      head = Node.generate_nodes([1, 2, 2, 2, 3, 4, 3, 5])

      expect(head.data).to eq 1
      expect(head.next.data).to eq 2
      expect(head.next.prev.data).to eq 1
    end
  end

  describe ".list" do
    it "print next nodes values joined with ' -> '" do
      head = Node.generate_nodes([1, 3, 5])

      result = "1 -> 3 -> 5"

      expect(Node.list(head)).to eq result
    end
  end

  describe ".to_last" do
    it "returns Nth element to last element of a SINGLY linked list" do
      head = Node.generate_nodes([1, 2, 3, 4, 5, 6, 7])

      result = Node.to_last(head, 3).data

      expect(result).to eq 5
    end
  end

  describe ".to_array" do
    it "converts list to array" do
      node = Node.new 1

      expect(Node.to_array(node)).to eq [node.data]
    end

    it "converts list to array" do
      arr = [1, 2, 3, 4, 5, 6, 7]

      head = Node.generate_nodes(arr)
      result = Node.to_array(head)

      expect(result).to eq arr
    end
  end

  describe ".list_size" do
    it "returns number of nodes in the list" do
      head = Node.generate_nodes([1, 2, 3, 4, 5, 6, 7])

      expect(Node.list_size(head)).to eq 7
    end
  end

  describe ".partition" do
    it "moves all nodes <= x to the left from x" do
      head = Node.generate_nodes([3, 5, 8, 5, 10, 2, 1])

      head = Node.partition(head, 5)
      result = Node.to_array(head).first 3

      expect(result).to eq [3, 2, 1]
    end
  end

  describe "#insert" do
    it "inserts node" do
      head = Node.generate_nodes([3, 8])
      node = Node.new 5

      head.insert(node)
      result = Node.to_array(head)

      expect(result).to eq [3, 5, 8]
    end
  end

  describe ".swap" do
    it "swaps places of two nodes" do
      head = Node.generate_nodes([1,2])
      node = Node.new(3)
      head.next.next = node  # list is 1 2 3

      Node.swap(head, node)
      result = Node.to_array(node)

      expect(result).to eq [3, 2, 1]
    end
  end
end
