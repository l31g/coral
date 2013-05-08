#cordbconn
server="server";
user="server";
password="server";
port="server";
DBName="server";
type="server";
#enddbconn

#cordb
Table test {
    score : void;
    primary_key(score);
    void main() {
        printf("hi");
    }
 };
#enddb

void main() {

    printf("Hello");
}