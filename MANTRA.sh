# zad1
proj1="Kod/$1"
proj2="Kod/$1/src"
mkdir "$proj2"/{main,test}/{java,resources} -p
mkdir "$proj2"/main/java/"$2"/"$1" -p

# zad2
echo "package "$2"."$1";

public class Main {

	public static void main(String[] arg) {
	}
}" >>  "$proj2"/main/java/"$2"/"$1"/Main.java
# zad3
git init "$proj1"

curl -L https://raw.githubusercontent.com/LukaszProkop/mantra/master/.gitignore > "$proj1"/.gitignore
curl -L https://raw.githubusercontent.com/LukaszProkop/mantra/master/pom.xml > "$proj1"/pom.xml
cd "$proj1"/
sed -i s/#GROUP/"$2"/g pom.xml
sed -i s/#APP/"$1"/g pom.xml
sed -i s/#NAME/"$1"/g pom.xml
flatpak run --branch=stable --arch=x86_64 --command=idea com.jetbrains.IntelliJ-IDEA-Community pom.xml &
