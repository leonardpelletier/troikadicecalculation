int[][] pgrid = new int[12][12];
int numRolls = 100000;

void setup() {
  String lzero1 = "";
  String lzero2 = "";
  println ("     1   2   3   4   5   6   7   8   9  10  11  12");
  print(" 1|");
  for (int skillA = 0; skillA < 12; skillA++) {
    for (int skillB = 0; skillB < 12; skillB++) {
      int percent = calculateFight(skillA+1, skillB+1);
      if (percent < 10) {
        lzero1 = " ";
        lzero2 = " ";
      } else if (percent < 100) {
        lzero1 = " ";
        lzero2 = "";
      } else {
        lzero1 = "";
        lzero2 = "";
      }
      print(lzero1 + lzero2 + percent + "|");
      pgrid[skillA][skillB] = percent;
    }
    println("");
    if (skillA+2 < 10) lzero1 = " "; else lzero1 = "";
    print(lzero1 + (skillA+2) + "|");
  }
}

int calculateFight (int skillA, int skillB) {
  double numWins = 0;
  for (int i = 0; i < numRolls; i++) {
    double rollA = d6(2) + skillA;
    double rollB = d6(2) + skillB;
    if (rollA>rollB) numWins++;
  }
  return (int)(numWins/numRolls*100);
}

int d6(int numRolls) {
  int sum = 0;
  for (int i = 0; i < numRolls; i++) {
    sum += (int)random(1, 7);
  }
  return sum;
}
