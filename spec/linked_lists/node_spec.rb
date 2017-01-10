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
    end
  end
end