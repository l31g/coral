#cordbconn
server="server";
user="server";
password="server";
port="server";
type="sqlite";
DBName="server";
#enddbconn

#cordb
Table Blue {
  name:string;
  primary_key(name);
 };
#enddb


void main() {
  int a = 0;
  user_t Blue b = Blue(name="Coral");
}
