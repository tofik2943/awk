{isCommented=0;
if(NF==0){
	printf("%d%s", NR, $0)
}
for(i=1; i<=NF; i++){
 	if(($i ~ "//")){
		isCommented=1;
		if(i==1){
		printf("%s",NR);
		}
	}
	if(isCommented==0){
		if(i==1){
		printf("%d %s %s", NR, $1, FS);
		}
      	 	else if(i==NF){
		printf("%s", $i);
		}
		else{
		printf("%s%s", $i, FS);
		}
	}
}
printf("%s",RS);
isCommented=0;
}
