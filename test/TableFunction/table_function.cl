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
    name : String;
    primary_key(name);

    String getName(){
    	return name;
    }
 };
#enddb

void main() {

    connectDB();
    ed_user = User(name="ed");
    printf(ed_user);
    printf("a", "b", "c", "d");
}
