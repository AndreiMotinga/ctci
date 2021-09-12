console.log(sort([2, 1, 10, 5, 8, 9, 2]));

function sort(arr) {
  if (arr.length <= 1) return arr;
  let left = arr.splice(0, arr.length / 2);
  return merge(sort(left), sort(arr));
}

function merge(left, right) {
  let result = [];
  let i = 0;
  let j = 0;

  while (left[i] || right[j]) {
    // if something on the left but nothing on the right, push whatever is on the left
    if (left[i] && !right[j]) {
      result.push(left[i]);
      i++;
    }

    // if something on the right but nothing on the left, push whatever is on the right
    if (right[j] && !left[i]) {
      result.push(right[j]);
      j++;
    }

    // compare left and right, push smallest
    if (left[i] && right[j]) {
      if (left[i] < right[j]) {
        result.push(left[i]);
        i++;
      } else {
        result.push(right[j]);
        j++;
      }
    }
  }

  return result;
}
