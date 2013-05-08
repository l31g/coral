#cordbconn
server="server";
user="server";
password="server";
port="server";
DBName="server";
type="server";
#enddbconn

#cordb
Table User {
    name : String;
    primary_key(name);
 };
#enddb

void main() {

    ed_user = User(name="ed");
    printf("a", "b", "c", "d");
}