var arr = Array(100)
            .fill(0)
            .map((val, index, array) => 
              pass(val, 1, index, array));

console.log(arr.join(''));

function pass(val, skip, index, array) {
  if (skip > array.length) return val;
  if ((index + 1) % skip == 0) val = val ? 0 : 1;
  return pass(val, ++skip, index, array);
}