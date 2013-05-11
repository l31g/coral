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
    connectDB;
    f = fopen("output", "r");
    ed_user = User(name="ed");
    printf("a", "b", "c", "d");
    ed_user.add();
    a = User.get();
    fprintf(f, "hello");
    c = a[0];
    fprintf(f, c.name);
    b = freadline(f);
    while (b != "" ) {
        printf(b);
        b = freadline(f);
    }
    fclose(f);
    for(i = 0; i < 1; i++) {
        a[i];
    }

    closeDB;

}
