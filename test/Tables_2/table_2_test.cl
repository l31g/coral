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
    primary_key(name);
 };
#enddb

void main() {

    File f = open("output.txt", "rw");
    connectDB;
    //int f = 1;

    ed_user = User(name="ed");
    printf("a", "b", "c", "d");
    ed_user.add();
    a = User.get();
    //f.write("hello");
    for(i = 0; i < 1; i++) {
        a[i];
    }

    closeDB;

}
