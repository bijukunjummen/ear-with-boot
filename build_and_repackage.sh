mvn clean package

pushd eartest-ear/target/

mkdir ear

mv eartest-ear.ear ear/

pushd ear/

jar -xvf eartest-ear.ear
rm eartest-ear.ear

mv war-with-boot-1.0.war war-with-boot-1.0

pushd META-INF/
    sed -i -e 's/war-with-boot-1.0.war/war-with-boot-1.0/g' application.xml
popd

jar -cvf eartest-ear.ear .

popd

mv ear/eartest-ear.ear .
rm -rf ear
