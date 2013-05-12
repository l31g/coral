#cordbconn
server="";
user="";
password="memory";
port="";
DBName="";
type="sqlite";
#enddbconn

#cordb
Table User {
    name : string;
    age : int;
    primary_key(name);
 };
#enddb

void main() {

	File f;
	string b;
	connectDB;
	f = fopen("output", "w");
	fprintf(f, "hello");
	fprintf(f, c.name);
	b = freadline(f);
	
	while (b != "" ) {
        	printf(b);
        	b = freadline(f);
    	}

    	fclose(f);

	closeDB;

}
