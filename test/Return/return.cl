
int derp(){
	return 10;
}

int main() {

	int a = 5;
	
	int b = derp();

	printf(b);
	printf("\n");

	if(a > 10){
		return a;
	}	
	else{
    /* Coral does not handle return in else */
		return a;
	}

	return 5;
}
