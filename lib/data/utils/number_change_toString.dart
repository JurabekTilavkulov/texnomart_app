String numberChange(int n){
  String s='';
  try{
    for(int i=0;i<n.toString().length;i++){
      s+n.toString()[i];
      if((n%3==0 && i==2) ||i==5 || i==8 || i==11 ) s+' ';
      if((n%3==1 && i<1) || i==3 ||i==6 || i==9 ) s+' ';
      if((n%3==2 && i==1) || i==4 || i==7 || i==10) s+' ';
    }
    return s;
  }
  catch(e){
    return s='error';
  }

}