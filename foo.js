function mergeSort(arr) {
  if (arr.length <= 1) return arr;

  let midIdx = Math.floor(arr.length / 2);
  let left = mergeSort(arr.slice(0, midIdx));
  let right = mergeSort(arr.slice(midIdx, arr.length));

  return merge(left, right);
}

function merge(left, right) {
  result = [];
  let i = 0;
  let j = 0;

  while (left[i] != undefined && right[j] != undefined) {
    if (left[i] < right[j]) {
      result.push(left[i]);
      i++;
    } else {
      result.push(right[j]);
      j++;
    }
  }

  while (left[i] != undefined) {
    result.push(left[i]);
    i++;
  }

  while (right[j] != undefined) {
    result.push(right[j]);
    j++;
  }

  return result;
}

console.log(merge([1, 2], [3, 4]));
console.log(merge([1, 2, 4], [3, 4, 8]));

console.log(mergeSort([1, 2, 3, 4, 0]));
console.log(mergeSort([1, 2, 4, 5, 5, 9]));
console.log(mergeSort([]));
