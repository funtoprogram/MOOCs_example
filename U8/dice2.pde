int [] dice = new int[5];

for(int i=0; i<=dice.length-1; i++){
  dice[i] = floor(random(6))+1;
}

println(dice);

//for+array
//exception: out of bounds!!
//arrayname.length-1
