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

	int i = 0;
	for (i = 0; i < 10; i++) {
		i *= 2;
		printf(i);
		printf("\n");
	}
	printf(i);

}
