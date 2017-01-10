require_relative "../../linked_lists/node"

describe Node do
  it "is kind of Node" do
    expect(Node.new(1)).to be_instance_of Node
  end

  describe "#value" do
    it "can be updated" do
      node = Node.new(4)
      node.value = 5

      expect(node.value).to eq 5
    end
  end

  describe "#next" do
    it "can be updated" do
      node = Node.new(1)
      next_node = Node.new(2)

      node.next = next_node

      expect(node.next).to eq next_node
    end
  end

  describe "#prev" do
    it "can be updated" do
      node = Node.new(1)
      prev = Node.new(2)

      node.prev = prev

      expect(node.prev).to eq prev
    end
  end

  # ex: remove duplicates from an unsorted linked list.
  # describe "#remove_dups" do
  #   it "removes nodes with duplicate values" do
  #     head = Node.generate_nodes([1,2,2,2,3,4,3,5])
  #
  #     expect(head)
  #   end
  # end

  describe ".generate_nodes" do
    it "generates nodes from array of values returning head" do
      head = Node.generate_nodes([1,2,2,2,3,4,3,5])

      expect(head.value).to eq 1
      expect(head.next.value).to eq 2
      expect(head.next.prev.value).to eq 1
    end
  end

  describe "#print_nodes" do
    it "print next nodes values joined with ' -> '" do
      head = Node.generate_nodes([1,3,5])

      result = "1 -> 3 -> 5"

      expect(head.print_nodes).to eq result
    end
  end
end
