#cordbconn
server="server";
user="server";
password="server";
port="server";
DBName="server";
type="sqlite";
#enddbconn

#cordb
#enddb

void main() {

	int a = 1;

	if (a > 5) {
		a = 4;
		return a;
	} 
	else {
		a = 5;
		printf("Simple else works\n");
		return a;
	}	
}
