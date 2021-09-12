class Node {
  constructor(val) {
    this.value = val;
    this.left = null;
    this.right = null;
  }
}

class BinarySearchTree {
  constructor() {
    this.root = null;
  }

  insert(value) {
    let newNode = new Node(value);
    if (!this.root) {
      this.root = newNode;
      return this;
    }

    let current = this.root;
    while (true) {
      if (value === current.value) {
        return undefined;
      }
      if (value < current.value) {
        if (current.left === null) {
          current.left = newNode;
          return this;
        } else {
          current = current.left;
        }
      } else if (value > current.value) {
        if (current.right === null) {
          current.right = newNode;
          return this;
        } else {
          current = current.right;
        }
      }
    }
  }

  find(value, node = this.root) {
    if (!node) {
      return false;
    }
    if (node.value === value) return node;
    if (value < node.value && node.left) {
      return find(value, node.left);
    }
    if (value > node.value && node.right) {
      return find(value, node.right);
    }
  }
}

tree = new BinarySearchTree();

tree.insert(10);
tree.insert(5);
tree.insert(10);
tree.insert(15);
tree.insert(8);
tree.insert(3);
tree.insert(20);

tree.find(3);
