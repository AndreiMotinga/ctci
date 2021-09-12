class MaxBinaryHeap {
  constructor() {
    this.values = [9, 8, 7, 5, 6, 3, 4];
  }

  insert(element) {
    let values = this.values;
    values.push(element);
    let elementIndex = this.values.length - 1;
    let parentIndex = Math.floor((elementIndex - 1) / 2);
    while (values[elementIndex] > values[parentIndex]) {
      let temp = values[parentIndex];
      values[parentIndex] = element;
      values[elementIndex] = temp;
      elementIndex = parentIndex;
      parentIndex = Math.floor((elementIndex - 1) / 2);
    }
    return values;
  }

  remove() {
    let values = this.values;
    swap(values, 0, values.length - 1);
    let rootIndex = 0;
    let leftIndex = 2 * rootIndex + 1;
    let rightIndex = 2 * rootIndex + 2;
    while (
      (values[leftIndex] && values[rootIndex] < values[leftIndex]) ||
      (values[rightIndex] && values[rootIndex] < values[rightIndex])
    ) {
      if (values[leftIndex] > values[rightIndex]) {
        swap(values, rootIndex, leftIndex);
        rootIndex = leftIndex;
      } else {
        swap(values, rootIndex, rightIndex);
        rootIndex = rightIndex;
      }
      leftIndex = 2 * rootIndex + 1;
      rightIndex = 2 * rootIndex + 2;
    }
    values.pop();
    return values;
  }
}

function swap(arr, leftIndex, rightIndex) {
  let temp = arr[leftIndex];
  arr[leftIndex] = arr[rightIndex];
  arr[rightIndex] = temp;
}

let heap = new MaxBinaryHeap();
heap.remove();
console.log(heap.values);
