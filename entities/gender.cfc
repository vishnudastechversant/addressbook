component persistent="true"  entityname="gender" table="gender" {

    property name="id" column="id" fieldtype="id" generator="increment";
    property name="name" column="name" ormtype="string";
}