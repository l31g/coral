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

    connectDB;
    ed_user = User(name="ed");
    printf("a", "b", "c", "d");
    ed_user.add();
    a = User.get();

    for(i = 0; i < 1; i++) {
        a[i];
    }

    closeDB;

}
