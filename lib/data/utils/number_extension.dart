
extension NumberFormat on int{
  numerFormatEasytToRead() {
    this; // kiritilgan n raqam
    String s = '';  // ketadigan String
    if("$this".length%3==0){
      for (int i = 0; i < "$this".length; i++){
        s=s + "$this"[i];
        if (i == 2 || i == 5 || i == 8 || i == 11 || i==14 || i==17 || i==20 || i==23) {
          s = '$s ';
        }
      }
      return s;
    }
    else if("$this".length%3==1){
      for (int i = 0; i < "$this".length; i++){
        s=s + "$this"[i];
        if (i == 0 || i == 3 || i == 6 || i == 9|| i==12 || i==15 || i==18 || i==21 || i==24) {
          s = '$s ';
        }
      }
      return s;
    }
    else if("$this".length%3==2){
      for (int i = 0; i < "$this".length; i++){
        s=s + "$this"[i];
        if ( i == 1 || i == 4 || i == 7 || i == 10 || i==13 || i==16 || i==19 || i==22 || i==25) {
          s = '$s ';
        }
      }
      return s;
    }
    else {return s;}
  }
}