function selectionSort(arr) {
  for (let i = 0; i < arr.length - 1; i += 1) {
    console.log(arr);
    let unsortedIndex = i;
    let minIndex = i;

    for (let j = i; j < arr.length; j += 1) {
      if (arr[j] < arr[minIndex]) {
        minIndex = j;
      }
    }

    if (arr[unsortedIndex] > arr[minIndex]) {
      console.log("swapping", arr[unsortedIndex], arr[minIndex]);
      swap(arr, unsortedIndex, minIndex);
    }
  }

  return arr;
}

function swap(arr, left, right) {
  let temp = arr[left];
  arr[left] = arr[right];
  arr[right] = temp;
}

console.log(selectionSort([2, 3, 9, 4, -1, 6]));
