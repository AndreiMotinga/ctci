function insertion(arr) {
  // mark first as sorted
  // for each unsorted el in unsorted section
  //  for each sorted el in sorted
  //      if sorted > unsorted
  //         move sorted 1 to the rigth
  //      else
  //        insert unsorted element
  //        break

  for (let i = 1; i < arr.length; i += 1) {
    console.log("start", arr);
    let temp = arr[i];

    for (let j = i - 1; j >= 0; j--) {
      if (arr[j] > temp) {
        console.log(`last sorted ${arr[j]} is more than temp ${temp}`);
        console.log(`moving ${arr[j]} to the right`);
        arr[j + 1] = arr[j];
      } else {
        console.log(`inserting ${temp} after ${arr[j]}`);
        arr[j + 1] = temp;
        break;
      }
    }

    console.log("restult", arr);
    console.log("****************");
  }

  return arr;
}

console.log(insertion([1, 4, 3, 6, 8, 1, 14]));
