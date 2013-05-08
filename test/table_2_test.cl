#cordbconn
server="server";
port="1337";
user="user";
password="pass";
type="dbType";
DBName="DBName";
#enddbconn

#cordb
Table test {
    score : void;
    primary_key(score);
 };
#enddb

void main() {

    printf("Hello");
}