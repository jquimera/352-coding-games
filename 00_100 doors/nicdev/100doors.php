<?php 

$limit = 100; // max number of passes through all doors
$pass = 1; // start on the first door
$doors = array_fill($pass, $limit, 'closed'); // set up the XX doors

while($pass <= $limit) {
  // reset $skip to begin at the $pass index, and skip 
  // as many doors
  $skip = $pass; 

  // Pass through the doors
  while($skip <= $limit) {
    $doors[$skip] = $doors[$skip] === 'open' ? 'closed' : 'open';
    $skip += $pass; //next door to check
  }

  $pass++; // increase pass counter
}

// output the final state
foreach($doors as $k => $d) {
  echo "Door $k is $d <br>";
}