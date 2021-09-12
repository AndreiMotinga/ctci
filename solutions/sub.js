function maxSubarray(arr, num) {
  if (arr.length < num) return null;

  let sum = 0;
  for (let i = 0; i < num; i += 1) {
    sum += arr[i]; // 300
  }

  let leftIndex = 0;
  let rightIndex = num; // 3
  let max = sum; // 300

  while (rightIndex < arr.length) {
    sum = sum - arr[leftIndex] + arr[rightIndex];
    if (sum > max) {
      max = sum;
    }
    leftIndex += 1;
    rightIndex += 1;
  }

  return max;
}

console.log(maxSubarray([100, 200, 300, 400], 2));
