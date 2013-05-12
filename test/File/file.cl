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
	
  fclose(f);

	closeDB;

}
